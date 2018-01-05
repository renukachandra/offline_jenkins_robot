#!/bin/bash -       
#title           :virtualenvsetup.sh
#description     :This script will install virtualenv and robot framework in it 
#author		 :Renuka chandra
#date            :17072017
#version         :1.0    
#usage		 :bash virtualenvsetup.sh
#==============================================================================
sudo apt-get install python-virtualenv -y
#either cd to desired_directory or give path at the time of creation
virtualenv --never-download venv  # create virtualenv named venv for default system Python, which is Python 2 for Ubuntu
sleep 5s
echo 'activating the venv virtual environment... type "deactivate" and hit enter to get out of the virtual environment'
source venv/bin/activate  # activate virtualenv
sudo cp -a nokia/files/robotframework-3.0.2.tar.gz venv/
pip install venv/robotframework-3.0.2.tar.gz #install robotframework
#deactivate # to deactivate virtual environment


