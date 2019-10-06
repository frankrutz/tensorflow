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

# To be used as a ready-to-go training environment for
https://www.udemy.com/course/deep-learning-grundlagen-neuronale-netzwerke-mit-tensorflow/

# Status: Under Construction.
first version: 6th oct 2019

# What you need to know:
Basic knowledge how to build and run Docker containers

# Time needed 
## Building the container
You have to do this at least once.
approx. 10 minutes command line to start, 1.5 wall-clock hours

## Starting the container
approx. 10 seconds to have it running

# Example infrastructure

## Development server:
This container is developed on Google Cloud Zurich, zone europe-west6-a.
Harddisk: 30 GB
CPU: n1-standard-4, Intel Skylake, 4 vCPUs, 15 GB memory.

## Recommended end user machine
Windows 10 pro (Windows Home not sufficient)
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
