#!/bin/bash
# Workspace setup
# Luc Bettaieb & Russell Jackson
# v 0.25

echo "Setting up workspace."

USERNAME=$1
EMAIL=$2

if [ "$USERNAME" != "" ] || [ "$EMAIL" != "" ];
then
  source /opt/ros/kinetic/setup.bash
  echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
  rosdep update

  mkdir -p ~/ros_ws/src

  cd ~/ros_ws/src  && catkin_init_workspace
  cd ~/ros_ws && catkin_make

  source devel/setup.bash

  git config --global user.name "$USERNAME"
  git config --global user.email "$EMAIL"

  # Cloning STDR is only necessary because of a bug in the current ROS binary release
  # This prevents spawning a new robot on the screen. See this bug report for more information:
  # https://github.com/stdr-simulator-ros-pkg/stdr_simulator/issues/195

  echo "source ~/ros_ws/devel/setup.bash" >> ~/.bashrc
  source ~/.bashrc

  cd ~/ros_ws && catkin_make
  cd ~/ros_ws && catkin_make install

  echo "export ROS_WORKSPACE=$HOME'/ros_ws'" >> ~/.bashrc
  # echo "export ROS_IP=`ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`" >> ~/.bashrc

  source ~/.bashrc

else
  echo "USAGE: ./setup_workspace_learning_ros your_github_username your_email@email.com"
fi
echo "[!!!] NB: You must still manually add your ROS_IP to your ~/.bashrc.  Do this by checking your IP with hostname -I or ifconfig"