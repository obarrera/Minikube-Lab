#!/bin/bash

URL="$(minikube service sigsci-nginx-minikube --url)"
kubectl run -it --rm --restart=Never loadgenerator --image=busybox -- sh -c "while true; do wget --spider "${URL}"; done"
