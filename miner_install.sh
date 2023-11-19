#!/bin/bash

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    source ~/.bashrc

set -e

sudo apt-get update && sudo apt-get upgrade -y

sudo apt install -y software-properties-common
sudo add-apt-repository universe
sudo apt update

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

pip install -e ./
pip install protobuf==3.20
pip install streamlit grpcio-tools
pip3 uninstall protobuf
pip3 install 'protobuf>=4.21.6,<5.0dev'
pip3 uninstall huggingface-hub
pip3 install 'huggingface-hub==0.18.0'
pip install openai==0.28

echo "Zakończono instalację pomyślnie."
