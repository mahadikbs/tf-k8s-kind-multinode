#!/bin/bash
kubectl create namespace jenkins
helm repo add jenkins https://charts.jenkins.io
helm repo update

helm install jenkins jenkins/jenkins --namespace jenkins -f values.yaml
  
