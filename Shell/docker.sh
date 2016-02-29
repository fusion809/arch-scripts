function run {
	docker run -i -t $1 /bin/bash
}

function commit {
	docker commit $2
}
