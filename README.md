

# DEPRECATED JupyterServer
```
                                   ##         .
                             ## ## ##        ==
                          ## ## ## ## ##    ===
                       /""""""""""""""""\___/ ===
                  ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~
                       \______ o          _,/
                        \      \       _,'
                         `'--.._\..--''
```
A dockerized Jupyter server for data science.

## Docker Machine set up on Windows

Start the Docker Quick Start Terminal and cd into the source directory, stop the Docker Machine and create a shared folder between Windows and Virtual Box.

```
docker-machine stop default
/C/Program\ Files/Oracle/VirtualBox/VBoxManage sharedfolder add default --name notebooks --hostpath `pwd` --automount
docker-machine start default
```

Create a folder in Docker Machine to hold the notebooks. Synchronize this folder with the host Windows folder.

```
docker-machine ssh default 'mkdir notebooks'
docker-machine ssh default 'sudo mount -t vboxsf -o defaults,uid=`id -u docker`,gid=`id -g docker` notebooks /home/docker/notebooks'
```

Create the container from the Dockerfile. This may take some time on the first install.

```
	docker build -t bayesjumping/jupyterserver:0.1 .
```

Run the container.

```
docker-machine ssh default 'docker run -d -p 8888:8888 -v /home/docker/notebooks:/home/jovyan/work --name=notebooks bayesjumping/jupyterserver:0.1 start-notebook.sh'
```
