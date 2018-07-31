#!/bin/bash
# minikube start --extra-config=controller-manager.HorizontalPodAutoscalerUseRESTClients=false --extra-config=controller-manager.HorizontalPodAutoscalerSyncPeriod=10s
# minikube addons enable heapster

# start minikube
minikube start
# set the docker environment to minikube scope
eval $(minikube docker-env)
# https://stackoverflow.com/questions/42564058/how-to-use-local-docker-images-with-minikube
# run a local registry to pull local images
docker run -d -p 5000:5000 --restart=always --name registry registry:2
# build the local image
docker build . -t sigsci-nginx-minikube
# tag the build
docker tag sigsci-nginx-minikube localhost:5000/sigsci-nginx-minikube:0.1.0
# run the yaml deployment
kubectl create -f sigsci-nginx-minikube.yml
# get the pod ip and open a browser 
URL="$(minikube service sigsci-nginx-minikube --url)"
python -mwebbrowser -n "${URL}"
# open the minikube dashboard
minikube dashboard
# reset the docker environment
eval $(docker-machine env -u)


