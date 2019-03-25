const path = require('path');
const HtmlPlugin = require('html-webpack-plugin');
const BomPlugin = require('webpack-utf8-bom');

module.exports = {
  entry: './index.js',

  output: {
    path: path.resolve(__dirname,'dist'),
    publicPath: 'dist/',
    filename: 'bundle.js'
  },

  module: {
    loaders: [
      { test: /\.js$/, exclude: /node_modules/, loader: 'babel-loader?presets[]=es2015&presets[]=react' }
    ]
  },

  plugins:[
    new BomPlugin(true),
    new HtmlPlugin({
        minify:{
            removeAttributeQuotes:true
        },
        hash:true,
        template:'./index.html'
     })
  ],
  devServer: {
    contentBase: path.join(__dirname, "dist"),
    overlay: true
  }
}
