#!/bin/sh

# COMMAND LINE VARIABLES #enviroment FIRST ARGUMENT 
# Ex: develop | frontend | staging | production
serverProfiles=production

#enviroment SECOND ARGUMENT 
# Ex: master | develop | self
gitBranchName=master

#enviroment THIRD ARGUMENT 
# Ex: all | admin | batch | worker | sse
appName=$1

#### CONFIGURABLE VARIABLES ######
sourceCodeName=credit_java
sourceCodePath=~/git/$sourceCodeName
migrationPath=$sourceCodePath/crm/crm-migration/
runPath=~/bin
runPidPath=$runPath/pid
logPath=~/log
logServerStartPath=$logPath/server-start
gitPath=~/git
appNum=5

### FUNCTIONS
##############
function validationParams(){
    if [[ "production" != "$serverProfiles" && "staging" != "$serverProfiles" && "frontend" != "$serverProfiles" && "develop" != "$serverProfiles" ]]; then
        echo -e "\033[31m first param serverProfiles: $serverProfiles must is develop | frontend | staging | production ! \033[0m"
        exit 2
    fi

}

function createDirectory(){
    cd ~
    echo " "
    echo -e "\033[35m start create must directory \033[0m"
    mkdir -p $runPath
    mkdir -p $runPidPath
    mkdir -p $logPath
    mkdir -p $logServerStartPath
    mkdir -p $gitPath
    echo -e "\033[35m end create must directory \033[0m"
    echo " "
}

function updateCode(){
    cd $sourceCodePath
    echo " "
    echo -e "\033[35m start update project source code: $sourceCodeName \033[0m"
    if [[ "" == "$gitBranchName" ]]; then
        git checkout develop
        git pull
    elif [[ "production" == "$serverProfiles" ]]; then
        $gitBranchName = master 
        git checkout $gitBranchName
        git fetch
        git reset --hard origin/$gitBranchName
    else
        git checkout $gitBranchName
        git fetch
        git reset --hard origin/$gitBranchName    
    fi
    echo -e "\033[35m end update project source code: $sourceCodeName, branchName: $gitBranchName \033[0m"
    echo " "
}

function package(){
    cd $sourceCodePath
    echo " "
    echo -e "\033[35m start package project $sourceCodeName \033[0m"
    mvn clean package -U -Dmaven.test.skip=true
    echo -e "\033[35m end package project $sourceCodeName \033[0m"
    echo " "
} 
function cleanLog(){
    echo " "
}

function cleanDB(){
    echo " "
}

