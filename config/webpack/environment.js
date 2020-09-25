const { environment } = require('@rails/webpacker')

// Add an additional plugin of your choosing : ProvidePlugin
const webpack = require('webpack')
environment.
    plugins.
    append(
        'Provide',
        new webpack.ProvidePlugin({
            $: 'jquery/src/jquery',
            jQuery: 'jquery/src/jquery',
            Popper: ['popper.js', 'default']
        })
    )

module.exports = environment
