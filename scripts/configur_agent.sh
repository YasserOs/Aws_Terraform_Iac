#!/bin/sh
# scp ../ansible-slave/files/agent.jar ubuntu@private_instance:~
ssh -l ubuntu private_instance "java -jar agent.jar"