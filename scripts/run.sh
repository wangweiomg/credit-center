#!/bin/bash

CODE_PATH='/home/jack/git/credit-center'
TOMCAT_PATH='/home/jack/tomcat-credit'

# 1. pull code
function updateCode(){
    cd $CODE_PATH
    echo " "
    echo -e "\033[35m start update project source code \033[0m"
    git pull
    git reset --hard origin/master

    echo -e "\033[35m end update project source code \033[0m"

}


# 2. package war
function package(){

    cd $CODE_PATH
    echo -e "\033[35m start package project \033[0m"
    mvn clean package -U -DskipTests
    echo -e "\033[35m end package project \033[0m"
}


# 3. stop tomcat and clear ROOT
function stopServer(){
    bash $TOMCAT_PATH/bin/shutdown.sh
    sleep 5

}
#rm -rf $TOMCAT_PATH/webapps/ROOT/*

# 4. mv war to tomcat ROOT and unzip
function copyFiles(){
    unzip -o $CODE_PATH/credit-webapp/target/credit.war -d $TOMCAT_PATH/webapps/ROOT/

}

# 5. start tomcat
function run(){

    bash $TOMCAT_PATH/bin/startup.sh
}

# 6. watch
function watch(){
    tail -f -n100 $TOMCAT_PATH/logs/catalina.out |
        while IFS= read line
            do
                echo "$line"
                if [[ "$line" == *"Server startup in"* ]];then
                    echo -e "\033[35m success $line \033[0m"
                    pkill tail
                fi
        done

}



### function calls

updateCode

package

stopServer

copyFiles

run

watch

