
.PHONY: dev

help:
	@echo
	@echo '             build - builds image'
	@echo 'machine-mount-vbox - mounts Docker Machine dir to Docker container dir'

build:
	docker build -t bayesjumping/jupyterserver:0.1 .

machine-mount-vbox:
	docker-machine ssh default 'mkdir notebooks'
	docker-machine ssh default 'sudo mount -t vboxsf -o defaults,uid=`id -u docker`,gid=`id -g docker` notebooks /home/docker/notebooks'

machine-ssh:
	docker-machine ssh default

run:
	docker-machine ssh default 'docker run -d -p 8888:8888 -v /home/docker/notebooks:/home/jovyan/work --name=notebooks bayesjumping/jupyterserver:0.1 start-notebook.sh'

stop:
	docker stop notebooks
	docker rm notebooks