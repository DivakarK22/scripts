import requests
import re
import psycopg2
from datetime import datetime

THREAD_URL = ""
AUTH = ('devops', 'devops')  # API credentials

conn = psycopg2.connect(
    host="",
    port=5432,
    database="jstack",
    user="jstack",
    password="jstack"
)

def parse_threads(data):
    threads = []
    current_thread = None
    for line in data.splitlines():
        line = line.strip()
        if line.startswith('"') and 'prio=' in line:
            if current_thread and current_thread['status'] == "BLOCKED":
                threads.append(current_thread)
            thread_match = re.match(r'"(.*?)"\s+daemon prio=(\d+)\s+(\w+)', line)
            if thread_match:
                name, prio, status = thread_match.groups()
                current_thread = {
                    'name': name,
                    'priority': prio,
                    'status': status,
                    'dump': line + '\n'
                }
            else:
                current_thread = None
        elif current_thread:
            current_thread['dump'] += line + '\n'
    if current_thread and current_thread['status'] == "BLOCKED":
        threads.append(current_thread)
    return threads

def insert_to_db(threads):
    cur = conn.cursor()
    for t in threads:
        cur.execute(
            "INSERT INTO jenkins_threads (timestamp, thread_name, priority, status, full_dump) VALUES (%s, %s, %s, %s, %s)",
            (datetime.utcnow(), t['name'], t['priority'], t['status'], t['dump'])
        )
    conn.commit()
    cur.close()

def main():
    response = requests.get(THREAD_URL, auth=AUTH)
    if response.status_code == 200:
        threads = parse_threads(response.text)
        insert_to_db(threads)
        print(f"[INFO] Inserted {len(threads)} BLOCKED threads into DB.")
    else:
        print(f"[ERROR] Failed to fetch thread dump: {response.status_code}")

if __name__ == "__main__":
    main()
