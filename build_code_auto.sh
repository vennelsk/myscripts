#!/bin/bash

cd /data/myproj/myproject/employees
mvn clean install

cd /data/apache-tomcat-7.0.85/bin
./shutdown.sh
sleep 10
cd /data/apache-tomcat-7.0.85/webapps
mkdir -p /data/backup/
zip -r /data/backup/employee_`date +%d_%h_%H_%M_%S`.zip
rm -rf /data/apache-tomcat-7.0.85/webapps/employee/*
mkdir -p /data/apache-tomcat-7.0.85/webapps/employee/
cp -a /data/myproj/myproject/employees/target/SpringHibernateExample.war /data/apache-tomcat-7.0.85/webapps/employee/
cd /data/apache-tomcat-7.0.85/webapps/employee/
jar -xf SpringHibernateExample.war
rm SpringHibernateExample.war
cd /data/apache-tomcat-7.0.85/bin
./startup.sh
#/data/myproj/myproject2/HotelReservation/target/HotelReservation-0.0.1-SNAPSHOT.war

