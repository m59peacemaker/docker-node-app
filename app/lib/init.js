var WSS = require('socket.io')
const watch = require('chokidar').watch
const debounce = require('debounce')
const compile = require('./compile')

let state = {
  type: 'waiting',
  buildReady: false,
  lastBuildFailed: false
}

var wss = new WSS(process.env.CONTAINER_MESSAGE_PORT)
const broadcast = (...args) => wss.sockets.emit(...args)

wss.on('connection', ws => {
  ws.emit('state', state)
})

let restarting = false

const build = () => {
  return compile('/app', '/var/lib/app', {stage: process.env.CONTAINER_BABEL_STAGE})
    .on('close', (exitCode) => {
      state.type = 'waiting'
      if (exitCode === 0) {
        state.buildReady = true
        state.lastBuildFailed = false
        broadcast('build-ready')
      } else {
        state.buildReady = false
        if (restarting) {
          restarting = false
        } else {
          state.lastBuildFailed = true
          broadcast('build-error')
        }
      }
    })
}

let p = build()

const onChange = (event, path) => {
  broadcast('src-changed', {event, path})
  state.type = 'building'
  if (p) {
    restarting = true
    p.kill('SIGINT')
  }
  p = build()
}

watch('/app', {
  ignored: ['**/node_modules/**'],
  ignoreInitial: true
})
.on('all', debounce(onChange, 100))
