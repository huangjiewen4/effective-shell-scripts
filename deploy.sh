#/bin/bash
echo "enter your project name"
read pn
cd ~/myproject/$pn
svn update
mvn clean package -Dmaven.test.skip=true
if test -e target/$pn.war
then
/root/myshell/shutdown.sh
 mv -f target/$pn.war /home/tomcat/apache-tomcat-8.5.8/webapps/
/root/myshell/startup.sh
else
echo "package fail!"
fi
