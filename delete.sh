#!/bin/bash
echo -e "deleting secrets:"
kubectl delete secrets --all
echo -e "deleting svcs:"
kubectl delete service nginx-service
kubectl delete service phpmyadmin-service
kubectl delete service mysql-service
kubectl delete service wordpress-service

# kubectl delete service kubernetes
echo -e "deleting deployments:"
kubectl delete deployment nginx-deployment
kubectl delete deployment phpmyadmin-deployment
kubectl delete deployment mysql-deployment
kubectl delete deployment wordpress-deployment

echo -e "deleting docker images:"
docker rmi $(docker images -a -q) -f
# minikube delete
