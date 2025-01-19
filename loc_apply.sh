# Check if fvm is installed
fvmAvailalble=false
if command -v fvm &> /dev/null; then
	fvmAvailalble=true
fi

# This script will apply changes in missing translations file to all non-en locales, to do this only for one locale, run 'dart run slang apply --locale=<locale>'

if [ "$fvmAvailalble" = true ]; then
    fvm dart run slang apply
else
    dart run slang apply
fi
