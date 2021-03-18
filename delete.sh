#!/bin/bash
echo -e "deleting secrets:"
kubectl delete secret mysql-pass
echo -e "deleting svcs:"
# kubectl delete service nginx-service
# kubectl delete service phpmyadmin-service
kubectl delete service wordpress-service
kubectl delete service mysql-service

# kubectl delete service kubernetes
echo -e "deleting deployments:"
# kubectl delete deployment nginx-deployment
# kubectl delete deployment phpmyadmin-deployment
kubectl delete deployment mysql-deployment
kubectl delete deployment wordpress-deployment
kubectl delete deployment wordpress-mysql

echo -e "deleting docker images:"
docker rmi $(docker images -a -q) -f

kubectl delete pvc mysql-pv-claim
kubectl delete pvc wp-pv-claim
minikube delete
