#!/bin/bash
mkdir -p /data
cd /data
wget http://redrockdigimark.com/apachemirror/tomcat/tomcat-7/v7.0.85/bin/apache-tomcat-7.0.85.tar.gz
mv apache-tomcat-7.0.85 jenkins
cd jenkins/webapps
wget "https://updates.jenkins-ci.org/latest/jenkins.war"
cd ../bin
java -version
if [ $? = 0 ]
then
./startup.sh
else
echo "Install Java & try again"
fi

