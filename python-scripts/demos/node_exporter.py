import requests
import re

url = "http://home:8080/prometheus/"
u = "devops"
p = "devops"
grep = ["BLOCKED","jenkins_queue_buildable_value",'jenkins_project_count_history{quantile="0.999"']

def metrics(url,u,p,grep):
    try:
        response = requests.get(url,auth=(u,p))
        if response.status_code == 200:
            for line in response.text.split('\n'):
                for output in grep:
                    if output in line:
                        print(line)
                        break
        else:
            print("ERROR")

    except Exception as e:
        print("ERROR:",e)
        
metrics(url,u,p,grep)


CREATE TABLE jenkins (
    column1 jenkins_project_count_history{quantile="0.999",},
    column2 default_jenkins_executors_available{label="built-in",},
    column2 default_jenkins_executors_available{label="Ansible(deploy)",},
    column2 default_jenkins_executors_available{label="host",},
    column2 jvm_threads_state{state="BLOCKED",}
    
);

jenkins_project_count_history{quantile="0.999",} 39.0
default_jenkins_executors_available{label="built-in",} 0.0
default_jenkins_executors_available{label="Ansible(deploy)",} 5.0
default_jenkins_executors_available{label="host",} 5.0
jvm_threads_state{state="BLOCKED",} 0.0

INSERT INTO metric_data (metric_name, label, value) VALUES
('jenkins_project_count_history', 'quantile="0.999"', 22),
('default_jenkins_executors_available', 'label="built-in"', 42),
('default_jenkins_executors_available', 'label="Ansible(deploy)"', 30),
('default_jenkins_executors_available', 'label="host"', 18),
('jvm_threads_state', 'state="BLOCKED"', 59);

import java.lang.management.ManagementFactory;
import java.lang.management.ThreadInfo;
import java.lang.management.ThreadMXBean;

public class ThreadStateExample {
    public static void main(String[] args) {
        // Get the ThreadMXBean instance
        ThreadMXBean threadMXBean = ManagementFactory.getThreadMXBean();

        // Get the IDs of all threads
        long[] threadIds = threadMXBean.getAllThreadIds();

        // Iterate through each thread
        for (long threadId : threadIds) {
            ThreadInfo threadInfo = threadMXBean.getThreadInfo(threadId);
            if (threadInfo != null) {
                // Get the state of the thread
                Thread.State state = threadInfo.getThreadState();
                // Check if the thread belongs to the desired instance
                // (you can implement your own logic here)
                if (threadInfo.getThreadName().contains("YourInstanceName")) {
                    System.out.println("Thread name: " + threadInfo.getThreadName());
                    System.out.println("Thread state: " + state);
                }
            }
        }
    }
}
