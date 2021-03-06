#!/bin/bash
# Luc Bettaieb & Russell Jackson
# ROS Installation
# v 0.1

echo "Beginning ROS Installation"

echo -e "\e[1m \e[34m >>> Beginning ROS Kinetic Installation \e[21m \e[39m"
echo -e "\e[34m >>> Setting up sources.list and keys... \e[39m"

  sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
  sudo apt-key adv --keyserver hkp://pool.sks-keyservers.net --recv-key 0xB01FA116

echo -e "\e[34m >>> ...done\e[39m"

  sudo apt-get update

echo -e "\e[34m >>> Beginning ros-kinetic-desktop-full installation...\e[39m"

  sudo apt-get --yes --force-yes install ros-kinetic-desktop-full

echo -e "\e[34m >>> Setting up rosdep\e[39m"

  sudo rosdep init
  rosdep update

echo -e "\e[34m >>> Setting up environment \e[39m"

  echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
  source ~/.bashrc

echo -e "\e[34m >>> Setting up rosinstall \e[39m"

  sudo apt-get --yes --force-yes install python-rosinstall

echo -e "\e[34m >>> install gazebo-ros-controllers \e[39m"

sudo apt-get install ros-kinetic-gazebo-ros-pkgs ros-kinetic-gazebo-ros-control
sudo apt-get install ros-kinetic-effort-controllers
sudo apt-get install ros-kinetic-joint-state-controller
sudo apt-get --yes --force-yes install ros-kinetic-cv-bridge ros-kinetic-polled-camera ros-kinetic-camera-info-manager ros-kinetic-tf-conversions
sudo apt-get --yes --force-yes install ros-kinetic-opencv3 libopencv-dev

echo -e "\e[34m >>> install sublime-text \e[39m"

  sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
  sudo apt-get update
  sudo apt-get --yes --force-yes install sublime-text-installer

echo -e "\e[34m >>> install git \e[39m"

  sudo apt-get update
  sudo apt-get --yes --force-yes install git

echo -e "\e[1m \e[34m >>> Installing rqt \e[21m \e[39m"
    sudo apt-get --yes install ros-kinetic-rqt
    sudo apt-get --yes install ros-kinetic-rqt-common-plugins

source ~/.bashrc

echo -e "\e[34m >>> done! \e[39m"
