const cp = require('child_process')
const wrap = require('./wrap-process-fn')

const spawn = wrap(cp.spawn)

module.exports = spawn
