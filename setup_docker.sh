sudo apt update
sudo apt-get upgrade
sudo apt-get install emacs mlocate apt-utils gnupg2
sudo updatedb
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc
cp -r ~/termux-packages/docker.gnupg ~/.gnupg
