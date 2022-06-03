
#!/bin/bash



RED='\033[0;31m'
White="\[\033[0;37m\]"
END='\033[0m' 
IYellow="\033[0;93m[x]" 

function disableSudoPassword() {
    getUsername=$(whoami)
    echo -e "${IYellow}disable sudo password requirement for user${END}"
    sudo cp /etc/sudoers /etc/sudoers.bak
    sudo bash -c "echo '$getUsername ALL=(ALL) NOPASSWD: ALL' | (EDITOR='tee -a' visudo)"
}

function install_dokku(){
    if ! [ -x "$(command -v dokku)" ]; then
        echo -e "${IYellow}Error: dokku is not installed.${END}" >&2
        echo -e "${IYellow}********* THIS TAKES A WHILE TO INSTALL *********${END}">&2
        wget https://raw.githubusercontent.com/dokku/dokku/v0.27.4/bootstrap.sh
        sudo DOKKU_TAG=v0.27.4 bash bootstrap.sh
        else
        echo -e "${RED}dokku already installed or has been installed before${END}">&2
    fi

}
function install_portainer(){
    sudo usermod -aG docker $USER
    sudo su
    echo -e "${IYellow}===> Installing Portainer.${END}"
    cd ~/
    docker pull portainer/portainer-ce:latest
    docker volume create portainer_data
    sudo docker run -d -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce


}

function install_cockpit(){
    echo -e "${IYellow}===> Installing cockpit.${END}">&2
    sudo apt install cockpit -y
    sudo systemctl start cockpit
    sudo ufw allow 9090/tcp
    sudo apt install cockpit-machines -y



}

function install_python(){
    echo -e "${IYellow}===> Installing Conda for python management.${END}"
    cd ~/
    curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
    bash Mambaforge-$(uname)-$(uname -m).sh
    conda create -n dev python=3.9
}

function install_neofetch(){
    sudo apt install neofetch -y
}



function init_developer(){
  if ! [ -x "$(command -v python)" ]; then
  echo "install python or setup your server first. Check the script!"
  else
  python _developer.py
  fi



}

function install_ghCLI(){
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt install gh
  gh auth login
  
}




init_developer

# install_ghCLI
# install_python
# install_dokku
# install_portainer
# install_cockpit