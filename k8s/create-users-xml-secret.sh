#!/usr/bin/env bash
PGM=$(basename $0)
DIR=$(dirname $0)

if [[ "$AZKABAN_USER_PWD" == "" ]];then
    echo "$PGM env var AZKABAN_USER_PWD must be set"
    exit 1
fi

NAMESPACE=azkaban

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: azkaban-users-xml
  namespace: $NAMESPACE
type: Opaque
stringData:
  azkaban-users.xml: |-
    <azkaban-users>
      <user groups="azkaban" password="$AZKABAN_USER_PWD" roles="admin" username="azkaban"/>
      <user password="$AZKABAN_USER_PWD" roles="metrics" username="metrics"/>
      <role name="admin" permissions="ADMIN"/>
      <role name="metrics" permissions="METRICS"/>
    </azkaban-users>
EOF
