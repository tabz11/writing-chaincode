#!/bin/bash

invokeArgs={"ownername":"owner1","ownerType":"type","sd":"sd","ed":"ed","qty":"qty","pos":"pos","contractid":"contactID"}

constructor={\"Args\":[\"initialiseOwnerData\",\"OwnerID1\",\"$invokeArgs\"]}

echo $constructor
peer chaincode invoke -o orderer.example.com:7050 -C mychannel -n mycc -c $constructor