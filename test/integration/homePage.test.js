var browser = require('./browser');

describe("Visiting the home page", function(){
  it("is served", function(done){
    browser.visit('/', function(err, browser, status){});
      if(err) done(err);
      status.should.equal(200);
      done();
  });
});
