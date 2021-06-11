#!/bin/bash

CommandId=`aws ssm send-command --instance-ids $1 --document-name "AWS-RunShellScript" --comment "docker compose process check" --parameters commands="cd /home/ssm-user/docker-compose; docker-compose ps" --output yaml | grep CommandId | cut -d ':' -f2`
echo $CommandId
chk="InProgress"
	while [ "$chk" = "InProgress" ];
	do
	   chk1=`aws ssm list-command-invocations --command-id $CommandId --details  --output yaml | grep Status | head -1 | cut -d ':' -f2`
	   chk=`echo $chk1 | xargs`
	done
op1=`aws ssm list-command-invocations --command-id $CommandId --details | jq '.CommandInvocations[]' | jq '.CommandPlugins[]' | jq '.Output'`
echo -e $op1
echo "*Command invokation for ${1} finished.*"