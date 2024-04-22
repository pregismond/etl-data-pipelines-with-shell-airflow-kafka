#!/bin/bash

#/*****************************************************************
# SCRIPT: kafka_install.sh
# AUTHOR: Pravin Regismond
# DATE: 2024-04-11
# DESCRIPTION: Exercise 1 - Prepare the lab environment
#              - Download Kafka 2.8.0 for Scala 2.12
#              - Extract Kafka
#
#******************************************************************
# AUDIT TRAIL START                               INIT  DATE
# ----------------------------------------------  ----- -----------
# 1. Initial version                              PR    2024-04-11
#
# AUDIT TRAIL END
#******************************************************************/

# Download Kafka
wget https://archive.apache.org/dist/kafka/2.8.0/kafka_2.12-2.8.0.tgz

# Extract Kafka
tar -xzf kafka_2.12-2.8.0.tgz
