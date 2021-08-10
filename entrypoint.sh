#!/bin/sh -l

SHOULD_DEPLOY=`curl https://shouldideploy.today/api` | jq '.shouldideploy'

if [ $SHOULD_DEPLOY ]
then
  exit 0
else
  exit 9
fi