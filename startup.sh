docker-machine ssh default 'sudo mount -t vboxsf -o defaults,uid=`id -u docker`,gid=`id -g docker` notebooks /home/docker/notebooks'
make stop
make run
