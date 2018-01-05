#!/bin/bash -       
#title           :setup.sh
#description     :this script will install everything needed, setup jenkins, create a test job, create a virtual environment venv and install robot framework with appium library in venv   
#author		 :Renuka chandra
#date            :20092017
#version         :2.0    
#usage		 :bash setup.sh
#==============================================================================
echo "#================precheck=============================#"
echo "Running a precheck...." 
#checking the java installation status
if type -p java; then
    echo found java executable in PATH
    _java=java
elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    echo found java executable in JAVA_HOME     
    _java="$JAVA_HOME/bin/java"
else
    echo "please install java using command --/ sudo apt-get install openjdk-8-jre -y /-- before running this script"
    exit 1
fi

if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo version "$version"
    if [[ "$version" > "1.7" ]]; then
        echo java requirements satisfied
    else         
        echo please install java version later than 1.7
        exit 1 
    fi
fi

#checking the python installation status

if command -v python2 > /dev/null 2>&1; then
    echo python requirements satisfied
else
    echo please install python before running this script!
fi
echo "starting the setup...."
sudo apt-get clean #cleaning the apt-getr archives
sudo cp -a setup/files/archive_setup/. /var/cache/apt/archives/ #copying the required files 
bash setup/jenkins_setup.sh #running jenkins setup
bash setup/createjob.sh #running create job script
bash setup/virtualenvsetup.sh #running virtual environment setup script

echo "#================postcheck=============================#"

echo "running a postcheck....."
jen_output=$(sudo service jenkins status)
if [[ $jen_output == *"Active: active (exited)"* ]]; then
    echo "Jenkins is installed successfully and running"
else
    echo "Jenkins is either not installed properly or not up, please check and re-run the script if needed" 
fi

source venv/bin/activate
venv_output=$(pip list)
if [[ $venv_output == *"robotframework"* ]]; then
    echo "robotframework is installed inside venv (virtual environment)"
else
    echo "robotframework is not installed" 
fi



