#!/bin/bash
bash delete.sh #only when objects exist/minikube started

echo -e "------------------------------------------------START MINIKUBE---------------------------------------------------------"
minikube start --vm-driver=virtualbox --disk-size=5GB
minikube addons enable metallb
minikube addons enable metrics-server #warning compilen
minikube addons enable dashboard
minikube dashboard &

sleep 3
# minikube dashboard --url=true

echo -e "------------------------------------------------DEPLOY METALLB---------------------------------------------------------"
# deploy metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# only with first install
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metallb.yaml

# point shell to minikube's docker-deamon
eval $(minikube docker-env)

#build docker images and services & deployments
echo -e "------------------------------------------------NGINX------------------------------------------------------------------"
docker image build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

echo -e "------------------------------------------------MYSQL------------------------------------------------------------------"
#build docker images and services & deployments
# docker image build -t mysql ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

echo -e "------------------------------------------------WORDPRESS--------------------------------------------------------------"
#build docker images and services & deployments
# docker image build -t wordpress ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml

# echo -e "------------------------------------------------PERSISTENT VOLUME------------------------------------------------------"
echo -e "------------------------------------------------SECRETS----------------------------------------------------------------"
kubectl apply -f ./srcs/secrets.yaml
# kubectl apply -k ./srcs

echo -e "------------------------------------------------SHOW SECRETS & PVC-----------------------------------------------------"
kubectl get secrets
kubectl get pvc

echo -e "------------------------------------------------PHPMYADMIN---------------------------------------------------------------"
docker image build -t phpmyadmin ./srcs/phpmyadmin
kubectl create -f ./srcs/phpmyadmin/phpmyadmin.yaml

# echo -e "------------------------------------------------CHECK NGINX=WORKING---------------------------------------------------"
# nginx -t
# ps aux | grep nginx
# ps aux | grep 'nginx\|php-fpm'

# echo -e "minikube ip:"
# echo $(minikube ip)

echo -e "------------------------------------------------SHOW ALL KUBERNETES OBJECTS--------------------------------------------"
sleep 8
kubectl get all

# echo -e "nginx service url:"
# minikube service nginx-service --url

# 1. create image
# docker image build -t mynginx . -q
# -q: Suppress the build output and print image ID on success
# 2. run container
# docker container run -it -p 80:80 -p 443:443 mynginx
# -d = detach / run on background