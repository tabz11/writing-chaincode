#!/bin/bash

. ./scripts/transfer-money/chaincodeid.sh

CHAINCODE_VERSION='1.0'
PATH_TO_CHAINCODE='github.com/hyperledger/fabric/examples/chaincode/go/money-transfer'
echo "INSTALLING chaincode $CHAINCODEID version $CHAINCODE_VERSION in $PATH_TO_CHAINCODE"
echo
peer chaincode install -n $CHAINCODEID -v $CHAINCODE_VERSION -p $PATH_TO_CHAINCODE

CHAINCODE_CONSTRUCTOR='{"Args":["methodName","a","100","b","200"]}'
echo "INSTANTIATING chaincode $CHAINCODEID version $CHAINCODE_VERSION in $CHANNELNAME"
echo "with constructor $CHAINCODE_CONSTRUCTOR"
echo
peer chaincode instantiate -o orderer.example.com:7050 -C $CHANNELNAME -n $CHAINCODEID -v $CHAINCODE_VERSION -c $CHAINCODE_CONSTRUCTOR  -P "OR ('Org1MSP.member')" 


