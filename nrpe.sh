
cd /tmp
wget https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-3.2.1/nrpe-3.2.1.tar.gz 
tar zxvf nrpe-3.2.1.tar.gz
cd nrpe-3.2.1
./configure --enable-command-args --with-nrpe-user=nagios --with-nrpe-group=nagios 
sudo make install-groups-users
id nagios
sudo make all
sudo make install
sudo make install-config
sudo make install-init
sudo echo 'nrpe            5666/tcp                # NRPE Service' >> /etc/services

sudo systemctl start nrpe
sudo systemctl enable nrpe
sudo systemctl enable nrpe


cd /tmp
wget https://nagios-plugins.org/download/nagios-plugins-2.2.1.tar.gz
tar xzf nagios-plugins-2.2.1.tar.gz
cd nagios-plugins-2.2.1
./configure
sudo make
sudo make install
ls /usr/local/nagios/libexec/
