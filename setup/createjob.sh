#!/bin/bash -       
#title           :createjob.sh
#description     :This script will build job by using config.xml sample
#author		 :Renuka chandra
#date            :17072017
#version         :1.0    
#usage		 :bash createjob.sh
#==============================================================================
echo "creating a new job"
# copying sample job to jenkins jobs directory with config.xml
sudo cp -a nokia/files/samplejob  /var/lib/jenkins/jobs/
# reloads configuration
java -jar nokia/files/jenkins-cli.jar -s http://localhost:8080/ reload-configuration
#reading config.xml from samplejob
java -jar nokia/files/jenkins-cli.jar -s http://localhost:8080/ get-job samplejob > config.xml
#creating a new job 
java -jar nokia/files/jenkins-cli.jar -s http://localhost:8080/ create-job testjob < config.xml
# build job
java -jar nokia/files/jenkins-cli.jar -s http://localhost:8080/ build testjob 
