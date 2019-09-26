#!/bin/bash

docker exec admin.abc.com peer chaincode invoke --channelID marketc --ctor '{"Args":["buy", "user_2", "user_1", "0"]}' --name marketcc

sleep 2

docker exec admin.abc.com peer chaincode query --channelID marketc --ctor '{"Args":["get_bill", "user_2", "0"]}' --name marketcc
docker exec admin.abc.com peer chaincode query --channelID marketc --ctor '{"Args":["get_buyer_bill", "user_2"]}' --name marketcc
