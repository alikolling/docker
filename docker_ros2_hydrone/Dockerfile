FROM althack/ros2:humble-cuda-gazebo-nvidia-2023-05-01

RUN apt-get update

RUN apt install -y gedit gnome-terminal dbus-x11 libcanberra-gtk-module libcanberra-gtk3-module lsb-release wget gnupg 
RUN wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
RUN apt-get update
RUN bash -c 'wget https://raw.githubusercontent.com/osrf/osrf-rosdep/master/gz/00-gazebo.list -O /etc/ros/rosdep/sources.list.d/00-gazebo.list'
RUN rosdep update
RUN rosdep resolve gz-garden
RUN apt-get install gz-garden

RUN bash -c 'wget https://raw.githubusercontent.com/osrf/osrf-rosdep/master/gz/00-gazebo.list -O /etc/ros/rosdep/sources.list.d/00-gazebo.list'
RUN rosdep update
RUN rosdep resolve gz-garden

RUN mkdir -p ~/catkin_ws/src

RUN cd ~/catkin_ws/src

RUN git clone https://github.com/gazebosim/ros_gz.git -b humble
RUN git clone https://github.com/osrf/vrx.git

RUN cd ~/catkin_ws
RUN GZ_VERSION=garden colcon build --merge-install
RUN apt install -y python3-sdformat13
