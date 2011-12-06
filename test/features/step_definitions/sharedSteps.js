var world = require('../support/world')
  , browser = world.browser
  , should = require('should');

var sharedSteps = function(){
  this.Given(/^I am on the home page$/, function(callback) {
    world.visit('/', callback);
  });

  this.Then(/^I should see "([^"]*)"$/, function(text, callback) {
    world.browser.text('body').should.include.string(text);
    callback();
  });
}

module.exports = sharedSteps;
