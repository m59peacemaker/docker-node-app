# pmkr/node-app

Environment:
  - ubuntu 16
  - node 6 in strict mode
  - [JS Standard](http://standardjs.com/) linting
  - [flow](https://flowtype.org/) type checking
  - complete es6 and experimental features with [Babel](https://babeljs.io/)
  - [project relative require](https://github.com/m59peacemaker/babel-project-relative-import) `require('~/a-module')`

## example

```sh
docker run -it   \
  --name my-app  \
  -v ${PWD}:/app \
  pmkr/node-app app [command]
```

Run `app --help` or app `[command] --help` for them deets.

## `docker run` options

```sh
# mount your app to /app
-v /path/to/your/app:/app

# babel preset stage (0 1 2 3), default: 2
-e CONTAINER_BABEL_STAGE=0
```

## use npm

`docker exec` into app container or `docker run` with app mounted and use `npm` as usual
