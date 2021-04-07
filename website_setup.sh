cd /home/user/
git clone --single-branch --branch stable https://gitlab.com/mdlayer42/PompeiiSite.git
cd PompeiiSite
sudo chmod +x install_webserver.sh
sudo chmod +x install_mysql.sh
sudo ./install_webserver.sh
sudo ./install_mysql.sh