FROM node:12.3.1 as node
FROM ruby:2.6.3 as base

ENV LANG C.UTF-8
ENV APP_ROOT /app/
ENV NODE_VERSION 12.3.1
ENV YARN_VERSION 1.16.0

COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
COPY --from=node /opt/yarn-v${YARN_VERSION} /opt/yarn-v${YARN_VERSION}

RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
  && ln -s /usr/local/lib/node_modules/npm/bin/npx-cli.js /usr/local/bin/npx \
  && ln -s /opt/yarn-v${YARN_VERSION}/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v${YARN_VERSION}/bin/yarn /usr/local/bin/yarnpkg

RUN apt-get update -qq \
    &&  apt-get install -y --no-install-recommends \
        build-essential \
        default-mysql-client \
        fonts-hanazono \
        ghostscript \
        libgs-dev \
        imagemagick \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
