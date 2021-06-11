# hubot-aws-cli

hubot-aws-cli is a Hubot plugin which is inspired by an ambition to provide hubot with capabilities to execute AWS CLI Commands.

## Credit & divergence

This project was uses below 3 important projects in order to accomplish its use case.
1. [Hubot](http://hubot.github.com)
2. [ShellJS](https://documentup.com/shelljs/shelljs)
3. [AWS CLI v2](https://docs.aws.amazon.com/cli/index.html)

## Configuration

Though this project is usable off the shelf. In case if you wish to use base Hubot Yeoman generator and proceed, please follow below steps;

###### Pre-Requisite : [In case if you are using Windows]
```For Yeoman to work add : C:\Users\<username>\AppData\Roaming\npm this to your path ```

> npm install --save-dev shelljs

> npm install hubot-slack --save

& then proceed to have your [Coffee Scripts] [coffee] & [Shell Scripts] [shell] in `scripts` directory.

[coffee]: https://coffeescript.org/
[shell]: https://devdocs.io/bash/

## Commands

### List Instance

#### EC2 Describe Instances
```
myhubot ec2 describe instances
```
This command will list the instances which are requested in `cmd` variable of [execute_aws_cli.coffee](scripts/execute_aws_cli.coffee).

#### Get Docker Compose Status of Container running in EC2 Instance
```
myhubot ssm execute <instance-id>
```
This command will check `docker-compose` status of instance passed as `<instance-id>`.
To be more generice this is the shell script mentioned in `ssm_cmd` variable of [execute_aws_cli.coffee](scripts/execute_aws_cli.coffee).
