#!/bin/bash

docker exec admin.abc.com peer channel update --channelID accountc --file /srv/artifact/tx.accountc.anchor.abc --orderer o0.foo.org:7050
docker exec admin.ijk.com peer channel update --channelID accountc --file /srv/artifact/tx.accountc.anchor.ijk --orderer o0.foo.org:7050
docker exec admin.xyz.com peer channel update --channelID accountc --file /srv/artifact/tx.accountc.anchor.xyz --orderer o0.foo.org:7050
