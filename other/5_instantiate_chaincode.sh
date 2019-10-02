#!/bin/bash

docker exec -e CORE_PEER_ADDRESS=p0.abc.com:7051 admin.abc.com peer chaincode instantiate --name accountcc --version "0" --channelID accountc --ctor '{"Args":[]}'
docker exec -e CORE_PEER_ADDRESS=p0.abc.com:7051 admin.abc.com peer chaincode instantiate --name marketcc --version "0" --channelID marketc --ctor '{"Args":[]}'

docker exec -e CORE_PEER_ADDRESS=p1.abc.com:7051 admin.abc.com peer chaincode query --name accountcc --channelID accountc --ctor '{"Args":["get_user", "test"]}'
docker exec -e CORE_PEER_ADDRESS=p0.xyz.com:7051 admin.xyz.com peer chaincode query --name accountcc --channelID accountc --ctor '{"Args":["get_user", "test"]}'
docker exec -e CORE_PEER_ADDRESS=p1.xyz.com:7051 admin.xyz.com peer chaincode query --name accountcc --channelID accountc --ctor '{"Args":["get_user", "test"]}'
docker exec -e CORE_PEER_ADDRESS=p0.ijk.com:7051 admin.ijk.com peer chaincode query --name accountcc --channelID accountc --ctor '{"Args":["get_user", "test"]}'
docker exec -e CORE_PEER_ADDRESS=p1.ijk.com:7051 admin.ijk.com peer chaincode query --name accountcc --channelID accountc --ctor '{"Args":["get_user", "test"]}'

docker exec -e CORE_PEER_ADDRESS=p1.abc.com:7051 admin.abc.com peer chaincode query --name marketcc --channelID marketc --ctor '{"Args":["get_seller", "test"]}'
docker exec -e CORE_PEER_ADDRESS=p0.xyz.com:7051 admin.xyz.com peer chaincode query --name marketcc --channelID marketc --ctor '{"Args":["get_seller", "test"]}'
docker exec -e CORE_PEER_ADDRESS=p1.xyz.com:7051 admin.xyz.com peer chaincode query --name marketcc --channelID marketc --ctor '{"Args":["get_seller", "test"]}'
docker exec -e CORE_PEER_ADDRESS=p0.ijk.com:7051 admin.ijk.com peer chaincode query --name marketcc --channelID marketc --ctor '{"Args":["get_seller", "test"]}'
docker exec -e CORE_PEER_ADDRESS=p1.ijk.com:7051 admin.ijk.com peer chaincode query --name marketcc --channelID marketc --ctor '{"Args":["get_seller", "test"]}'
