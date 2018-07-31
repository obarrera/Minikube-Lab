#!/bin/bash
# https://github.com/kubernetes-incubator/metrics-server
# Comment on the bottom of this github post indicated that metrics-server was required, very random and hidden fact
# https://github.com/kubernetes/kops/issues/5033

# minikube addons install metrics-server
kubectl apply -f https://raw.githubusercontent.com/kubernetes/kops/master/addons/metrics-server/v1.8.x.yaml
# enable metrics-server addons
minikube addons enable metrics-server
# configure the autoscaling with some settings
kubectl autoscale deployment sigsci-nginx-minikube --min=1 --max=15 --cpu-percent=60
# monitor the hpa for activity/metrics
watch kubectl describe hpa
# watch the metrics
#watch kubectl get hpa,pod,service -owide