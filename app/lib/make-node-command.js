const makeNodeCommand = (args) => {
  if (typeof args === 'string') {
    args = [args]
  }
  return [
    `node`,
    `--use_strict`,
    `--require /usr/lib/app/node_modules/source-map-support/register`,
    ...args
  ]
}

module.exports = makeNodeCommand
