#!/bin/bash

read -p "Enter the container name you want to build: " container_name
read -p "Enter the port name you want to use: " port
docker rmi -f container_name
docker rm -f container_name
echo "LISTING RUNNING DOCKER CONTAINERS"
docker ps
echo "CREATING GIT DIR"
mkdir /git/ || true
echo "INSTALLING GIT AND CLONING PORTFOLIO REPO"
rm /root/.m2/repository/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war || true
cd /git/ && git clone https://github.com/jleetutorial/maven-project.git || true
dnf install maven -y || true && yum install maven -y || true && cd /git/maven-project && mvn clean install -DskipTests && ll /root/.m2/repository/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war
export JAVA_HOME=/bin/java
source ~/.bashrc
mv /root/.m2/repository/com/example/maven-project/webapp/1.0-SNAPSHOT/webapp-1.0-SNAPSHOT.war /git/test/ROOT.war || true
echo "CREATING DOCKERFILE"
mkdir /git/test/

cat <<EOF > /git/test/Dockerfile
FROM almalinux:latest

RUN dnf install sudo wget epel-release java-11-openjdk-devel  -y && \
    wget --no-check-certificate https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.98/bin/apache-tomcat-8.5.98.tar.gz  -O /tmp/tomcat.tar.gz && \
    tar -xvf /tmp/tomcat.tar.gz -C /tmp/ && \
    mv /tmp/apache-tomcat-8.5.98 /opt/ && \
    mv /opt/apache-tomcat-8.5.98 /opt/tomcat

RUN rm -rf /opt/tomcat/webapps/*

COPY ROOT.war /opt/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
EOF
echo "CREATED DOCKERFILE"
cat /git/test/Dockerfile
cd /git/test/ && docker build -t $container_name . && docker run -d -p $port:8080 $container_name
echo "WEBSITE HOSTED IN PORT localhost:$port"
sleep 10
docker ps