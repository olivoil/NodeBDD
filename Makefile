MOCHA_REPORTER = spec
UNIT_TESTS = $(shell find test/app -name "*.test.js")

# vim => :map ,f :w\|!clear && make cucumber<cr>
cucumber:
	@NODE_ENV=test ./node_modules/.bin/cucumber.js test/features \
		-r test/features/step_definitions

test-performance:

# vim => :map ,t :w\|!clear && make spec<cr>
spec:
	@NODE_ENV=test ./node_modules/.bin/mocha \
		--require should \
		--require sinon \
		--reporter $(MOCHA_REPORTER) \
		--slow 20 \
		--growl \
		$(UNIT_TESTS)

# vim => :map ,c :w\|!clear && make spec-client<cr>
spec-client:
	open test/unit/client/SpecRunner.html

.PHONY: cucumber test-performance spec spec-client
