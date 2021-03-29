#!/bin/bash
echo -e "deleting secrets:"
kubectl delete secret mysql-pass
kubectl delete secret influxdb-secrets
kubectl delete secret telegraf-secrets
echo -e "deleting svcs:"
kubectl delete service nginx-service
kubectl delete service phpmyadmin-service
kubectl delete service mysql-service
kubectl delete service wordpress-service
kubectl delete service influxdb-service
kubectl delete service grafana-service

# kubectl delete service kubernetes
echo -e "deleting deployments:"
kubectl delete deployment nginx-deployment
kubectl delete deployment phpmyadmin-deployment
kubectl delete deployment mysql-deployment
kubectl delete deployment wordpress-deployment
kubectl delete deployment influxdb-deployment
kubectl delete deployment telegraf-deployment
kubectl delete deployment grafana-deployment

echo -e "deleting docker images:"
docker rmi $(docker images -a -q) -f

kubectl delete pvc mysql-pv-claim
kubectl delete pvc wp-pv-claim
kubectl delete pvc influxdb-pvc
# minikube delete
