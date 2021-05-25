FROM node:6.11.2

RUN apt-get update && \
    apt-get install -y git \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*
COPY package.json /dashboard/
RUN cd /dashboard && npm install
COPY bower.json /dashboard/
RUN cd /dashboard && ./node_modules/.bin/bower install --allow-root
