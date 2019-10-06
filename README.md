# Tensorflow  CentOS VNC Development Server
centOS based vnc machine for tensorflow development

# To be used as a ready-to-go training environment for
https://www.udemy.com/course/deep-learning-grundlagen-neuronale-netzwerke-mit-tensorflow/


# Status: Under Construction.
first version: 6th oct 2019

# What you need to know:
Good working knowledge Docker, Tensorflow, Python

# Time needed 
to set up a new development environment in e.g. Google Cloud: 1.5 hours.

# Example infrastructure
This container is developed on Google Cloud Zurich
30 GB harddisk
n1-standard-4 (4 vCPUs, 15 GB memory)

You will certainly need less resources to run it,
recommended minimum specifications will follow.


# How to build the container
Instantiate a centos7 machine on a cloud provider

sudo yum -y install docker
sudo systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl start docker

sudo systemctl reboot

docker build -t tensorflow -f dockerfile .

Attention in the vnc directory delete the kill display , update follows


# How to run the container
docker run -d --rm --hostname tensorflow -p 5901:5901 --name tensorflow tensorflow /tensorflow/containerstarter.sh

# How to access the vncserver
Using a VNC viewer, connect to port 5901. The standardpassword can be seen in the xstartup script.
