const spawn = require('./spawn')

const compile = (src, dest, {stage} = {}) => {
  if (!src || !dest || stage === undefined) {
    throw new Error('Missing required argument')
  }
  return spawn([
    `babel ${src}`,
    `--presets node6,flow,stage-${stage}`,
    '--plugins babel-project-relative-import',
    '--ignore node_modules',
    '--copy-files',
    '--source-maps inline',
    `-d ${dest}`
  ], {
    env: {NODE_PATH: '/usr/lib/app/node_modules'}
    //,stdio: 'inherit'
  })
}

module.exports = compile
