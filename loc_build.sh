# Check if fvm is installed
fvmAvailalble=false
if command -v fvm &> /dev/null; then
	fvmAvailalble=true
fi

# This script will generate dart localization files from assets/i18n/<locale>.json files

if [ "$fvmAvailalble" = true ]; then
    fvm dart run slang
else
    dart run slang
fi
