#!/bin/bash

echo ""
echo "--- p0.abc.com ---"
docker exec -e CORE_PEER_ADDRESS=p0.abc.com:7051 admin.abc.com peer channel fetch 0 /tmp/block.accountc.0 --channelID accountc --orderer o0.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p0.abc.com:7051 admin.abc.com peer channel join --blockpath /tmp/block.accountc.0
docker exec -e CORE_PEER_ADDRESS=p0.abc.com:7051 admin.abc.com peer channel fetch 0 /tmp/block.marketc.0 --channelID marketc --orderer o0.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p0.abc.com:7051 admin.abc.com peer channel join --blockpath /tmp/block.marketc.0

echo ""
echo "--- p1.abc.com ---"
docker exec -e CORE_PEER_ADDRESS=p1.abc.com:7051 admin.abc.com peer channel fetch 0 /tmp/block.accountc.0 --channelID accountc --orderer o0.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p1.abc.com:7051 admin.abc.com peer channel join --blockpath /tmp/block.accountc.0
docker exec -e CORE_PEER_ADDRESS=p1.abc.com:7051 admin.abc.com peer channel fetch 0 /tmp/block.marketc.0 --channelID marketc --orderer o0.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p1.abc.com:7051 admin.abc.com peer channel join --blockpath /tmp/block.marketc.0

echo ""
echo "--- p0.xyz.com ---"
docker exec -e CORE_PEER_ADDRESS=p0.xyz.com:7051 admin.xyz.com peer channel fetch 0 /tmp/block.accountc.0 --channelID accountc --orderer o1.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p0.xyz.com:7051 admin.xyz.com peer channel join --blockpath /tmp/block.accountc.0
docker exec -e CORE_PEER_ADDRESS=p0.xyz.com:7051 admin.xyz.com peer channel fetch 0 /tmp/block.marketc.0 --channelID marketc --orderer o1.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p0.xyz.com:7051 admin.xyz.com peer channel join --blockpath /tmp/block.marketc.0

echo ""
echo "--- p1.xyz.com ---"
docker exec -e CORE_PEER_ADDRESS=p1.xyz.com:7051 admin.xyz.com peer channel fetch 0 /tmp/block.accountc.0 --channelID accountc --orderer o1.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p1.xyz.com:7051 admin.xyz.com peer channel join --blockpath /tmp/block.accountc.0
docker exec -e CORE_PEER_ADDRESS=p1.xyz.com:7051 admin.xyz.com peer channel fetch 0 /tmp/block.marketc.0 --channelID marketc --orderer o1.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p1.xyz.com:7051 admin.xyz.com peer channel join --blockpath /tmp/block.marketc.0

echo ""
echo "--- p0.ijk.com ---"
docker exec -e CORE_PEER_ADDRESS=p0.ijk.com:7051 admin.ijk.com peer channel fetch 0 /tmp/block.accountc.0 --channelID accountc --orderer o0.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p0.ijk.com:7051 admin.ijk.com peer channel join --blockpath /tmp/block.accountc.0
docker exec -e CORE_PEER_ADDRESS=p0.ijk.com:7051 admin.ijk.com peer channel fetch 0 /tmp/block.marketc.0 --channelID marketc --orderer o0.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p0.ijk.com:7051 admin.ijk.com peer channel join --blockpath /tmp/block.marketc.0

echo ""
echo "--- p1.ijk.com ---"
docker exec -e CORE_PEER_ADDRESS=p1.ijk.com:7051 admin.ijk.com peer channel fetch 0 /tmp/block.accountc.0 --channelID accountc --orderer o0.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p1.ijk.com:7051 admin.ijk.com peer channel join --blockpath /tmp/block.accountc.0
docker exec -e CORE_PEER_ADDRESS=p1.ijk.com:7051 admin.ijk.com peer channel fetch 0 /tmp/block.marketc.0 --channelID marketc --orderer o0.foo.org:7050
docker exec -e CORE_PEER_ADDRESS=p1.ijk.com:7051 admin.ijk.com peer channel join --blockpath /tmp/block.marketc.0
