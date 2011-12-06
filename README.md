## Example app showing how to setup a test environment for an express.js application

It uses [cucumber.js](https://github.com/cucumber/cucumber-js) for integration testing, [mocha](http://visionmedia.github.com/mocha/) with [should.js](https://github.com/visionmedia/should.js) for unit testing on the server side, and [jasmine](http://pivotal.github.com/jasmine/) for unit testing on the client side. 

### Install

``` shell
    $ git clone git://github.com/olivoil/NodeBDD.git
    $ cd NodeBDD
    $ npm install
```

### Run cucumber feature

``` shell
    $ make cucumber
```

### Run server-side specs

``` shell
    $ make spec
```

### Run client-side specs

``` shell
    $ make spec-client
```

### TODO

+ Example unit tests
+ Figure out how to make should.js work in the browser, then replace jasmine by mocha
+ Setup performance tests
+ Setup test coverage reporting
+ Browser Interface for all test reporting

