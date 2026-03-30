# Check if fvm is installed
fvmAvailalble=false
if command -v fvm &> /dev/null; then
	fvmAvailalble=true
fi

# This script will generate dart localization files from assets/i18n/<locale>.json files and watch for changes until stopped

if [ "$fvmAvailalble" = true ]; then
    fvm dart run slang watch
else
    dart run slang watch
fi
