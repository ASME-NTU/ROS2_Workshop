FROM ros:foxy

RUN   apt update && \
      apt install -y \
      git \
      neovim \
      ros-foxy-jackal-simulator \
      ros-foxy-jackal-navigation \
      ros-foxy-jackal-desktop 

RUN echo "source /opt/ros/foxy/setup.bash" >> /root/.bashrc
# docker build -t asme-ntu:foxy-jackal -f ros2_workshop.Dockerfile .
