# JupyterServer
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
A dockerized Jupyter server for data science

## Docker Machine set up on Windows

Start the Docker Quick Strat Terminal and cd into the source directory, stop the Docker Machine and create a shared folder between Windows and Virtual Box.

```
docker-machine stop default
/C/Program\ Files/Oracle/VirtualBox/VBoxManage sharedfolder add default --name notebooks --hostpath `pwd` --automount
docker-machine start default
```

Create a folder in Docker Machine to hold the notebooks. Synchronize this folder with the host Windows folder.

```
docker-machine ssh default 'mkdir notebooks'
docker-machine ssh default 'sudo mount -t vboxsf -o defaults,uid=`id -u docker`,gid=`id -g docker` notebooks /home/docker/blog'
```

Create the container from the Dockerfile. This may take some time on the first install.

```
	docker build -t bayesjumping/jupyterserver:0.1 .
```

Run the container.

```
run:
	docker-machine ssh default 'docker run -d -p 4321:4321 -v /home/docker/blog:/home/app/blog --name=jekyserv bayesjumping/blog:0.1'

```
