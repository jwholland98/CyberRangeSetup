cd /home/user/
git clone --single-branch --branch stable https://gitlab.com/mdlayer42/PompeiiSite.git
cd /home/user/PompeiiSite/
sudo chmod +x install_webserver.sh
sudo chmod +x install_mysql.sh
sudo /home/user/PompeiiSite/install_webserver.sh
sudo /home/user/PompeiiSite/install_mysql.sh