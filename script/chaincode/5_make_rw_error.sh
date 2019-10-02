#!/bin/bash

echo "--- put seller user_3"
docker exec admin.abc.com peer chaincode invoke --channelID marketc --ctor '{"Args":["put_seller", "user_3", "0"]}' --name marketcc

sleep 2

echo "--- put product 0 and 1"
docker exec admin.abc.com peer chaincode invoke --channelID marketc --ctor '{"Args":["put_product", "user_3", "1100"]}' --name marketcc &
docker exec admin.abc.com peer chaincode invoke --channelID marketc --ctor '{"Args":["put_product", "user_3", "1200"]}' --name marketcc &

sleep 4

echo "--- get products of seller user_3"

docker exec admin.abc.com peer chaincode query --channelID marketc --ctor '{"Args":["get_seller_product", "user_3"]}' --name marketcc
