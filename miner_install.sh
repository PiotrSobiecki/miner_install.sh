#!/bin/bash

sudo apt-get update && sudo apt-get upgrade -y
sudo apt install -y software-properties-common
sudo add-apt-repository universe
sudo apt update

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source ~/.bashrc
nvm install v16

sudo apt-get install git

git clone https://github.com/commune-ai/commune.git
cd commune
git submodule update --init --recursive

chmod +x ./scripts/*
sudo ./scripts/install_npm_env.sh

sudo npm install -g pm2

sudo dpkg --configure -a
sudo apt install -y python3-pip

# Install Python packages with -y option to automatically answer yes
pip install -e ./ -y
pip install protobuf==3.20 -y
pip install streamlit grpcio-tools -y
pip3 uninstall protobuf -y
pip3 install 'protobuf>=4.21.6,<5.0dev' -y
pip3 uninstall huggingface-hub -y
pip3 install 'huggingface-hub==0.18.0' -y
pip install openai==0.28 -y

echo "Można kopać SIR!!!."






