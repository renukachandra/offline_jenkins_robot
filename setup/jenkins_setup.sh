#!/bin/bash -       
#title           :jenkins_setup.sh
#description     :This script will install default-jre and jenkins 2.69.
#author		 :Renuka chandra
#date            :17072017
#version         :1.0    
#usage		 :bash jenkins_setup.sh
#==============================================================================
#checking the current jenkins installation status and installing if not installed
if dpkg -s jenkins > /dev/null 2>&1; then
  echo "jenkins is already installed and will not be installed."
  echo "Starting the service....."
  sudo service jenkins restart 
else
  echo "installing jenkins version 2.60.2....."
  sudo apt-get install daemon   
  sudo dpkg -i nokia/files/archive_setup/jenkins_2.60.2_all.deb 
  sleep 15s
  sudo ex +g/useSecurity/d +g/authorizationStrategy/d -scwq /var/lib/jenkins/config.xml
  sleep 15s
  echo "Installation completed. Starting the service....."
  sudo service jenkins restart 
  sleep 30s 
fi




