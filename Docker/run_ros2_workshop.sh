#!/bin/sh

container_name=ros2_workshop
function create_container {
        docker run -it --rm\
        --name ${container_name} \
        -h ${container_name} \
        --network=host \
	--volume="$(pwd)/../ros2_ws":"/mnt/ros2_ws" \
	ros:foxy
}
function rm_container {
	if [ "$(docker ps -aq -f name=${container_name})" ]
        then
		if [ "$(docker ps -aq -f status=running -f name=${container_name})" ]
		then
			docker stop ${container_name}
		fi
        	docker rm ${container_name}
        fi
}

if [ "$(docker ps -aq -f status=running -f name=${container_name})" ]
then
	echo "Container is Running. Starting new session."
	docker exec -it ${container_name} bash 
else
	rm_container
	# xhost +local:root
	create_container
	# xhost -locl:root
fi
