#!/usr/bin/bash
#target location of script: /tensorflow/containerstarter.sh


echo -e "changeme" | (passwd --stdin tensorflow)
printf "changemee\nchangemee\n\n" | vncpasswd
vncserver
sleep infinity
