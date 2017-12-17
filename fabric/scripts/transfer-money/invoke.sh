#!/bin/bash

. ./scripts/transfer-money/chaincodeid.sh

function usage(){ 
    echo "Usage: $0 <arguments>"
    echo "   -a <cc argment>   <cc argument> must be in the form [\"method\", \"method-arg-1\", \"method-arg-2\"]"
}

if [ "$#" -eq "0" ]; then  
    usage
fi

while getopts "v:a:" opt; do
  case $opt in
    a)
      CHAINCODE_CONSTRUCTOR=$OPTARG
      ;;
    \?)
      usage
      exit 1
      ;;
    :)
      usage
      exit 1
      ;;
  esac
done

if [ ! -z $CHAINCODE_CONSTRUCTOR ]; then
    echo "INVOKING chaincode $CHAINCODEID in $CHANNELNAME"
    constructor="{\"Args\":$CHAINCODE_CONSTRUCTOR}"
    peer chaincode invoke -o orderer.example.com:7050 -C $CHANNELNAME -n $CHAINCODEID -c $constructor
fi

