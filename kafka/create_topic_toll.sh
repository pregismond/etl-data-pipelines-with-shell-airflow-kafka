#!/bin/bash

#/*****************************************************************
# SCRIPT: create_topic_toll.sh
# AUTHOR: Pravin Regismond
# DATE: 2024-04-11
# DESCRIPTION: Create a topic named 'toll'.
#
#******************************************************************
# AUDIT TRAIL START                               INIT  DATE
# ----------------------------------------------  ----- -----------
# 1. Initial version                              PR    2024-04-11
#
# AUDIT TRAIL END
#******************************************************************/

# Create a topic named toll
cd kafka_2.12-2.8.0
bin/kafka-topics.sh --create --topic toll --bootstrap-server localhost:9092
