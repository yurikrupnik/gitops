#! /bin/bash

set -e

#helm template prometheus bitnami/kube-prometheus -n prometheus -f ./values.yaml > main.yaml

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install my-release bitnami/kube-prometheus -n prometheus
#helm delete my-release
kubectl port-forward --namespace prometheus svc/my-release-kube-prometheus-prometheus 9090:9090
kubectl port-forward --namespace prometheus svc/my-release-kube-prometheus-alertmanager 9093:9093