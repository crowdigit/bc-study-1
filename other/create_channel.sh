#!/bin/bash

docker exec admin.abc.com peer channel create --channelID accountc --file /srv/artifact/tx.accountc.create --outputBlock /tmp/block.accountc.0 --orderer o0.foo.org:7050
docker exec admin.abc.com peer channel create --channelID marketc --file /srv/artifact/tx.marketc.create --outputBlock /tmp/block.marketc.0 --orderer o0.foo.org:7050
