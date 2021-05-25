FROM node:6.11.2

RUN apt-get update && \
    apt-get install -y git \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*
COPY package.json /dashboard/
RUN echo 52.216.233.35 github-production-release-asset-2e65be.s3.amazonaws.com >> /etc/hosts && cd /dashboard && npm install
COPY bower.json /dashboard/
RUN cd /dashboard && ./node_modules/.bin/bower install --allow-root
