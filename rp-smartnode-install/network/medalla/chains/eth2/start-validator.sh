#!/bin/sh
# This script launches ETH2 validator clients for Rocket Pool's docker stack; only edit if you know what you're doing ;)


# RP version number for graffiti
ROCKET_POOL_VERSION="v0.0.6"


# Get graffiti text
GRAFFITI="RP $ROCKET_POOL_VERSION"
if [ ! -z "$CUSTOM_GRAFFITI" ]; then
    GRAFFITI="$GRAFFITI ($CUSTOM_GRAFFITI)"
fi


# Lighthouse startup
if [ "$CLIENT" = "lighthouse" ]; then

    /usr/local/bin/lighthouse validator --testnet medalla --datadir /data/validators/lighthouse --init-slashing-protection --beacon-node "http://$ETH2_PROVIDER" --graffiti "$GRAFFITI"

fi


# Prysm startup
if [ "$CLIENT" = "prysm" ]; then

    /app/validator/image.binary --wallet-dir /data/validators/prysm-non-hd --wallet-password-file /data/password --beacon-rpc-provider "$ETH2_PROVIDER" --graffiti "$GRAFFITI"

fi

