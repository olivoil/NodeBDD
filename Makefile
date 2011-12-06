MOCHA_REPORTER = spec
UNIT_TESTS = $(shell find test/unit/server -name "*.test.js")
INTEGRATION_TESTS = $(shell find test/integration/ -name "*.test.js")

# vim => :map ,f :w\|!clear && make cucumber<cr>
cucumber:
	@NODE_ENV=test ./node_modules/.bin/cucumber.js test/features \
		-r test/features/step_definitions

# vim => :map ,i :w\|!clear && make test-integration<cr>
test-integration:
	@NODE_ENV=test ./node_modules/.bin/mocha \
		--require should \
		--require sinon \
		--reporter $(MOCHA_REPORTER) \
		--slow 20 \
		--growl \
		$(INTEGRATION_TEST)

test-performance:

# vim => :map ,t :w\|!clear && make test-unit-server<cr>
test-unit-server:
	@NODE_ENV=test ./node_modules/.bin/mocha \
		--require should \
		--require sinon \
		--reporter $(MOCHA_REPORTER) \
		--slow 20 \
		--growl \
		$(UNIT_TESTS)

# vim => :map ,c :w\|!clear && make test-unit-client<cr>
test-unit-client:
	open test/unit/client/SpecRunner.html

.PHONY: cucumber test-integration test-performance test-unit-server test-unit-client
