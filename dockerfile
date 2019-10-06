FROM centos:7.6.1810
MAINTAINER frank.potthast@gmail.com
# WARNING EXPERIMENTAL 06oct2019
# To be used together with the Tensorflow course
# https://www.udemy.com/course/deep-learning-grundlagen-neuronale-netzwerke-mit-tensorflow/
RUN    yum -y update
RUN    yum install -y epel-release
RUN    yum groupinstall -y "Server with GUI"
RUN    yum groupinstall -y "MATE Desktop"
RUN    yum install -y tigervnc-server
RUN    yum install -y x11vnc;
RUN    yum groupinstall -y "X Window System"
RUN    adduser tensorflow -d /home/tensorflow -s /bin/bash;\
       usermod -g users tensorflow;\
       usermod -aG wheel tensorflow;\
       echo "changeme" | passwd --stdin tensorflow;\
       mkdir -p /home/tensorflow/.vnc
COPY   xstartup /home/tensorflow/.vnc/xstartup
RUN    chown -R tensorflow:users /home/tensorflow;\
       chmod u+x /home/tensorflow/.vnc/xstartup
RUN    mkdir /tensorflow
COPY   containerstarter.sh /tensorflow
COPY   xstartup /tensorflow
RUN    chown -R tensorflow:users /tensorflow;\
       chmod u+x /tensorflow/containerstarter.sh
#######################################################################
#VS Code see https://code.visualstudio.com/docs/setup/linux
RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc;\
    sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/
microsoft.asc" > /etc/yum.repos.d/vscode.repo';\
    yum install dnf code -y
#######################################################################
#python 3.x 
RUN yum install -y gcc openssl-devel bzip2-devel libffi-devel python3-dev python3-pip;\
    pip3 install -U virtualenv;\
    yum install anaconda conda -y;\
    conda create -n tensorflow python=3.6 anaconda;\
    pip3 install keras;\
    pip3 install opencv-python;\
    pip3 install tensorflow
#for GPU Version: comment above and activate below
#conda install tensorflow-gpu
USER tensorflow:users
