#Script to run aws cli commands using hubot
shell = require('shelljs')
module.exports = (robot) ->
	cmd="aws ec2 describe-instances --output text --query \"Reservations[*].Instances[*].[InstanceId, InstanceType, State.Name, Placement.AvailabilityZone, PrivateIpAddress, PrivateDnsName, PublicDnsName, [Tags[?Key=='Name'].Value] [0][0]]\" --output text"
	
	ssm_cmd="sh scripts/aws_cli.sh"
	
	# robot.hear /hello world/i, (msg) ->
	   # shell.echo('Hello World!!');
	     # msg.send(stdout)
		 
	robot.hear /ec2 describe instances/i, (msg) ->
	   msg.send "*Below is a report of instances requested*"
	   shell.exec "#{cmd}", (error, stdout, stderr) -> 		
	     msg.send(stdout)
		 
	robot.hear /ssm execute (.*)/i, (msg) ->
	   ins_id = msg.match[1]
	   msg.send "*Getting Docker Compose Status of #{ins_id}..*"
	   shell.exec "#{ssm_cmd} #{ins_id}", (error, stdout, stderr) -> 		
	     msg.send(stdout)