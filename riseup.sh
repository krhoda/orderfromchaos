#!/bin/bash

# first things first...
sudo apt update
sudo apt upgrade -y

# Create initial places.
mkdir magic
cd magic/
la
mkdir proj
mkdir tool
mkdir sandbox
cd tool
mkdir orderfromchaos
cd orderfromchaos/

# start loading some dependencies.
sudo apt install git

