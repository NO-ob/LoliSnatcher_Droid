if [ ! -f ./config/secrets.json ]; then
    mkdir -p config
    echo "{}" > config/secrets.json
fi