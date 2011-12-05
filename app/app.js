/**
 * Module dependencies.
 */

var express = require('express')
  , routes  = require('./routes')
  , assets  = require('connect-assets')
  , _       = require('underscore')._

var app = module.exports = express.createServer();

app.run = function(config){
  var config = _.extend({
      port: 3000
    , home: __dirname 
    , logger: console
  }, config);

  // Configuration
  app.configure(function(){
    app.set('views', __dirname + '/views');
    app.set('view engine', 'jade');
    app.use(express.bodyParser());
    app.use(express.methodOverride());
    app.use(app.router);
    app.use(assets({src: config.home + "/assets"}));
    app.use(express.static(__dirname + '/public'));
  });

  app.configure('development', function(){
    app.use(express.errorHandler({ dumpExceptions: true, showStack: true })); 
  });

  app.configure('production', function(){
    app.use(express.errorHandler()); 
  });

  // Routes
  app.get('/', routes.index);

  // Listen
  app.listen(config.port, function(){
    config.logger.log('http', "Express server listening on port %d in %s mode", app.address().port, app.settings.env);
    config.logger.log('debug', app.settings);
  });

  return app;
};
