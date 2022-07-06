cd /opt 
sudo yum update -y
sudo yum install java -y
sudo yum install wget -y
sudo yum install unzip -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.6.zip
unzip sonarqube-7.6.zip
cd sonarqube-7.6
adduser sonar
sudo chown -R sonar:sonar /opt/sonarqube-7.6/*
sudo chmod -R 777 /opt/sonarqube-7.6/*
sudo echo "sonar 	ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
sudo su - sonar -c "cd /opt/sonarqube-7.6/bin/linux-x86-64;./sonar.sh start"
sudo cat >>/etc/rc.d/rc.local <<EOF
su - sonar -c "cd /opt/sonarqube-7.6/bin/linux-x86-64;./sonar.sh start"
EOF
chmod +x /etc/rc.d/rc.local
echo "credentials are admin/admin and please use http://ip:9000 to access sonarcube"
