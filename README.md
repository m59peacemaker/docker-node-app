# pmkr/node-app

Environment:
  - ubuntu 16
  - node 6 in strict mode
  - [JS Standard](http://standardjs.com/) linting
  - [flow](https://flowtype.org/) type checking
  - complete es6 and experimental features with [Babel]()

## example

```sh
docker run -it   \
  --name my-app  \
  -v ${PWD}:/app \
  pmkr/node-app
```

## `docker run` options

```sh
# mount your app to /app
-v /path/to/your/app:/app

# babel preset stage (0 1 2 3), default: 0
-e STAGE=0

# lint code (true false), default: true
-e LINT=true
```

## use npm

`docker exec` into app container and use `npm` as usual

## module paths

Modules in the project can be found in the same manner as modules in node_modules. Put modules in a directory like `app/` to avoid naming conflicts.

project-root
  - foo.js `require('foo')`
  - app/
    - foo.js `require('app/foo')`
