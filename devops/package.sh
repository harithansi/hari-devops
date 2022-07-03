sudo yum install wget -y
sudo yum install net* -y
sudo yum install java-1.8.0-openjdk.x86_64 -y
cd /opt
sudo wget http://download.sonatype.com/nexus/3/nexus-3.23.0-03-unix.tar.gz
sudo tar -xf nexus-3.23.0-03-unix.tar.gz
sudo mv nexus-3.23.0-03 nexus
sudo adduser nexus
sudo chown -R nexus:nexus /opt/nexus
sudo chown -R nexus:nexus /opt/sonatype-work
sudo chmod 777 /opt/nexus/bin/nexus.vmoptions
sudo chmod 777 /opt/nexus/bin/nexus.rc
sudo chmod 777 /etc/systemd/system/nexus.service
sudo cat >/opt/nexus/bin/nexus.rc << EOF
run_as_user="nexus"
EOF
sudo cat > /opt/nexus/bin/nexus.vmoptions << EOF

-Xms512m
-Xmx512m
-XX:MaxDirectMemorySize=512m
-XX:+UnlockDiagnosticVMOptions
-XX:+LogVMOutput
-XX:LogFile=../sonatype-work/nexus3/log/jvm.log
-XX:-OmitStackTraceInFastThrow
-Djava.net.preferIPv4Stack=true
-Dkaraf.home=.
-Dkaraf.base=.
-Dkaraf.etc=etc/karaf
-Djava.util.logging.config.file=etc/karaf/java.util.logging.properties
-Dkaraf.data=../sonatype-work/nexus3
-Dkaraf.log=../sonatype-work/nexus3/log
-Djava.io.tmpdir=../sonatype-work/nexus3/tmp
-Dkaraf.startLocalConsole=false
#
# additional vmoptions needed for Java9+
#
# --add-reads=java.xml=java.logging
# --add-exports=java.base/org.apache.karaf.specs.locator=java.xml,ALL-UNNAMED
# --patch-module=java.base=lib/endorsed/org.apache.karaf.specs.locator-4.2.6.jar
# --patch-module=java.xml=lib/endorsed/org.apache.karaf.specs.java.xml-4.2.6.jar
# --add-opens=java.base/java.security=ALL-UNNAMED
# --add-opens=java.base/java.net=ALL-UNNAMED
# --add-opens=java.base/java.lang=ALL-UNNAMED
# --add-opens=java.base/java.util=ALL-UNNAMED
# --add-opens=java.naming/javax.naming.spi=ALL-UNNAMED
# --add-opens=java.rmi/sun.rmi.transport.tcp=ALL-UNNAMED
# --add-exports=java.base/sun.net.www.protocol.http=ALL-UNNAMED
# --add-exports=java.base/sun.net.www.protocol.https=ALL-UNNAMED
# --add-exports=java.base/sun.net.www.protocol.jar=ALL-UNNAMED
# --add-exports=jdk.xml.dom/org.w3c.dom.html=ALL-UNNAMED
# --add-exports=jdk.naming.rmi/com.sun.jndi.url.rmi=ALL-UNNAMED
#
# comment out this vmoption when using Java9+
#
-Djava.endorsed.dirs=lib/endorsed



EOF
sudo cat > /etc/systemd/system/nexus.service  << EOF
[Unit]
Description=nexus service
After=network.target
[Service]
Type=forking
LimitNOFILE=65536
User=nexus
Group=nexus
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
[Install]
WantedBy=multi-user.target
EOF
sudo ln -s /opt/nexus/bin/nexus /etc/init.d/nexus
sudo chkconfig --add nexus
sudo chkconfig --levels 345 nexus on
sudo service nexus start
#sudo tail -f /opt/sonatype-work/nexus3/log/nexus.log
echo "Please check Nexus is started or not in nexus.log"
#sleep 15
#sudo cat /opt/sonatype-work/nexus3/admin.password
