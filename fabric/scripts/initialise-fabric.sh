#!/bin/bash

set -e

. ./scripts/common.sh

echo
echo "-- Creating channel --"
echo 'Named: ' $CHANNELNAME
echo
peer channel create -o orderer.example.com:7050 -c $CHANNELNAME -f ./channel-artifacts/channel.tx   

echo
echo "-- Join channel --"
echo 
peer channel join -b $CHANNELNAME.block 

exit 0