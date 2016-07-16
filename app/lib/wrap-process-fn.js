const wrapProcessFn = (fn) => {
  return (input, ...etc) => {
    if (Array.isArray(input)) { input = input.join(' ') }
    const parts = input.split(' ').filter(v => v !== '')
    const command = parts[0]
    const args = parts.slice(1)
    return fn(command, args, ...etc)
  }
}

module.exports = wrapProcessFn
