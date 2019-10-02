#!/bin/bash

docker exec admin.abc.com peer chaincode invoke --channelID marketc --ctor '{"Args":["put_product", "user_1", "1000"]}' --name marketcc

sleep 2

docker exec admin.abc.com peer chaincode query --channelID marketc --ctor '{"Args":["get_product", "user_1", "0"]}' --name marketcc
docker exec admin.abc.com peer chaincode query --channelID marketc --ctor '{"Args":["get_seller_product", "user_1"]}' --name marketcc

