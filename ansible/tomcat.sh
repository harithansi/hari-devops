#!/bin/bash
cd /usr/local
#wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz
sudo tar -xvf apache-tomcat-9.0.65.tar.gz
sudo mv apache-tomcat-9.0.65 tomcat9
sudo useradd -r tomcat
sudo chown -R tomcat:tomcat /usr/local/tomcat9
sudo cat  >/etc/systemd/system/tomcat.service <<EOF
[Unit]
Description=Apache Tomcat Server
After=syslog.target network.target

[Service]
Type=forking
User=tomcat
Group=tomcat

Environment=CATALINA_PID=/usr/local/tomcat9/temp/tomcat.pid
Environment=CATALINA_HOME=/usr/local/tomcat9
Environment=CATALINA_BASE=/usr/local/tomcat9

ExecStart=/usr/local/tomcat9/bin/catalina.sh start
ExecStop=/usr/local/tomcat9/bin/catalina.sh stop

RestartSec=10
Restart=always
[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl start tomcat.service
sudo systemctl enable tomcat.service
sudo systemctl status tomcat.service
