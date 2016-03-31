function run {
	docker run -i -t $1 /bin/bash
}

function runz {
	docker run -i -t $1 /bin/zsh
}

function runa {
	docker run -i -t -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
              -v /dev/shm:/dev/shm \
              -v ${PWD}/.atom:/.atom \
              -e DISPLAY=${DISPLAY} $1
}

function commit {
	docker commit $2 $3
}
