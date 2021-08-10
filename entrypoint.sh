#!/bin/sh -l

RESPONSE=`curl -s https://shouldideploy.today/api`
SHOULD_DEPLOY=`echo $RESPONSE | jq '.shouldideploy'`

if [ "$SHOULD_DEPLOY" != true ]
then
  exit 1
fi

echo $RESPONSE | jq '.message'