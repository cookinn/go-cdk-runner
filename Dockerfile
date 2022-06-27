FROM node:latest

RUN apt update && update upgrade -y

# Install AWS CDK and CLI
RUN npm install -g aws-cdk && apt-get install awscli -y

# Install Git and Bash
RUN apt-get install git -y && apt-get install bash -y

# Install Go
RUN apt-get install golang-go

# Install Docker
# See https://stackoverflow.com/questions/61401626/docker-installation-failed-on-ubuntu-20-04-ltsvmware
RUN apt-get install -y docker.io

# Add set credentials for GitHub repository script
COPY setCredentials.sh /data/setCredentials.sh
