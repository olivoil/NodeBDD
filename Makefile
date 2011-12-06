MOCHA_REPORTER = spec
UNIT_TESTS = $(shell find test/unit/server -name "*.test.js")
INTEGRATION_TESTS = $(shell find test/integration/ -name "*.test.js")

cucumber:
	@NODE_ENV=test ./node_modules/.bin/jasmine \
		--require ['test/features']

test-integration:

test-performance:

test-unit-server:
	@NODE_ENV=test ./node_modules/.bin/mocha \
		--require should \
		--require sinon \
		--reporter $(MOCHA_REPORTER) \
		--slow 20 \
		--growl \
		$(UNIT_TESTS)

test-unit-client:
	open test/unit/client/SpecRunner.html

.PHONY: cucumber test-integration test-performance test-unit-server test-unit-client
