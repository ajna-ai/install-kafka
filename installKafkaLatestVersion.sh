#!/bin/bash

###
##
# File should have +rwx permission
# Run file in home directory
##
# Download the kafka file wrt to given version.
# Then Extract 
# move all extractd file to directory in home as "kafka" name. and remove old folder
###

# kafkaVersion=$2
# scalaVersion=$1

kafkaVersion=$(jq --raw-output '.kafka.kafkaVersion' config.json)
scalaVersion=$(jq --raw-output '.kafka.scalaVersion' config.json)

wget https://mirrors.estointernet.in/apache/kafka/$kafkaVersion/kafka_$scalaVersion-$kafkaVersion.tgz
tar xzf kafka_$scalaVersion-$kafkaVersion.tgz && mv kafka_$scalaVersion-$kafkaVersion kafka && rm -rf kafka_$scalaVersion-$kafkaVersion.tgz

