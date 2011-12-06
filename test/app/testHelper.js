var server = require('../../server')
  , zombie = require('zombie');

var page = exports.page = function(path){ 
 return "http://localhost:" + server.app.address().port + path
};

exports.visit = function(path, callback){
  zombie.visit(page(path), function(err, browser, status){
    callback(err, browser, status);
  });
};
