#!/usr/bin/env bash
PGM=$(basename $0)
DIR=$(dirname $0)

NAMESPACE=azkaban

# Deleting as changes to configmaps and secrets won't be seen without recreating Pods
kubectl delete statefulset -n $NAMESPACE exec-server
kubectl apply -n $NAMESPACE -f $DIR/stateful-set.yaml
 