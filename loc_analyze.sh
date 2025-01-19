# Check if fvm is installed
fvmAvailalble=false
if command -v fvm &> /dev/null; then
	fvmAvailalble=true
fi

# This script will launch the analyzer for missing/unused translations in non-en locales

if [ "$fvmAvailalble" = true ]; then
    fvm dart run slang analyze --split-missing
else
    dart run slang analyze --split-missing
fi
