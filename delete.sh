#!/bin/bash
echo -e "deleting svcs:"
kubectl delete service nginx-service
kubectl delete service nginx
kubectl delete service nginx-svc
kubectl delete service phpmyadmin-service
# kubectl delete service kubernetes
echo -e "deleting deployments:"
kubectl delete deployment nginx-deployment
kubectl delete deployment nginx
kubectl delete deployment phpmyadmin-deployment
echo -e "deleting docker images:"
docker rmi $(docker images -a -q) -f
minikube delete
