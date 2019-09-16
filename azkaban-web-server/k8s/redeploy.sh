#!/usr/bin/env bash
PGM=$(basename $0)
DIR=$(dirname $0)

NAMESPACE=azkaban

# Deleting as changes to configmaps and secrets won't be seen without recreating Pods
kubectl delete deployment -n $NAMESPACE web-server
kubectl apply -n $NAMESPACE -f $DIR/deployment.yaml
 