#!/bin/bash

echo "installing prometheus"

echo " create namespace for monitoring"

kubectl create namespace monitoring
kubectl apply -f configmap.yaml -n monitoring
kubectl apply -f prom-deployment.yaml
kubectl apply -f prom-service.yaml
kubectl apply -f grafana-deployment.yaml
kubectl apply -f grafana-service.yaml
