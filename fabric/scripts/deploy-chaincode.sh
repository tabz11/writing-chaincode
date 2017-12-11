#!/bin/bash

CHANNELNAME="mychannel"
CHAINCODEID="mycc"

PATH_TO_CHAINCODE=${1:-'github.com/hyperledger/fabric/examples/chaincode/go/minimalcc'}
CHAINCODE_VERSION=${2:-'1.0'}
CHAINCODE_CONSTRUCTOR=${3:-'{"Args":["methodName","a","100","b","200"]}'}

echo
echo "-- Installing chaincode --"
echo
echo $PATH_TO_CHAINCODE
echo $CHAINCODE_VERSION
#
# Use this command only when you want to install a new chaincode
# If you made changes to you chaincode, you will need to change the
# version of the chaincode by changing the value of the -v field. Say from
# -v 1.0 to -v 2.0.
peer chaincode install -n $CHAINCODEID -v $CHAINCODE_VERSION -p $PATH_TO_CHAINCODE

sleep 10

echo
echo "-- Instantiating chaincode --"
echo
echo $CHAINCODE_ARG
#
# Once you have successfully install a new chaincode you need to instantiate it. Remember to change the 
# value of the -v field to match the one shown above.
# Note: These are arguments currently has no effect until you have implemented something to consume it.
peer chaincode instantiate -o orderer.example.com:7050 -C $CHANNELNAME -n $CHAINCODEID -v $CHAINCODE_VERSION -c '{"Args":["methodName","a","100","b","200"]}'  -P "OR ('Org1MSP.member')" 

exit 0