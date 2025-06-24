#!/bin/bash
kubectl create namespace jenkins
helm repo add jenkins https://charts.jenkins.io
helm repo update

helm install jenkins jenkins/jenkins \
  --namespace jenkins \
  --set controller.serviceType=NodePort
  --set controller.service.nodePort=31492

echo "This is an initial admin password for jenkins"

kubectl exec --namespace jenkins -it svc/jenkins -c jenkins -- /bin/cat /run/secrets/chart-admin-password && echo
