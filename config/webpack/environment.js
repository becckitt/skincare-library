const { environment } = require('@rails/webpacker')
const vue =  require('./loaders/vue')

environment.loaders.append('vue', vue)
module.exports = environment

module: {
  rules: [
    {
      test: /\.css$/,
      use: [ 'style-loader', 'css-loader' ]
    }
  ]
}