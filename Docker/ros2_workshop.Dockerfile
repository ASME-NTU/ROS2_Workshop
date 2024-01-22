FROM ros:foxy

RUN   apt update && \
      apt install -y \
      git \
      neovim \
      wget

# Installing jackal desktop
RUN wget https://packages.clearpathrobotics.com/public.key -O - | sudo apt-key add - && \
    sh -c 'echo "deb https://packages.clearpathrobotics.com/stable/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/clearpath-latest.list' 

RUN   apt update && \
      apt install -y \
      ros-foxy-jackal-simulator \
      ros-foxy-jackal-navigation \
      ros-foxy-jackal-desktop 

RUN echo "source /opt/ros/foxy/setup.bash" >> /root/.bashrc
# docker build -t asme-ntu:foxy-jackal -f ros2_workshop.Dockerfile .
