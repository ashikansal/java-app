#!/bin/sh
# check for pre-reqs
#check host os
if [ "Linux" != "$(uname)" ]; then
  echo "Script will build environment only on Ubuntu"
  exit
else
  #check docker installed
  echo "Check if docker is installed"
  if [ ! -x "$(which docker)" ]; then
    echo "Install Docker"
    #sudo apt-get install docker.io -y
    wget -qO- https://get.docker.com/ | sh
  else
    echo "Docker is already installed"
  fi  
  #check docker-compose installed
  echo "Check if docker-compose is installed"
  if [ ! -x "$(which docker-compose)" ]; then
    echo "Install docker-compose"
    sudo apt-get install -y python-pip
    sudo pip install docker-compose
  else
    echo "docker compose is already installed"
  fi
  #run docker-compose to build test environment for java application
  echo "build enviromment..."
  sudo docker-compose -f docker-compose.yml -p hello up -d
fi



