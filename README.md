# Minikube-Lab

A minikube lab based off of the lab-in-the-box project.

## Getting Started

The first thing you need is to have minikube installed.  This is simple on the Mac.  Change the agent.conf to match your agent key information!


### Prerequisites

- kubectl
- docker (for Mac)
- minikube
- virtualbox

```
brew update && brew install kubectl && brew cask install docker minikube virtualbox
```

Verify everything git installed.

```
docker --version                # Docker version 17.09.0-ce, build afdb6d4
docker-compose --version        # docker-compose version 1.16.1, build 6d1ac21
docker-machine --version        # docker-machine version 0.12.2, build 9371605
minikube version                # minikube version: v0.22.3
kubectl version --client        # Client Version: version.Info{Major:"1", Minor:"8", GitVersion:"v1.8.1", GitCommit:"f38e43b221d08850172a9a4ea785a86a3ffa3b3a", GitTreeState:"clean", BuildDate:"2017-10-12T00:45:05Z", GoVersion:"go1.9.1", Compiler:"gc", Platform:"darwin/amd64"}      
```

### Installing

Download or clone the repo and change into the directory.

```
git clone url
```

## Running the tests

Run the start-minikube.sh script to beging a minikube cluster with a nginx server running

```
chmod +x start-minikube.sh
./start-minikube.sh
```

To stop the minikube instance run the stop-minikube.sh script

```
chmod +x stop-minikube.sh
./stop-minikube.sh
```
To set up an quick example of autoscaling using a metrics-server run teh autoscale.sh script

```
chmod +x autoscale.sh
./autoscale.sh
```

To test a load on the running service run the loadtest.sh script

```
chmod +x loadtest.sh
./loadtest.sh
```

To shut minikube down run the stop-minkube script

```
chmod +x stop-minikube
./stop-minikube.sh
```
### The next step is to add auto scaling with custom metris like qps

- TBD

