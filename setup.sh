#!/bin/bash
minikube start --vm-driver=virtualbox --addons metallb --addons dashboard
# minikube dashboard &
# minikube dashboard --url=true

# deploy metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# only with first install
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metallb_conf.yaml

# point shell to minikube's docker-deamon
eval $(minikube docker-env)

#build docker images and services & deployments
docker image build -t nginx ./srcs/nginx
kubectl create -f ./srcs/nginx/nginx.yaml

# echo -e "minikube ip:"
# echo $(minikube ip)

# echo -e "\n\nnginx service url:"
# minikube service nginx-service --url
