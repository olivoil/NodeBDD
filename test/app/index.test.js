var helper = require('./testHelper');

describe("routes", function(){
  describe("#index", function(){
    it("is served", function(done){
      helper.visit('/', function(err, browser, status){
        if(err) done(err);
        status.should.equal(200);
        done();
      });
    });
  });
});
