const kexec = require('kexec')
const wrap = require('./wrap-process-fn')

module.exports = wrap(kexec)
