#!/bin/bash

docker exec -e CORE_PEER_ADDRESS=p0.abc.com:7051 admin.abc.com peer chaincode install --lang node --name accountcc --path /opt/gopath/src/chaincode/account --version "0"
docker exec -e CORE_PEER_ADDRESS=p0.abc.com:7051 admin.abc.com peer chaincode install --lang node --name marketcc --path /opt/gopath/src/chaincode/market --version "0"

docker exec -e CORE_PEER_ADDRESS=p1.abc.com:7051 admin.abc.com peer chaincode install --lang node --name accountcc --path /opt/gopath/src/chaincode/account --version "0"
docker exec -e CORE_PEER_ADDRESS=p1.abc.com:7051 admin.abc.com peer chaincode install --lang node --name marketcc --path /opt/gopath/src/chaincode/market --version "0"

docker exec -e CORE_PEER_ADDRESS=p0.xyz.com:7051 admin.xyz.com peer chaincode install --lang node --name accountcc --path /opt/gopath/src/chaincode/account --version "0"
docker exec -e CORE_PEER_ADDRESS=p0.xyz.com:7051 admin.xyz.com peer chaincode install --lang node --name marketcc --path /opt/gopath/src/chaincode/market --version "0"

docker exec -e CORE_PEER_ADDRESS=p1.xyz.com:7051 admin.xyz.com peer chaincode install --lang node --name accountcc --path /opt/gopath/src/chaincode/account --version "0"
docker exec -e CORE_PEER_ADDRESS=p1.xyz.com:7051 admin.xyz.com peer chaincode install --lang node --name marketcc --path /opt/gopath/src/chaincode/market --version "0"

docker exec -e CORE_PEER_ADDRESS=p0.ijk.com:7051 admin.ijk.com peer chaincode install --lang node --name accountcc --path /opt/gopath/src/chaincode/account --version "0"
docker exec -e CORE_PEER_ADDRESS=p0.ijk.com:7051 admin.ijk.com peer chaincode install --lang node --name marketcc --path /opt/gopath/src/chaincode/market --version "0"

docker exec -e CORE_PEER_ADDRESS=p1.ijk.com:7051 admin.ijk.com peer chaincode install --lang node --name accountcc --path /opt/gopath/src/chaincode/account --version "0"
docker exec -e CORE_PEER_ADDRESS=p1.ijk.com:7051 admin.ijk.com peer chaincode install --lang node --name marketcc --path /opt/gopath/src/chaincode/market --version "0"
