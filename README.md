## Example app showing how to setup a test environment for an express.js application

It uses [cucumber.js](https://github.com/cucumber/cucumber-js) with [zombie.js](http://zombie.labnotes.org/) for integration testing, [mocha](http://visionmedia.github.com/mocha/) with [should.js](https://github.com/visionmedia/should.js) for unit testing on the server side, and [jasmine](http://pivotal.github.com/jasmine/) with [sinon](http://sinonjs.org/) for unit testing on the client side. 

### Install

``` shell
$ git clone git://github.com/olivoil/NodeBDD.git
$ cd NodeBDD
$ npm install --dev
```
------

The `Makefile` defines commands to run the different kinds of tests:

### Run cucumber features

``` shell
$ make cucumber
```

If you are using vim, you might find it helpful to map a key to run them:

``` vim
:map <Leader>f :w\|!clear && make cucumber<cr>
```

### Run server-side specs

``` shell
$ make spec
```

If you are using vim, you might find it helpful to map a key to run them:

``` vim
:map <Leader>t :w\|!clear && make spec<cr>
```

### Run client-side specs

``` shell
$ make spec-client
```

If you are using vim, you might find it helpful to map a key to run them:

``` vim
:map <Leader>c :w\|!make spec-client<cr>
```

------

### TODO

+ Example client-side tests, stubbing the server side with sinon
+ Figure out how to make should.js work in the browser, then replace jasmine by mocha
+ Setup performance tests
+ Setup test coverage reporting
+ cli reporting for client-side specs, maybe using Phantomjs?
+ Browser Interface for all test reporting

