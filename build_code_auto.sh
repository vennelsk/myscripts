#!/bin/bash

cd /data/myproj/myproject/employees
mvn clean install

cd /data/apache-tomat/bin
./shutdown.sh
sleep 10
cd /data/apache-tomcat/webapps
mkdir -p /data/backup/
zip -r /data/backup/employee_`date +%d_%h_%H_%M_%S`.zip /data/apache-tomcat/webapps/employee
rm -rf /data/apache-tomcat/webapps/employee/*
mkdir -p /data/apache-tomcat/webapps/employee/
cp -a /data/myproj/myproject/employees/target/SpringHibernateExample.war /data/apache-tomcat/webapps/employee/
cd /data/apache-tomcat/webapps/employee/
jar -xf SpringHibernateExample.war
rm SpringHibernateExample.war
cd /data/apache-tomcat/bin
./startup.sh
sleep 5
#/data/myproj/myproject2/HotelReservation/target/HotelReservation-0.0.1-SNAPSHOT.war