function stopServer(){
    echo " "
    echo -e "\033[35m start stop server"
    #FUNCTION 1
#    echo -e "\033[35m Stoping process on port: 8081 \033[0m"
#    curl -X POST localhost:8081/shutdown --connect-timeout 2 -m 3
#    if [[ "staging" == "$serverProfiles" || "production" == "$serverProfiles" ]]; then
#        echo -e "\033[35m Stoping process on port: 8082 \033[0m"
#        curl -X POST localhost:8082/shutdown --connect-timeout 2 -m 3
#        echo -e "\033[35m Stoping process on port: 8083 \033[0m"
#        curl -X POST localhost:8083/shutdown --connect-timeout 2 -m 3
#    fi
#    sleep 3
    #FUNCTION 2
#    echo -e "\033[35m Stoping process on port: 8081 \033[0m"
#    fuser -n tcp -k 8081 > redirection &
#    if [[ "staging" == "$serverProfiles" || "production" == "$serverProfiles" ]]; then
#        echo -e "\033[35m Stoping process on port: 8082 \033[0m"
#        fuser -n tcp -k 8082 > redirection &
#        echo -e "\033[35m Stoping process on port: 8083 \033[0m"
#        fuser -n tcp -k 8083 > redirection &
#    fi
#    sleep 1
    #FUNCTION3
    if [[ "production" == "$serverProfiles" ]]; then
        if [[ "admin" == "$appName" ]]; then
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-admin-production1.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-admin-production1.pid)
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-admin-production2.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-admin-production2.pid)

            sleep 5

            kill -9 $(cat $runPidPath/crm-web-admin-production1.pid)
            kill -9 $(cat $runPidPath/crm-web-admin-production2.pid)
            rm -rf $runPidPath/crm-web-admin-production1.pid
            rm -rf $runPidPath/crm-web-admin-production2.pid

        elif [[ "batch" == "$appName" ]]; then
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-batch-production.pid) \033[0m"
            kill $(cat $runPidPath/crm-batch-production.pid)

            sleep 5

            kill -9 $(cat $runPidPath/crm-batch-production.pid)
            rm -rf $runPidPath/crm-batch-production.pid

        elif [[ "worker" == "$appName" ]]; then
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-worker-production.pid) \033[0m"
            kill $(cat $runPidPath/crm-worker-production.pid)

            sleep 5

            kill -9 $(cat $runPidPath/crm-worker-production.pid)
            rm -rf $runPidPath/crm-worker-production.pid

        elif [[ "sse" == "$appName" ]]; then
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-sse-production.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-sse-production.pid)

            sleep 5

            kill -9 $(cat $runPidPath/crm-web-sse-production.pid)
            rm -rf $runPidPath/crm-web-sse-production.pid

	elif [[ "api" == "$appName" ]]; then
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-api-production1.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-api-production1.pid)

            sleep 5

            kill -9 $(cat $runPidPath/crm-web-api-production1.pid)
            rm -rf $runPidPath/crm-web-api-production1.pid

        else
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-admin-production1.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-admin-production1.pid)
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-admin-production2.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-admin-production2.pid)
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-batch-production.pid) \033[0m"
            kill $(cat $runPidPath/crm-batch-production.pid)
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-worker-production.pid) \033[0m"
            kill $(cat $runPidPath/crm-worker-production.pid)
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-sse-production.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-sse-production.pid)
	    echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-api-production1.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-api-production1.pid)
            sleep 5

            kill -9 $(cat $runPidPath/crm-web-admin-production1.pid)
            kill -9 $(cat $runPidPath/crm-web-admin-production2.pid)
            kill -9 $(cat $runPidPath/crm-batch-production.pid)
            kill -9 $(cat $runPidPath/crm-worker-production.pid)
            kill -9 $(cat $runPidPath/crm-web-sse-production.pid)
	    kill -9 $(cat $runPidPath/crm-web-api-production1.pid)
            rm -rf $runPidPath/*
        fi
    elif [[ "staging" == "$serverProfiles" ]]; then
        if [[ "admin" == "$appName" ]]; then
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-admin-staging1.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-admin-staging1.pid)
#            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-admin-staging2.pid) \033[0m"
#            kill $(cat $runPidPath/crm-web-admin-staging2.pid)

            sleep 5

            kill -9 $(cat $runPidPath/crm-web-admin-staging1.pid)
#            kill -9 $(cat $runPidPath/crm-web-admin-staging2.pid)
            rm -rf $runPidPath/crm-web-admin-staging1.pid
#            rm -rf $runPidPath/crm-web-admin-staging2.pid

        elif [[ "batch" == "$appName" ]]; then
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-batch-staging.pid) \033[0m"
            kill $(cat $runPidPath/crm-batch-staging.pid)

            sleep 5

            kill -9 $(cat $runPidPath/crm-batch-staging.pid)
            rm -rf $runPidPath/crm-batch-staging.pid

        elif [[ "worker" == "$appName" ]]; then
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-worker-staging.pid) \033[0m"
            kill $(cat $runPidPath/crm-worker-staging.pid)

            sleep 5

            kill -9 $(cat $runPidPath/crm-worker-staging.pid)
            rm -rf $runPidPath/crm-worker-staging.pid

        elif [[ "sse" == "$appName" ]]; then
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-sse-staging.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-worker-staging.pid)

            sleep 5

            kill -9 $(cat $runPidPath/crm-web-sse-staging.pid)
            rm -rf $runPidPath/crm-web-sse-staging.pid
            
        else
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-admin-staging1.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-admin-staging1.pid)
#            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-admin-staging2.pid) \033[0m"
#            kill $(cat $runPidPath/crm-web-admin-staging2.pid)
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-batch-staging.pid) \033[0m"
            kill $(cat $runPidPath/crm-batch-staging.pid)
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-worker-staging.pid) \033[0m"
            kill $(cat $runPidPath/crm-worker-staging.pid)
            echo -e "\033[35m Stoping process $(cat $runPidPath/crm-web-sse-staging.pid) \033[0m"
            kill $(cat $runPidPath/crm-web-sse-staging.pid)

            sleep 5

            kill -9 $(cat $runPidPath/crm-web-admin-staging1.pid)
#            kill -9 $(cat $runPidPath/crm-web-admin-staging2.pid)
            kill -9 $(cat $runPidPath/crm-batch-staging.pid)
            kill -9 $(cat $runPidPath/crm-worker-staging.pid)
            kill -9 $(cat $runPidPath/crm-web-sse-staging.pid)
            rm -rf $runPidPath/*
        fi
    else
        echo -e "\033[35m killing process $(cat $runPidPath/crm-web-admin.pid) \033[0m"
        kill -9 $(cat $runPidPath/crm-web-admin.pid)
        rm -rf $runPidPath/*
    fi
    #FUNCTION4
#    killall -9 java
    echo -e "\033[35m end stop server \033[0m"
    echo " "
}

#TODO
function stopMultiServer(){
    for serverPort in $(echo $serverPorts | tr ";" "\n")
        do
            echo " "
            echo -e "\033[35m Stoping process on port: $serverPort \033[0m"
            curl -X POST localhost:$serverPort/shutdown
            sleep 3
            fuser -n tcp -k $serverPort > redirection &
            echo " "

    done
    echo " "
}

function migrate(){
    cd $migrationPath
    echo " "
    echo -e "\033[35m start migration \033[0m"
    mvn flyway:migrate -P $serverProfiles
    echo -e "\033[35m end migration \033[0m"
    echo " "
}

function deleteFiles(){
    echo " "
    echo -e "\033[35m start deleting files \033[0m"
    if [[ "admin" == "$appName" ]]; then
        rm -rf $runPath/*crm-web-admin*.jar
        rm -rf $logPath/server-start/*crm-web-admin*

    elif [[ "batch" == "$appName" ]]; then
        rm -rf $runPath/*crm-batch*.jar
        rm -rf $logPath/server-start/*crm-batch*

    elif [[ "worker" == "$appName" ]]; then
        rm -rf $runPath/*crm-worker*.jar
        rm -rf $logPath/server-start/*crm-worker*

    elif [[ "sse" == "$appName" ]]; then
        rm -rf $runPath/*crm-web-sse*.jar
        rm -rf $logPath/server-start/*crm-web-sse*

    elif [[ "api" == "$appName" ]]; then
        rm -rf $runPath/*crm-web-api*.jar
        rm -rf $logPath/server-start/*crm-web-api*

    else
        rm -rf $runPath/*.jar
        rm -rf $logPath/server-start/*.log
    fi

    rm -rf $logPath/server-start/*.log

    #echo "Deleting $configPath"
    #rm -rf $configPath
    echo -e "\033[35m end deleting files \033[0m"
    echo " "
}

function copyFiles(){
    echo " "
    echo -e "\033[35m start copying files \033[0m"
    if [[ "admin" == "$appName" ]]; then
        if [[ "staging" == "$serverProfiles" || "production" == "$serverProfiles" ]]; then
            cp $sourceCodePath/crm/crm-web-admin/target/crm-web-admin-0.0.1-SNAPSHOT.jar $runPath/crm-web-admin-0.0.1-SNAPSHOT-1.jar
            cp $sourceCodePath/crm/crm-web-admin/target/crm-web-admin-0.0.1-SNAPSHOT.jar $runPath/crm-web-admin-0.0.1-SNAPSHOT-2.jar
        else
            cp $sourceCodePath/crm/crm-web-admin/target/crm-web-admin-0.0.1-SNAPSHOT.jar $runPath/crm-web-admin-0.0.1-SNAPSHOT-1.jar
        fi
    elif [[ "batch" == "$appName" ]]; then
        cp $sourceCodePath/crm/crm-batch/target/crm-batch-0.0.1-SNAPSHOT.jar $runPath/crm-batch-0.0.1-SNAPSHOT.jar
    elif [[ "worker" == "$appName" ]]; then
        cp $sourceCodePath/crm/crm-worker/target/crm-worker-0.0.1-SNAPSHOT.jar $runPath/crm-worker-0.0.1-SNAPSHOT.jar
    elif [[ "sse" == "$appName" ]]; then
        cp $sourceCodePath/crm/crm-web-sse/target/crm-web-sse-0.0.1-SNAPSHOT.jar $runPath/crm-web-sse-0.0.1-SNAPSHOT.jar
    elif [[ "api" == "$appName" ]]; then
        cp $sourceCodePath/crm/crm-web-api/target/crm-web-api-0.0.1-SNAPSHOT.jar $runPath/crm-web-api-0.0.1-SNAPSHOT-1.jar
    else
        if [[ "staging" == "$serverProfiles" || "production" == "$serverProfiles" ]]; then
            cp $sourceCodePath/crm/crm-web-admin/target/crm-web-admin-0.0.1-SNAPSHOT.jar $runPath/crm-web-admin-0.0.1-SNAPSHOT-1.jar
            cp $sourceCodePath/crm/crm-web-admin/target/crm-web-admin-0.0.1-SNAPSHOT.jar $runPath/crm-web-admin-0.0.1-SNAPSHOT-2.jar
        else
            cp $sourceCodePath/crm/crm-web-admin/target/crm-web-admin-0.0.1-SNAPSHOT.jar $runPath/crm-web-admin-0.0.1-SNAPSHOT-1.jar
        fi
        cp $sourceCodePath/crm/crm-batch/target/crm-batch-0.0.1-SNAPSHOT.jar $runPath/crm-batch-0.0.1-SNAPSHOT.jar
        cp $sourceCodePath/crm/crm-worker/target/crm-worker-0.0.1-SNAPSHOT.jar $runPath/crm-worker-0.0.1-SNAPSHOT.jar
        cp $sourceCodePath/crm/crm-web-sse/target/crm-web-sse-0.0.1-SNAPSHOT.jar $runPath/crm-web-sse-0.0.1-SNAPSHOT.jar
	cp $sourceCodePath/crm/crm-web-api/target/crm-web-api-0.0.1-SNAPSHOT.jar $runPath/crm-web-api-0.0.1-SNAPSHOT-1.jar
    fi
    echo -e "\033[35m end copying files \033[0m"
    echo " "
}

function run(){
    cd $runPath
    echo " "
    echo -e "\033[35m start run \033[0m"
    if [[ "production" == "$serverProfiles" ]]; then
        if [[ "admin" == "$appName" ]]; then
            nohup nice java -javaagent:/home/webuser/metrics/newrelic/admin/newrelic.jar -jar crm-web-admin-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=production1 > $logPath/server-start/crm-web-admin-production1-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-production1.pid
            echo -e "\033[35m start server nohup nice java -jar crm-web-admin-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=production1 > $logPath/server-start/crm-web-admin-production1-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-production1.pid
            \033[0m"
            nohup nice java -javaagent:/home/webuser/metrics/newrelic/admin/newrelic.jar -jar crm-web-admin-0.0.1-SNAPSHOT-2.jar --spring.profiles.active=production2 > $logPath/server-start/crm-web-admin-production2-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-production2.pid
            echo -e "\033[35m start server nohup nice java -jar crm-web-admin-0.0.1-SNAPSHOT-2.jar --spring.profiles.active=production2 > $logPath/server-start/crm-web-admin-production2-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-production2.pid
            \033[0m"
        elif [[ "batch" == "$appName" ]]; then
            nohup nice java -javaagent:/home/webuser/metrics/newrelic/batch/newrelic.jar -jar crm-batch-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-batch-production-start.log 2>&1 & echo $! > $runPidPath/crm-batch-production.pid
            echo -e "\033[35m start server nohup nice java -jar crm-batch-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-batch-production-start.log 2>&1 & echo $! > $runPidPath/crm-batch-production.pid
            \033[0m"
        elif [[ "worker" == "$appName" ]]; then
            nohup nice java -javaagent:/home/webuser/metrics/newrelic/worker/newrelic.jar -jar crm-worker-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-worker-production-start.log 2>&1 & echo $! > $runPidPath/crm-worker-production.pid
            echo -e "\033[35m start server nohup nice java -jar crm-worker-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-worker-production-start.log 2>&1 & echo $! > $runPidPath/crm-worker-production.pid
            \033[0m"
        elif [[ "sse" == "$appName" ]]; then
            nohup nice java -javaagent:/home/webuser/metrics/newrelic/sse/newrelic.jar -jar crm-web-sse-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-web-sse-production-start.log 2>&1 & echo $! > $runPidPath/crm-web-sse-production.pid
            echo -e "\033[35m start server nohup nice java -jar crm-web-sse-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-web-sse-production-start.log 2>&1 & echo $! > $runPidPath/crm-web-sse-production.pid
            \033[0m"
	elif [[ "api" == "$appName" ]]; then
            nohup nice java -javaagent:/home/webuser/metrics/newrelic/api/newrelic.jar -jar crm-web-api-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=production1 > $logPath/server-start/crm-web-api-production1-start.log 2>&1 & echo $! > $runPidPath/crm-web-api-production1.pid
            echo -e "\033[35m start server nohup nice java -jar crm-web-api-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=production1 > $logPath/server-start/crm-web-api-production-start.log 2>&1 & echo $! > $runPidPath/crm-web-api-production1.pid
            \033[0m"
        else
            nohup nice java -javaagent:/home/webuser/metrics/newrelic/sse/newrelic.jar -jar crm-web-sse-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-web-sse-production-start.log 2>&1 & echo $! > $runPidPath/crm-web-sse-production.pid
            echo -e "\033[35m start server nohup nice java -jar crm-web-sse-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-web-sse-production-start.log 2>&1 & echo $! > $runPidPath/crm-web-sse-production.pid
            \033[0m"
            nohup nice java -javaagent:/home/webuser/metrics/newrelic/batch/newrelic.jar -jar crm-batch-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-batch-production-start.log 2>&1 & echo $! > $runPidPath/crm-batch-production.pid
            echo -e "\033[35m start server nohup nice java -jar crm-batch-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-batch-production-start.log 2>&1 & echo $! > $runPidPath/crm-batch-production.pid
            \033[0m"
            nohup nice java -javaagent:/home/webuser/metrics/newrelic/worker/newrelic.jar -jar crm-worker-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-worker-production-start.log 2>&1 & echo $! > $runPidPath/crm-worker-production.pid
            echo -e "\033[35m start server nohup nice java -jar crm-worker-0.0.1-SNAPSHOT.jar --spring.profiles.active=production > $logPath/server-start/crm-worker-production-start.log 2>&1 & echo $! > $runPidPath/crm-worker-production.pid
            \033[0m"
            nohup nice java -javaagent:/home/webuser/metrics/newrelic/admin/newrelic.jar -jar crm-web-admin-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=production1 > $logPath/server-start/crm-web-admin-production1-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-production1.pid
            echo -e "\033[35m start server nohup nice java -jar crm-web-admin-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=production1 > $logPath/server-start/crm-web-admin-production1-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-production1.pid
            \033[0m"
            nohup nice java -javaagent:/home/webuser/metrics/newrelic/admin/newrelic.jar -jar crm-web-admin-0.0.1-SNAPSHOT-2.jar --spring.profiles.active=production2 > $logPath/server-start/crm-web-admin-production2-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-production2.pid
            echo -e "\033[35m start server nohup nice java -jar crm-web-admin-0.0.1-SNAPSHOT-2.jar --spring.profiles.active=production2 > $logPath/server-start/crm-web-admin-production2-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-production2.pid
            \033[0m"
	    nohup nice java -javaagent:/home/webuser/metrics/newrelic/api/newrelic.jar -jar crm-web-api-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=production1 > $logPath/server-start/crm-web-api-production1-start.log 2>&1 & echo $! > $runPidPath/crm-web-api-production1.pid
            echo -e "\033[35m start server nohup nice java -jar crm-web-api-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=production1 > $logPath/server-start/crm-web-api-production1-start.log 2>&1 & echo $! > $runPidPath/crm-web-api-production1.pid
            \033[0m"
        fi 
    elif [[ "staging" == "$serverProfiles" ]]; then
        if [[ "admin" == "$appName" ]]; then
            nohup nice -Xmx256m java -jar crm-web-admin-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=staging1 > $logPath/server-start/crm-web-admin-staging1-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-staging1.pid
            echo -e "\033[35m start server nohup nice -Xmx256m java -jar crm-web-admin-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=staging1 > $logPath/server-start/crm-web-admin-staging1-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-staging1.pid
            \033[0m"
#            nohup nice java -Xmx256m -jar crm-web-admin-0.0.1-SNAPSHOT-2.jar --spring.profiles.active=staging2 > $logPath/server-start/crm-web-admin-staging2-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-staging2.pid
#            echo -e "\033[35m start server nohup nice java -Xmx256m -jar crm-web-admin-0.0.1-SNAPSHOT-2.jar --spring.profiles.active=staging2 > $logPath/server-start/crm-web-admin-staging2-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-staging2.pid
#            \033[0m"
        elif [[ "batch" == "$appName" ]]; then
            nohup nice java -Xmx256m -jar crm-batch-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-batch-staging-start.log 2>&1 & echo $! > $runPidPath/crm-batch-staging.pid
            echo -e "\033[35m start server nohup nice java -Xmx256m -jar crm-batch-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-batch-staging-start.log 2>&1 & echo $! > $runPidPath/crm-batch-staging.pid
            \033[0m"
        elif [[ "worker" == "$appName" ]]; then
            nohup nice java -Xmx256m -jar crm-worker-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-worker-staging-start.log 2>&1 & echo $! > $runPidPath/crm-worker-staging.pid
            echo -e "\033[35m start server nohup nice java -Xmx256m -jar crm-worker-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-worker-staging-start.log 2>&1 & echo $! > $runPidPath/crm-worker-staging.pid
            \033[0m"
        elif [[ "sse" == "$appName" ]]; then
            nohup nice java -Xmx256m -jar crm-web-sse-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-web-sse-staging-start.log 2>&1 & echo $! > $runPidPath/crm-web-sse-staging.pid
            echo -e "\033[35m start server nohup nice java -Xmx256m -jar crm-web-sse-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-web-sse-staging-start.log 2>&1 & echo $! > $runPidPath/crm-web-sse-staging.pid
            \033[0m"
        else
            nohup nice java -Xmx256m -jar crm-web-sse-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-web-sse-staging-start.log 2>&1 & echo $! > $runPidPath/crm-web-sse-staging.pid
            echo -e "\033[35m start server nohup nice java -Xmx256m -jar crm-web-sse-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-web-sse-staging-start.log 2>&1 & echo $! > $runPidPath/crm-web-sse-staging.pid
            \033[0m"
            nohup nice java -Xmx256m -jar crm-batch-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-batch-staging-start.log 2>&1 & echo $! > $runPidPath/crm-batch-staging.pid
            echo -e "\033[35m start server nohup nice java -Xmx256m -jar crm-batch-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-batch-staging-start.log 2>&1 & echo $! > $runPidPath/crm-batch-staging.pid
            \033[0m"
            nohup nice java -Xmx256m -jar crm-worker-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-worker-staging-start.log 2>&1 & echo $! > $runPidPath/crm-worker-staging.pid
            echo -e "\033[35m start server nohup nice java -Xmx256m -jar crm-worker-0.0.1-SNAPSHOT.jar --spring.profiles.active=staging > $logPath/server-start/crm-worker-staging-start.log 2>&1 & echo $! > $runPidPath/crm-worker-staging.pid
            \033[0m"
            nohup nice java -Xmx256m -jar crm-web-admin-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=staging1 > $logPath/server-start/crm-web-admin-staging1-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-staging1.pid
            echo -e "\033[35m start server nohup nice java -Xmx256m -jar crm-web-admin-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=staging1 > $logPath/server-start/crm-web-admin-staging1-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-staging1.pid
            \033[0m"
#            nohup nice java -Xmx256m -jar crm-web-admin-0.0.1-SNAPSHOT-2.jar --spring.profiles.active=staging2 > $logPath/server-start/crm-web-admin-staging2-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-staging2.pid
#            echo -e "\033[35m start server nohup nice java -Xmx256m -jar crm-web-admin-0.0.1-SNAPSHOT-2.jar --spring.profiles.active=staging2 > $logPath/server-start/crm-web-admin-staging2-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin-staging2.pid
#            \033[0m"
        fi
    else
        nohup nice java -Xmx256m -jar crm-web-admin-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=$serverProfiles > $logPath/server-start/crm-web-admin-$serverProfiles-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin.pid
        echo -e "\033[35m start server nohup nice java -Xmx256m -jar crm-web-admin-0.0.1-SNAPSHOT-1.jar --spring.profiles.active=$serverProfiles > $logPath/server-start/crm-web-admin-$serverProfiles-start.log 2>&1 & echo $! > $runPidPath/crm-web-admin.pid
         \033[0m"
    fi
    echo -e "\033[35m end run \033[0m"
    echo " "
}

function watch(){
    if [[ "admin" == "$appName" ]]; then
        appNum=2
    elif [[ "batch" == "$appName" ]]; then
        appNum=1
    elif [[ "worker" == "$appName" ]]; then
        appNum=1
    elif [[ "sse" == "$appName" ]]; then
        appNum=1
    elif [[ "api" == "$appName" ]]; then
        appNum=1
    else
        appNum=6
    fi
    echo " "
    sleep 3
    i=0
    tail -f -n 100 $logPath/server-start/* | 
        while IFS= read line
            do
                echo "$line"
                if [[ "$line" == *"Started Application"* ]]; then
                    echo -e "\033[35m success $line \033[0m"
                    let "i++"
                    if [[ "$i" == "$appNum" ]]; then
                        echo -e "\033[35m release application finish, Bye! \033[0m"
                        pkill tail
                    fi
                fi
        done
}

### FUNCTIONS CALLS
#####################

# 1
validationParams

# 2
createDirectory

# 3
updateCode

# 4
package

# 5
#cleanLog

# 6
#cleanDB

# 7
stopServer

# 8
migrate

# 9
deleteFiles

# 10
copyFiles

# 11
run

# 12
watch

