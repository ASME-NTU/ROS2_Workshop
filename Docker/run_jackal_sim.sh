#!/bin/sh

container_name=jackal_ws
function create_container {
        docker run -it \
        --name ${container_name} \
        -h ${container_name} \
        --network=host \
	--env="DISPLAY" \
	--env="QT_X11_NO_MITSHM-1" \
	-v="/tmp/.X11-unix:/tmp/.X11-unix:rw"
	--privileged \
	-v="$(pwd)/jackal_ws":"/mnt/jackal_ws" \
	asme-ntu:foxy-jackal
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
	xhost +local:root
	create_container
	xhost -locl:root
fi
