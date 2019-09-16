#!/usr/bin/env bash
PGM=$(basename $0)
DIR=$(dirname $0)

if [[ "$DB_HOST" == "" || "$DB_NAME" == "" || "$DB_USER" == "" || "$DB_PWD" == "" ]];then
    echo "$PGM env vars for DB_HOST, DB_NAME, DB_USER, and DB_PWD must be set"
    exit 1
fi

NAMESPACE=azkaban

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: azkaban-private-properties
  namespace: $NAMESPACE
type: Opaque
stringData:
  azkaban.private.properties: |-
    mysql.host=$DB_HOST
    mysql.database=$DB_NAME
    mysql.user=$DB_USER
    mysql.password=$DB_PWD
EOF
