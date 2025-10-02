# Variables to configure the environment
FLUTTER?=flutter
DART?=dart
ENV_DIR?=environments
#  Generate the auto-generated files for the project using the build_runner
gen-code:
	@echo "Generating codes"
	$(DART) run build_runner build --delete-conflicting-outputs

# Run the app in debug mode
run:
	@echo "Running the app"
	$(FLUTTER) run --dart-define-from-file=$(ENV_DIR)/environments.json