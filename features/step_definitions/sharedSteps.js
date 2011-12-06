var World = require('../support/world');

var sharedSteps = function(){
  var world = this.world = new World();

  this.Given(/^I am on the home page$/, function(callback) {
    world.visit('/', callback);
  });

  this.Then(/^I should see "([^"]*)"$/, function(arg1, callback) {
    // express the regexp above with the code you wish you had
    callback.pending();
  });
}

module.exports = sharedSteps;
