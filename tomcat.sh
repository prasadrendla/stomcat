#!/bin/bash
sudo apt update
sudo apt install zip -y
sudo apt install openjdk-17-jre-headless -y 
sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.76/bin/apache-tomcat-9.0.76.zip
sudo unzip apache-tomcat-9.0.76.zip
sudo mv apache-tomcat-9.0.76 tomcat9
sudo mv tomcat9 /opt
sudo chown -R ubuntu:ubuntu /opt/tomcat9
sudo chmod +x /opt/tomcat9/bin/*
./opt/tomcat9/bin/startup.sh
 sudo sed -i '21,22 s/^/<!-- /; 21,22 s/$/ -->/' /opt/tomcat9/webapps/manager/META-INF/context.xml
sudo sed -i '21,22 s/^/<!-- /; 21,22 s/$/ -->/' /opt/tomcat9/webapps/host-manager/META-INF/context.xml
sed -i '/<\/tomcat-users>/i \
<role rolename="manager-gui"/>\
<role rolename="admin-gui"/>\
<user username="manager" password="12345" roles="manager-gui"/>\
<user username="admin" password="12345" roles="admin-gui"/>' /opt/tomcat9/conf/tomcat-users.xml
./opt/tomcat9/bin/catalina.sh
./opt/tomcat9/bin/shutdown.sh
./opt/tomcat9/bin/startup.sh
