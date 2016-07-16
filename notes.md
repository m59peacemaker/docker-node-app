lint $path
  lint this directory or file
    - watch

test $path
  run `npm test` in the build
    - watch
    - minimal

build $in $out
    - watch
    - stage [2]

dev $path
  build -l, run the app, combine output of `test -m`
    - watch
    - lint
    - test
    -- args

# following commands pass args through

app lint
  lint /app

app test
  test /app

app build
  build /app /var/lib/app

app dev
  dev /app

build should be under /var/lib/app in dev,
/usr/lib/app in prod ?
