#!/bin/sh -l

RESPONSE=`curl -s https://shouldideploy.today/api`
SHOULD_DEPLOY=`echo $RESPONSE | jq '.shouldideploy'`

if [ "$SHOULD_DEPLOY" != true ]
then
  exit 1
fi


MESSAGE=`echo $RESPONSE | jq '.message'`

curl --request POST \
          --url https://api.github.com/repos/$GITHUB_REPOSITORY/issues/$ISSUE_NUMBER/comments \
          --header 'authorization: Bearer $GITHUB_TOKEN' \
          --header 'content-type: application/json' \
          --data '{"body": "$MESSAGE"}' \
          --fail