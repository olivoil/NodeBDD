
/**
 * Module dependencies.
 */

var express = require('express')
  , routes  = require('./routes')
  , assets  = require('connect-assets')
  // , stylus  = require('stylus')
  // , nib     = require('nib')
  , _       = require('underscore')._
  , winston = require('winston')


// compile = function(str, path){
//   stylus(str)
//     .set('filename', path)
//     .set('compress', true)
//     .use(nib())
//     .import('nib')
// }

var app = module.exports = express.createServer();

app.run = function(config){
  var config = _.extend({
      port: 3000
    , home: __dirname 
  }, config);

  app.logger = new (winston.Logger)({
    transports: [
        new (winston.transports.Console)()
      , new (winston.transports.File)({filename: "./log/" + app.settings.env + ".log"});
    ]
  });

  // Configuration

  app.configure(function(){
    app.set('views', __dirname + '/views');
    app.set('view engine', 'jade');
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(assets({src: "#{config.home}/assets"}));
    app.use(app.router);
    app.use(assets({src: config.home + "/assets"}));
    app.use(express.static(__dirname + '/public'));
  });

  app.configure('development', function(){
    app.use(express.errorHandler({ dumpExceptions: true, showStack: true })); 
  });

  app.configure('production', function(){
    app.use(express.errorHandler()); 
    app.logger.remove(winston.transports.Console);
  });

  // Routes
  app.get('/', routes.index);

  app.listen(config.port, function(){
    app.logger.log('info', "Express server listening on port %d in %s mode", app.address().port, app.settings.env);
  });
};
