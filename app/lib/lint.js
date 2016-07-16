const chalk = require('chalk')
const spawn = require('./spawn')

const lint = () => {
  console.log(chalk.bold('Checking code style...'))
  return spawn('app-lint', {
    cwd: '/app',
    stdio: 'inherit'
  })
  .on('close', (exitCode) => {
    if (exitCode === 0) {
      console.log(chalk.bold(`Code style is JSS compliant ${chalk.green('\u2714')}`))
    }
  })
}

module.exports = lint
