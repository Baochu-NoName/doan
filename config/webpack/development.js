process.env.NODE_ENV = process.env.NODE_ENV || 'development'

// const environment = require('./environment')
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    jquery: 'jquery/src/jquery',
  })
)

module.exports = environment.toWebpackConfig()
