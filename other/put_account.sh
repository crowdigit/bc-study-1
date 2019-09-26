#!/bin/bash

docker exec admin.abc.com peer chaincode invoke --channelID accountc --ctor '{"Args":["put_user", "user_1", "account_1"]}' --name accountcc
docker exec admin.abc.com peer chaincode invoke --channelID accountc --ctor '{"Args":["put_user", "user_2", "account_2"]}' --name accountcc

sleep 2

docker exec admin.abc.com peer chaincode query --channelID accountc --ctor '{"Args":["get_user", "user_1"]}' --name accountcc
docker exec admin.abc.com peer chaincode query --channelID accountc --ctor '{"Args":["get_user", "user_2"]}' --name accountcc
