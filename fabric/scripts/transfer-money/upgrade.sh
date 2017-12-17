#!/bin/bash

. ./scripts/transfer-money/chaincodeid.sh

#CHAINCODE_VERSION='2.0'
#CHAINCODE_CONSTRUCTOR='{"Args":["methodName","a","100","b","200"]}'

function usage(){ 
    echo "Usage: $0 <arguments>"
    echo "   -v <version>      <version> must be numeric type"
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
    v)
      CHAINCODE_VERSION=$OPTARG
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


if [ ! -z $CHAINCODE_VERSION ] || [ ! -z $CHAINCODE_CONSTRUCTOR ]; then
    echo "UPGRADING chaincode $CHAINCODEID to version $CHAINCODE_VERSION"
    echo "in $CHANNELNAME"
    echo "with constructor $CHAINCODE_CONSTRUCTOR"
    constructor="{\"Args\":$CHAINCODE_CONSTRUCTOR}"
    peer chaincode upgrade -n $CHAINCODEID -v $CHAINCODE_VERSION -c $constructor -C $CHANNELNAME
fi

