import requests
import re

url = http://home:8080/prometheus/
u = devops
p = devops
grep = ["BLOCKED"]

def metrics(url,u,p,grep):
    try:
        response = requests.get(url,auth=(u,p))
        if response.status_code == 200;:
            for line in reponse.text.split('\n'):
                for output in grep:
                    if output in line:
                        print(line)
                        break
        else:
            print("ERROR",reponse.status_code)

    except Exception as e:
        print("ERROR:",e)
        
metrics(url,u,p,grep)
