#!/usr/bin/env bash
PGM=$(basename $0)
DIR=$(dirname $0)

NAMESPACE=azkaban
kubectl create namespace azkaban

kubectl delete configmap -n $NAMESPACE azkaban-properties
kubectl create configmap -n $NAMESPACE azkaban-properties --from-file=$DIR/azkaban.properties

kubectl delete configmap -n $NAMESPACE global-properties
kubectl create configmap -n $NAMESPACE global-properties --from-file=$DIR/global.properties

kubectl delete configmap -n $NAMESPACE log4j-properties
kubectl create configmap -n $NAMESPACE log4j-properties --from-file=$DIR/log4j.properties
