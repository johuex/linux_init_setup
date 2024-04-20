#!/usr/bin/bash

echo "Add python repo"
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update

echo "Install python3.9"
sudo apt-get install -y python3.9

echo "Install python3.11"
sudo apt-get install -y python3.11

sudo apt-get install python3.9-distutils
sudo apt-get install python3-apt

# virtualenv venv --python=pythonX.X
