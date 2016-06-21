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

# babel preset stage, default: 0
-e STAGE=0
```

## use npm

`docker exec` into app container and use `npm` as usual
