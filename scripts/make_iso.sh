#make_iso.sh is an optional script which uses the Remastersys utility
#to create a bootable ISO from a VM environment.  It only works on VM
#environments, and uses the file /vagrant/data/remastersys.conf to
#configure the ISO parameters

log=/vagrant/temp/install.log

echo making iso using Remastersys | tee -a $log
echo trying to scrub remastersys.conf of Windows line-endings | tee -a $log
sudo awk '{ sub("\r$", ""); print }' /vagrant/data/remastersys.conf > /vagrant/temp/remastersys.conf
echo copying remastersys.conf across | tee -a $log
sudo cp /vagrant/temp/remastersys.conf /etc/remastersys.conf

echo setting remastersys boot menu background
sudo cp /vagrant/data/splash.png /etc/remastersys/isolinux/splash.png

sudo remastersys clean

sudo remastersys backup
cp /mnt/temp/remastersys/remastersys/*.iso /vagrant/output/
cp /mnt/temp/remastersys/remastersys/*.log /vagrant/output/
sudo remastersys clean

echo Remastersys completed | tee -a $log