#!/bin/bash

read -p "Java is installed in /data/java8? (y/n) " java_ans


if [ $java_ans = y ]
then
read -p "Do you want to install maven? (y/n) " maven_ans
  if [ $maven_ans = y ]
    then
     wget http://redrockdigimark.com/apachemirror/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
     mv apache-maven-3.5.3-bin.tar.gz /data/
     cd /data/
     tar -xzf apache-maven-3.5.3-bin.tar.gz
     echo "set below in .bash_profile\e"MAVEN_HOME=/data/apache-maven-3.5.3-bin\ePATH=\$MAVEN_HOME/bin:\$PATH\eexport MAVEN_HOME PATH\e""
  else
    cd .
    mvn clean install
  fi
else
echo "Please setup Java in /data/java8 and try this again"
fi
