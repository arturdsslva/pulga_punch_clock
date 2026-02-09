clean:
	@echo "Cleaning..."
	flutter clean
	rm -rf android/.gradle
	rm -rf ~/.gradle
	flutter pub get
	@echo "Done!"

build-dev: clean
	@echo "Building for Development..."
	flutter build apk \
		--dart-define-from-file=lib/config/envs/dev.json
	@echo "Build for Development completed!"