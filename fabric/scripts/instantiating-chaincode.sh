#!/bin/bash

. ./scripts/common.sh

useage="Usage: $0 [-n <channel name>] [-c <chaincode id>] [-v <chaincode version>] [-p <path to chaincode>] "


if [ $# -eq 0 ]; then
  echo $useage
  exit 1
fi

while getopts "n:c:v:a:" opt; do
  case $opt in
    n)
      CHANNELNAME=$OPTARG
      ;;
    c)
      CHAINCODEID=$OPTARG
      ;;
    v)
      CHAINCODE_VERSION=$OPTARG
      ;;
    a)
      CHAINCODE_CONSTRUCTOR=$OPTARG
      ;;
    \?)
      echo "Invalid option -$OPTARG"
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument."
      exit 1
      ;;
  esac
done

echo
echo "Instantiating chaincode id $CHAINCODEID version $CHAINCODE_VERSION"
echo "with constructor $CHAINCODE_CONSTRUCTOR"
echo "in chhanel $CHANNELNAME"
#
# Once you have successfully install a new chaincode you need to instantiate it. Remember to change the 
# value of the -v field to match the one shown above.
# Note: These are arguments currently has no effect until you have implemented something to consume it.
peer chaincode instantiate -o orderer.example.com:7050 -C $CHANNELNAME -n $CHAINCODEID -v $CHAINCODE_VERSION -c $CHAINCODE_CONSTRUCTOR  -P "OR ('Org1MSP.member')" 
