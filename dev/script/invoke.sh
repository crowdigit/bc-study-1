#!/bin/bash

docker exec cli peer chaincode invoke --channelID myc --ctor '{"Args":["put_user", "user_1", "account_1"]}' --name accountcc
