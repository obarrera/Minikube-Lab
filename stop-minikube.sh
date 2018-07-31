#!/bin/bash
minikube stop
minikube delete
eval $(docker-machine env -u)