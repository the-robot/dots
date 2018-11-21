const HtmlWebPackPlugin = require("html-webpack-plugin");
const path = require('path');

//When I wrote this, only God and I understood what I was doing
//Now, God only knows

const config = {
  context: path.join(__dirname, "src"),
  entry: "./js/app.jsx",
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: "app.min.js"
  },
  module: {
    rules: [{
      test: /\.jsx?$/,
      exclude: /(node_modules|bower_components)/,
      use: {
        loader: 'babel-loader'
      }
    },
    {
      test: /\.html$/,
      use: [
        {
          loader: "html-loader"
        }
      ]
    },
    { 
      test: /\.css$/,
      loader: "style-loader!css-loader"
    }]
  },
  resolve: {
    extensions: ['*', '.js', '.jsx', '.css', '.less']
  },
  plugins: [
    new HtmlWebPackPlugin({
      template: "./index.html",
      filename: "./index.html"
    }),
  ]
};

module.exports = config;
