#!/bin/bash
# Luc Bettaieb & Russell Jackson
# ROS Installation
# v 0.1

echo "Beginning ROS Installation"

echo -e "\e[1m \e[34m >>> Beginning ROS Melodic Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

echo -e "\e[34m >>> ...done\e[39m"

  sudo apt update

echo -e "\e[34m >>> Beginning ros-Melodic-desktop-full installation...\e[39m"

  sudo apt --yes --force-yes install ros-melodic-desktop-full

echo -e "\e[34m >>> Setting up rosdep\e[39m"

  sudo rosdep init
  rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

  echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
  source ~/.bashrc

echo -e "\e[34m >>> install dependencies for building ROS packages \e[39m"

sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential

echo -e "\e[34m >>> install git \e[39m"

  sudo apt update
  sudo apt --yes --force-yes install git
  
source ~/.bashrc

echo -e "\e[34m >>> done! \e[39m"
