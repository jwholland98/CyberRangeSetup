sudo apt-get update
sudo apt install -y gcc
mkdir /home/user/ps/
cd /home/user/ps/
sudo echo -e "#include<unistd.h>\\nvoid main()\\n{ setuid(0);\\n setgid(0);\\n system(\"ps\");\\n}"
sudo gcc demo.c -o shell
sudo chmod u+s shell