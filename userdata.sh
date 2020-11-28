#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sleep 2
sudo service start httpd
