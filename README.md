# Tensorflow Container
centOS based vnc container for tensorflow development

## The Tensorflow Container consists of:

* Tensorflow, an end-to-end open source machine learning platform
* https://www.tensorflow.org/

* Anaconda, the world's most popular data science platform
* https://www.anaconda.com/

* CentOS, a Linux Operating System
* https://centos.org/

* Python, lets you work quickly integrate systems more effectively
* https://www.python.org/

* Docker, to build, share and run modern applications anywhere
* https://www.docker.com/

* Keras, the Python Deep Learning library
* https://keras.io/

# A ready-to-go training environment for

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

# How to build the containerhost
## Instantiate a centos7 machine (e.g. at a cloud provider)

On the containerhost:

sudo yum -y install docker

sudo systemctl enable docker.service

sudo groupadd docker

sudo usermod -aG docker $USER

sudo systemctl start docker

sudo systemctl reboot

## Clone the tensorflow repository

git clone https://github.com/frankrutz/tensorflow

## Build the container - this will take 1.5 hours.

On the containerhost:

cd tensorflow

docker build -t tensorflow -f dockerfile .

Containersize is about 9.8 GB.

# How to run the container

## First time you run it -create a persistent volume

Create a docker volume (think of it as a persistent disk) for the user tensorflow

On the containerhost:

docker volume create user-tensorflow

## Starting the Tensorflowcontainer
On the containerhost:

docker run -d --rm --hostname tensorflow -v user-tensorflow:/home/tensorflow -p 5901:5901 --name tensorflow tensorflow /tensorflow/containerstarter.sh


## Accessing the container by vnc

Using a VNC viewer, connect to port 5901. The standardpassword can be seen in the xstartup script.

Please set your vcnpassword by running the vncpasswd command.

## Stopping the container
On the containerhost:

docker kill tensorflow
