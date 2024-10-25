#!/bin/bash

source scripts/select.sh

selected_item=0
menu_items=("Testing" "Github" "Store")
title="Select a build type (arrow keys to select, enter to confirm):"
run_menu "$title" "$selected_item" "${menu_items[@]}"
menu_result="$?"

echo

build_arg="LS_IS_TESTING=true"
build_desc="Testing"
build_mode="apk --split-per-abi"
build_extras="--dart-define-from-file=./config/secrets.json"
suffix="test"
case "$menu_result"
in
	0)
		build_arg="LS_IS_TESTING=true"
        build_desc="Testing"
		suffix="test"
		;;
	1)
		build_arg="LS_IS_STORE=false"
        build_desc="Github"
		suffix="github"
		;;
	2)
		build_arg="LS_IS_STORE=true"
        build_desc="Store"
		build_mode="appbundle"
		suffix="store"
		;;
esac

clear

echo "Doing a ["$build_desc"] build - [flutter build $build_mode --dart-define=$build_arg $build_extras]"
# Generate empty secret vars config if it's not there
sh gen_config.sh

# Check if fvm is installed
fvmAvailalble=false
if command -v fvm &> /dev/null; then
	fvmAvailalble=true
fi

if [ "$fvmAvailalble" = true ]; then
	if fvm flutter pub get && fvm flutter build $build_mode --release --dart-define=$build_arg $build_extras ; then
		echo "Build succeeded"
	else
		echo "Build failed"
		exit 1
	fi
else
	if flutter pub get && flutter build $build_mode --release --dart-define=$build_arg $build_extras ; then
		echo "Build succeeded"
	else
		echo "Build failed"
		exit 1
	fi
fi

get_version_and_build() {
    version_and_build=$(grep "version:" pubspec.yaml | awk '{print $2}')
    IFS='+' read -ra version_build_array <<< "$version_and_build"
    version="${version_build_array[0]}"
    build="${version_build_array[1]}"
}
get_version_and_build

if [ "$build_mode" = "appbundle" ]; then
	src_aab="build/app/outputs/bundle/release/app-release.aab"
    dest_aab="build/app/outputs/bundle/release/LoliSnatcher_${version}_${build}_appbundle_${suffix}.aab"
    cp "$src_aab" "$dest_aab"

	echo
    echo "=> Built AAB: LoliSnatcher_${version}_${build}_appbundle_${suffix}.aab"
else
	srcv8_apk="build/app/outputs/flutter-apk/app-arm64-v8a-release.apk"
	destv8_apk="build/app/outputs/flutter-apk/LoliSnatcher_${version}_${build}_arm64-v8a_${suffix}.apk"
	cp "$srcv8_apk" "$destv8_apk"

	srcv7_apk="build/app/outputs/flutter-apk/app-armeabi-v7a-release.apk"
	destv7_apk="build/app/outputs/flutter-apk/LoliSnatcher_${version}_${build}_armeabi-v7a_${suffix}.apk"
	cp "$srcv7_apk" "$destv7_apk"

	src64_apk="build/app/outputs/flutter-apk/app-x86_64-release.apk"
	dest64_apk="build/app/outputs/flutter-apk/LoliSnatcher_${version}_${build}_x86_64_${suffix}.apk"
	cp "$src64_apk" "$dest64_apk"

	echo
	echo "=> Built APKs: LoliSnatcher_${version}_${build}_[arch]_${suffix}.apk"
fi

