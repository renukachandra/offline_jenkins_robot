# offline_jenkins_robot

PRE-REQUISITES:-
1.	A fresh Ubuntu 16.04 LTS machine with at least 4 GB  RAM 
2.	Pre- installed open jdk-8-jre (run command “sudo apt-get install openjdk-8-jre” to install this jre)

INSTALLATION INSTRUCTIONS AND FOLDER STRUCTURE:-
1.	Nokia – this folder contains all the helping scripts and files needed for setup.sh
1.1	Files
1.1.1	archive_setup  (this folder contains all the helping files for Jenkins_setup.sh)
1.1.2	samplejob (this folder contains sample xml for job creation in createjob.sh)
1.1.3	jenkins-cli.jar (this is needed for create job to run)
1.1.4	robotframework 3.0.2.tar.gz (this setup is being used by virtualenvsetup.sh to install robotframework in virtual setup)
1.2	jenkins_setup.sh (this script installs and setup Jenkins with its prerequisites)
1.3	createjob.sh (this script creates a testjob in Jenkins and builds it)
1.4	virtualenvsetup.sh (this script creates  a virtual environment venv) 
2.	Setup.sh – this is the master and only file which needs to be run for this whole setup

How to proceed with the installation :-
Step  1. Unzip setup.zip at home location (where user has access rights) by running the command “unzip setup.zip”
Step 2.  Run setup.sh with command “bash setup.sh” 
Note:- system may need a reboot depending upon the dpkg status. If dpkg related error is received then reboot the system and run setup.sh again as described in step 2
