process.env.NODE_ENV = process.env.NODE_ENV || 'optimization'

const environment = require('./environment')

module.exports = environment.toWebpackConfig()
