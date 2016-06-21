FROM m59peacemaker/ubuntu16-node5:1.0.0

RUN \
  npm install -g     \
    babel-cli@6.10   \
    babel-eslint@6.0 \
    nodemon@1.9      \
    standard         \
    snazzy           \
    npm-install-missing@0.1 \
  >/dev/null

# node_modules for any applications under /root
WORKDIR /root/share
RUN \
  npm install \
    babel-preset-flow@1.0    \
    babel-preset-es2015@6.9  \
    babel-preset-stage-0@6.5 \
    babel-preset-stage-1@6.5 \
    babel-preset-stage-2@6.5 \
    babel-preset-stage-3@6.5 \
    babel-plugin-transform-runtime@6.9 \
  >/dev/null

COPY bin/ /usr/sbin/

# so that unicode characters will work in the terminal
ENV LANG=C.UTF-8

# enable all babel experimental transformations
ENV STAGE=0
ENV NODE_ENV=development

# mount application here
VOLUME /app

WORKDIR /app

CMD ["app-startup"]
