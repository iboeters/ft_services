#!/bin/bash
bash delete.sh #only when objects exist/minikube started


echo -e "------------------------------------------------START MINIKUBE---------------------------------------------------------"
minikube start --vm-driver=virtualbox --disk-size=5GB
minikube addons enable metallb
minikube addons enable metrics-server #warning compilen
minikube addons enable dashboard
minikube dashboard &
sleep 3

echo -e "------------------------------------------------DEPLOY METALLB---------------------------------------------------------"
# deploy metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# only with first install
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metallb.yaml

# point shell to minikube's docker-deamon
eval $(minikube docker-env)

echo -e "------------------------------------------------SECRETS----------------------------------------------------------------"
kubectl apply -f ./srcs/mysql/mysql-secret.yaml
kubectl apply -f ./srcs/influxdb/influxdb-secrets.yaml
kubectl apply -f ./srcs/telegraf/telegraf-secrets.yaml
kubectl apply -f ./srcs/grafana/grafana-secrets.yaml

echo -e "------------------------------------------------NGINX------------------------------------------------------------------"
docker image build -t nginx ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml

echo -e "------------------------------------------------MYSQL------------------------------------------------------------------"
docker image build -t mysql ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml

echo -e "------------------------------------------------PHPMYADMIN-------------------------------------------------------------"
docker image build -t phpmyadmin ./srcs/phpmyadmin
kubectl create -f ./srcs/phpmyadmin/phpmyadmin.yaml

echo -e "------------------------------------------------WORDPRESS--------------------------------------------------------------"
docker image build -t wordpress ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml

echo -e "------------------------------------------------INFLUXDB---------------------------------------------------------------"
# docker image build -t influxdb ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml

echo -e "------------------------------------------------TELEGRAF---------------------------------------------------------------"
# docker image build -t telegraf ./srcs/telegraf
kubectl apply -f ./srcs/telegraf/telegraf.yaml

echo -e "------------------------------------------------GRAFANA----------------------------------------------------------------"
# docker image build -t grafana ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml

echo -e "------------------------------------------------SHOW SECRETS & PVC-----------------------------------------------------"
kubectl get secrets
kubectl get pvc

echo -e "------------------------------------------------CHECK NGINX=WORKING---------------------------------------------------"
ps aux | grep nginx
ps aux | grep 'nginx\|php-fpm'

echo -e "minikube ip:"
echo $(minikube ip)

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

#nginx redirect:
# curl -I http://192.168.99.221

#ssh into running container:
#kubectl exec --stdin --tty [pod-name] -- /bin/sh

# grep -rnw '/path/to/somewhere/' -e 'pattern'

# error: too many request
# docker login -> username: codamibo