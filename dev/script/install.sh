#!/bin/bash

docker exec cli peer chaincode install --lang node --name accountcc --path "/opt/gopath/src/chaincodedev/chaincode/account" --version "0"
docker exec cli peer chaincode install --lang node --name marketcc --path "/opt/gopath/src/chaincodedev/chaincode/market" --version "0"

docker exec cli peer chaincode instantiate node --channelID myc --ctor '{"Args":[]}'  --name accountcc --version "0"
docker exec cli peer chaincode instantiate node --channelID myc --ctor '{"Args":[]}'  --name marketcc --version "0"
