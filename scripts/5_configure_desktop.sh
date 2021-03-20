#configure_desktop.sh does setup and configuration for 
#things which only apply to environments with desktops.

log=~/temp/install.log
echo Started configure_desktop.sh | tee -a $log

echo Copying over readme | tee -a $log
sudo cp ~/temp/readme.txt ~/Desktop/readme.txt
sudo chmod 777 ~/Desktop/readme.txt
printf "\n\nEnvironment built on " >> ~/Desktop/readme.txt
date >> ~/Desktop/readme.txt

echo Creating link from shell script on desktop| tee -a $log
ln -sv ~/run_experiments.sh ~/Desktop/run_experiments.sh

echo Completed configure_desktop.sh | tee -a $log