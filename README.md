# Tensorflow Server
centOS based vnc machine for tensorflow development

The Tensorflow Server is build on


Tensorflow, an end-to-end open source machine learning platform
https://www.tensorflow.org/

Anaconda, the world's most popular data science platform
https://www.anaconda.com/

CentOS, a Linux Operating System
https://centos.org/

Python, a programming language that lets you work quickly
and integrate systems more effectively:
https://www.python.org/

Docker, to securely build, share and run modern applications anywhere
https://www.docker.com/

# WARNING current version does not run, probably fixed, test currently ongonig 09oct2019 1512CEST

# To be used as a ready-to-go training environment for
https://www.udemy.com/course/deep-learning-grundlagen-neuronale-netzwerke-mit-tensorflow/
by Jan Schaffranek

# Status: Under Construction.
first version: 6th oct 2019

# What you need to know:
Basic knowledge how to build and run Docker containers

Basic linux-commandline knowledge

Need to know how to set up a VNCViewer and how to connect it to a VNC server

Good-to-know: Operating Linux Servers @ your favorite Cloud provider. 
But you can do all this on your local Windows 10 Pro, Docker-enabled Laptop as well.

# Time needed 
## Building the container
You have to do this at least once.
approx. 10 minutes command line to start, 1.5 wall-clock hours

## Starting the container
approx. 10 seconds to have it running

# Example infrastructure

## Development server:
This container is developed on Google Cloud Zurich, zone europe-west6-a.
Harddisk: 40 GB
CPU: n1-standard-4, Intel Skylake, 4 vCPUs, 15 GB memory.

## Recommended end user machines :: linux@cloud
Any Linux Container host with docker installed, 40 GB harddisk, 16 GByte RAM.
Minimum specs are probably lower, tests will follow.
Port 5901 needs to be open vor VNC connections

## Recommended end user machines :: windows
Windows 10 pro (Windows Home not sufficient) 40 GB Harddisk
Modern CPU (more than 8000 in https://www.cpubenchmark.net/laptop.html )
Docker Desktop installed
16 GB RAM

# How to build the container
Instantiate a centos7 machine on a cloud provider

sudo yum -y install docker
sudo systemctl enable docker.service
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl start docker

sudo systemctl reboot

git clone https://github.com/frankrutz/tensowflow
cd tensorflow
docker build -t tensorflow -f dockerfile .

Attention in the vnc directory delete the kill display , update follows


# How to run the container
docker run -d --rm --hostname tensorflow -p 5901:5901 --name tensorflow tensorflow /tensorflow/containerstarter.sh

# How to access the vncserver
Using a VNC viewer, connect to port 5901. The standardpassword can be seen in the xstartup script.
