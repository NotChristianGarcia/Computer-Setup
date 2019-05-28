#!/bin/bash
echo "Installing Docker and adding user to docker group"
snap install docker
groupadd docker
usermod -aG docker $USER
