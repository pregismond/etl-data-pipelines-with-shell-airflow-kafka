#!/bin/bash

#/*****************************************************************
# SCRIPT: start_kafka.sh
# AUTHOR: Pravin Regismond
# DATE: 2024-04-11
# DESCRIPTION: Start Kafka message broker service.
#
#******************************************************************
# AUDIT TRAIL START                               INIT  DATE
# ----------------------------------------------  ----- -----------
# 1. Initial version                              PR    2024-04-11
#
# AUDIT TRAIL END
#******************************************************************/

# Start Kafka message broker service
cd kafka_2.12-2.8.0
bin/kafka-server-start.sh config/server.properties
