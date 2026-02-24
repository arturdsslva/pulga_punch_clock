# FRESHUP
clean:
	@echo "Cleaning..."
	flutter clean
	rm -rf android/.gradle
	rm -rf ~/.gradle
	flutter pub get
	@echo "Done!"


# BUILD
build-dev: clean
	@echo "Building for Development..."
	flutter build apk \
		--dart-define-from-file=lib/config/envs/dev.json
	@echo "Build for Development completed!"


# TESTS
run-test:
	@echo "Running tests..."
	flutter test --coverage
	lcov --summary coverage/lcov.info
	@echo "Tests completed!"

coverage-test: run-test
	@echo "Generating coverage report..."
	genhtml coverage/lcov.info -o coverage/html
	xdg-open coverage/html/index.html
	@echo "Coverage report generated at coverage/html/index.html"