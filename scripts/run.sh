#!/bin/bash

CODE_PATH='/home/jack/git/credit-center'
TOMCAT_PATH='/home/jack/tomcat-credit'
# 1. pull code
cd $CODE_PATH
git pull
git reset --hard origin/master
# 2. package war
cd $CODE_PATH
mvn clean package -DskipTests
# 3. stop tomcat and clear ROOT
bash $TOMCAT_PATH/bin/shutdown.sh
sleep 2
#rm -rf $TOMCAT_PATH/webapps/ROOT/*

# 4. mv war to tomcat ROOT and unzip
unzip -o $CODE_PATH/credit-webapp/target/credit.war -d $TOMCAT_PATH/webapps/ROOT/

# 5. start tomcat
bash $TOMCAT_PATH/bin/startup.sh

# 6. watch
tail -f -n100 $TOMCAT_PATH/logs/catalina.out



