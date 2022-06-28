FROM node:latest

RUN apt update && apt upgrade -y

# Install AWS CDK and CLI
RUN npm install -g aws-cdk && apt-get install awscli -y

# Install Git, Bash and cURL
RUN apt-get install git -y && apt-get install bash -y && apt-get install curl -y

# Install Go
# See https://go.dev/doc/install
RUN curl -sSLO https://go.dev/dl/go1.17.11.linux-amd64.tar.gz && rm -rf /usr/local/go && tar -C /usr/local -xzf go1.17.11.linux-amd64.tar.gz
ENV PATH "$PATH:/usr/local/go/bin"

# Install Docker
# See https://stackoverflow.com/questions/61401626/docker-installation-failed-on-ubuntu-20-04-ltsvmware
RUN apt-get install -y docker.io

# Add set credentials for GitHub repository script
COPY setCredentials.sh /data/setCredentials.sh
