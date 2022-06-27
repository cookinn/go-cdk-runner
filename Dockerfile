FROM node:latest

RUN apt update && apt upgrade -y

# Install AWS CDK and CLI
RUN npm install -g aws-cdk && apt-get install awscli -y

# Install Git and Bash
RUN apt-get install git -y && apt-get install bash -y

# Install Go
# See https://github.com/golang/go/wiki/Ubuntu#using-ppa and https://itsfoss.com/add-apt-repository-command-not-found
RUN apt-get install software-properties-common -y && add-apt-repository ppa:longsleep/golang-backports && apt update && apt install golang-go -y

# Install Docker
# See https://stackoverflow.com/questions/61401626/docker-installation-failed-on-ubuntu-20-04-ltsvmware
RUN apt-get install -y docker.io

# Add set credentials for GitHub repository script
COPY setCredentials.sh /data/setCredentials.sh
