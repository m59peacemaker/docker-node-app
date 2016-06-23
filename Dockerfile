FROM pmkr/node:6

RUN \
  npm install -g     \
    babel-cli@6.10   \
    babel-eslint@6.0 \
    nodemon@1.9      \
    standard         \
    snazzy           \
  >/dev/null

# node_modules for any applications under /root
WORKDIR /root/share
RUN \
  npm install \
    babel-preset-flow@1.0     \
    babel-preset-node6@11.0.0 \
    babel-preset-stage-0@6.5  \
    babel-preset-stage-1@6.5  \
    babel-preset-stage-2@6.5  \
    babel-preset-stage-3@6.5  \
  >/dev/null

# make executables available in path
COPY bin/ /usr/sbin/

# so that unicode characters will work in the terminal
ENV LANG=C.UTF-8

# enable all babel experimental transformations
ENV STAGE=0

# linting is on by default
ENV LINT=true

ENV NODE_ENV=development

# mount application here
VOLUME /app

WORKDIR /app

CMD ["app-startup"]
