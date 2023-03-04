.PHONY: all run_dev_web run_dev_mobile run_unit clean upgrade lint format build_dev_mobile help 

all: lint format run_dev_mobile

# Adding a help file: https://gist.github.com/prwhite/8168133#gistcomment-1313022
help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

rebuild-runner:
	@fvm flutter pub run build_runner build --delete-conflicting-outputs

rebuild-ios:
	@echo "Cleaning ios build..."
	@fvm flutter clean
	@rm -Rf ios/Pods
	@rm -Rf ios/.symlinks
	@rm -Rf ios/Flutter/Flutter.framework
	@rm -Rf ios/Flutter/Flutter.podspec
	@fvm flutter pub get
	@cd ios
	@pod install
	@cd ..
	@echo "Rebuild ios..."
	@fvm flutter build ios --flavor dev -t lib/main_dev.dart

test-dev-ios:
	@cd ios ; fvm flutter build ios --flavor dev -t lib/main_dev.dart ; fastlane ios dev

test-ptr-ios:
	@cd ios ; fvm flutter build ios --flavor ptr -t lib/main_ptr.dart ; fastlane ios ptr

test-prod-ios:
	@cd ios ; fvm flutter build ios --flavor prod -t lib/main_prod.dart ; fastlane ios prod
	
test-dev-android:
	@cd android ; fastlane android dev

test-ptr-android:
	@cd android ; fastlane android ptr

test-prod-android:
	@cd android ; fastlane android prod  

release-android:
	@fvm flutter build appbundle --flavor prod -t lib/main_prod.dart

release-ios:
	@fvm flutter build ios --flavor prod -t lib/main_prod.dart