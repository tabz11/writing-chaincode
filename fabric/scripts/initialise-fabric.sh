#!/bin/bash

set -e

CHANNELNAME="mychannel"

echo
echo "-- Creating channel --"
echo
peer channel create -o orderer.example.com:7050 -c $CHANNELNAME -f ./channel-artifacts/channel.tx   

echo
echo "-- Join channel --"
echo 
peer channel join -b $CHANNELNAME.block 

exit 0