#!/bin/bash
mkdir -p /data
cd /data
wget http://redrockdigimark.com/apachemirror/tomcat/tomcat-7/v7.0.85/bin/apache-tomcat-7.0.85.tar.gz
tar -zxvf apache-tomcat-7.0.85.tar.gz 
mv apache-tomcat-7.0.85 jenkins
cd jenkins/webapps

if [ -f /usr/bin/wget ]
then
echo "ok.."
else
echo "wget is not installed..installing it now.."
yum install wget -y
fi

wget "https://updates.jenkins-ci.org/latest/jenkins.war"
cd ../bin
java -version
if [ $? = 0 ]
then
./startup.sh
else
echo "Install Java & try again"
fi

