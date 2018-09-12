#!/bin/sh

sudo systemctl stop mongodb-mms
sudo systemctl stop mongod-oplog
sudo systemctl stop mongod
sudo yum erase -y $(rpm -qa | grep mms)
sudo rm -rf /app/appdb/*
sudo rm -rf /app/oplogdb/*
sudo rm -rf /app/oplogdb/*
sudo rm -rf /opt/mongodb/*
sudo rm -rf /etc/mongodb-mms
sudo systemctl start mongod
sudo systemctl start mongod-oplog

