#configure_core.sh sets up applications, compiles code and puts scripts
#in the appropriate places.  It runs after all the installation commands
#have completed

log=~/temp/install.log
echo Started configure_core.sh | tee -a $log

echo Copying login message to /etc/motd | tee -a $log
sudo cp ~/temp/motd /etc/motd

echo Copying shell script to home directory | tee -a $log
sudo cp ~/temp/run_experiments.sh ~/run_experiments.sh
sudo chmod 777 ~/run_experiments.sh

echo Copying code into Desktop | tee -a $log
sudo cp -r ~/temp/BGT-Biology ~/Desktop
sudo chmod -R 777 ~/Desktop/BGT-Biology

echo Linking the shell script into the root folder | tee -a $log
sudo ln -sv ~/run_experiments.sh /run_experiments.sh

echo Completed configure_core.sh | tee -a $log