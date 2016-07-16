var Socket = require('socket.io-client')

let ready = false

const buildReady = () => {
  return new Promise((resolve, reject) => {
    if (ready) { resolve() }
    const socket = Socket('http://localhost:' + process.env.CONTAINER_MESSAGE_PORT)
    const done = () => {
      ready = true
      socket.removeAllListeners()
      socket.close()
      resolve()
    }
    socket.once('state', state => {
      if (state.buildReady) { done() }
    })
    socket.once('build-ready', done)
  })
}

module.exports = buildReady
