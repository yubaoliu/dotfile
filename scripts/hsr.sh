# please set network-interface
network_if=enp0s31f6

if [ -e /opt/ros/kinetic/setup.bash ] ; then
    source /opt/ros/kinetic/setup.bash
else
    echo "ROS packages are not installed."
fi

export TARGET_IP=$(LANG=C /sbin/ifconfig $network_if | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*')
if [ -z "$TARGET_IP" ] ; then
    echo "ROS_IP is not set."
else
    export ROS_IP=$TARGET_IP
fi

export ROS_HOME=~/.ros
export ROBOT_NAME=hsrc
alias sim_mode='export ROS_MASTER_URI=http://localhost:11311 export PS1="\[\033[44;1;37m\]<local>\[\033[0m\]\w$ "'
alias hsrb_mode='export ROS_MASTER_URI=http://hsrc.local:11311 export PS1="\[\033[41;1;37m\]<hsrb>\[\033[0m\]\w$ "'
source ~/data/catkin_ws/devel/setup.bash

