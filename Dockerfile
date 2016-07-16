FROM ubuntu:16.04

RUN \
  apt-get update && apt-get install -y \
    git    \
    curl   \
    wget   \
    python \
    make   \
    g++

# start commands with `dumb-init` to avoid zombie reaping problem
RUN \
  wget -O \
    /usr/bin/dumb-init \
    https://github.com/Yelp/dumb-init/releases/download/v1.1.1/dumb-init_1.1.1_amd64 \
  && chmod +x /usr/bin/dumb-init

# install nodejs
RUN \
  curl -sL https://deb.nodesource.com/setup_6.x | bash \
  && apt-get install -y nodejs

RUN \
  npm install -g     \
    babel-cli@6.10   \
    babel-eslint@6.0 \
    nodemon@1.9      \
    standard         \
    snazzy           \
    psy@1.7

COPY app/package.json /usr/lib/app/
RUN cd /usr/lib/app && npm install
COPY app/ /usr/lib/app/
RUN cd /usr/lib/app && npm install && npm link

# cleanup
#RUN \
#  apt-get purge -y \
#    curl           \
#    wget           \
#    python         \
#    make           \
#    g++                 && \
#  apt-get autoremove -y && \
#  apt-get clean         && \
#  rm -rf /var/lib/apt/lists/*

COPY bin/ /usr/sbin/

# so that unicode characters will work in the terminal
ENV LANG=C.UTF-8

# internal message port
ENV CONTAINER_MESSAGE_PORT=54321

# babel experimental transformations
ENV CONTAINER_BABEL_STAGE=3

ENV NODE_ENV=development

WORKDIR /app

ENTRYPOINT ["app-init"]

CMD ["app"]
