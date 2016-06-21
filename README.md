# m59peacemaker/node

Environment:
  - ubuntu 16
  - node 5 in strict mode
  - [JS Standard](http://standardjs.com/) linting
  - [flow](https://flowtype.org/) type checking
  - latest JavaScript features with [Babel]()

## example

```sh
docker run -it   \
  --name my-app  \
  -v ${PWD}:/app \
  m59peacemaker/node:1.0.0
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
