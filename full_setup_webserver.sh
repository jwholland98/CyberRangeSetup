cd /home/user/Documents/
git clone https://github.com/nikdubois/vsftpd-2.3.4-infected.git
cd /home/user/Documents/vsftpd-2.3.4-infected/
sudo apt-get update
sudo apt-get -y install make gcc
make
sudo chmod +x vsf_findlibs.sh
gcc -o vsftpd main.o utility.o prelogin.o ftpcmdio.o postlogin.o privsock.o tunables.o ftpdataio.o secbuf.o ls.o postprivparent.o logging.o str.o netstr.o sysstr.o strlist.o banner.o filestr.o parseconf.o secutil.o ascii.o oneprocess.o twoprocess.o privops.o standalone.o hash.o tcpwrap.o ipaddrparse.o access.o features.o readwrite.o opts.o ssl.o sslslave.o ptracesandbox.o ftppolicy.o sysutil.o sysdeputil.o -lcrypt -Wl,-s `./vsf_findlibs.sh`
sudo useradd nobody
sudo mkdir /usr/share/empty/
sudo mkdir /var/ftp/
sudo useradd -d /var/ftp ftp
sudo chown root.root /var/ftp
sudo chmod og-w /var/ftp
sudo cp vsftpd /usr/local/sbin/vsftpd
sudo cp vsftpd.conf.5 /usr/local/man/man5
sudo cp vsftpd.8 /usr/local/man/man8
sudo cp vsftpd.conf /etc
sudo sed -i 's|^#local_enable=YES*$|local_enable=YES|' /etc/vsftpd.conf
sudo sed -i 's|^#chroot_local_user=YES*$|chroot_local_user=NO|' /etc/vsftpd.conf
sudo echo "sudo /usr/local/sbin/vsftpd &" > /home/user/start_vsftpd.sh
sudo chmod +x /home/user/start_vsftpd.sh
(sudo crontab -u root -l; echo "@reboot /home/user/start_vsftpd.sh") | sudo crontab -u root -

echo -e "Desktop pass for user user: toor" > /home/user/pass_note.txt
chmod 600 /home/user/pass_note.txt

cd /home/user/
git clone --single-branch --branch stable https://gitlab.com/mdlayer42/PompeiiSite.git
cd PompeiiSite
sudo chmod +x install_webserver.sh
sudo chmod +x install_mysql.sh
sudo ./install_webserver.sh
sudo ./install_mysql.shs