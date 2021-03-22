cd ~/Documents
git clone https://github.com/nikdubois/vsftpd-2.3.4-infected.git
cd vsftpd-2.3.4-infected/
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

mkdir /home/user/ps/
cd /home/user/ps/
sudo echo -e "#include<unistd.h>\\nvoid main()\\n{ setuid(0);\\n setgid(0);\\n system(\"ps\");\\n}"
sudo gcc demo.c -o shell
sudo chmod u+s shell