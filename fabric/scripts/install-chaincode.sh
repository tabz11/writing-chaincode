#!/bin/bash

. ./scripts/common.sh

useage="Usage: $0 [-c <chaincode id>] [-v <chaincode version>] [-p <path to chaincode>] "


if [ $# -eq 0 ]; then
  echo $useage
  exit 1
fi

while getopts "c:v:p:" opt; do
  case $opt in
    c)
      CHAINCODEID=$OPTARG
      ;;
    v)
      CHAINCODE_VERSION=$OPTARG
      ;;
    p)
      PATH_TO_CHAINCODE=$OPTARG
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

echo "Installing chaincode: $CHAINCODEID chaincode version: $CHAINCODE_VERSION"
echo "Path to chaincode: $PATH_TO_CHAINCODE"
echo
peer chaincode install -n $CHAINCODEID -v $CHAINCODE_VERSION -p $PATH_TO_CHAINCODE

