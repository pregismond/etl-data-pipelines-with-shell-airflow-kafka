#!/bin/bash

#/*****************************************************************
# SCRIPT: start_zookeeper.sh
# AUTHOR: Pravin Regismond
# DATE: 2024-04-11
# DESCRIPTION: Start Zookeeper server
#
#******************************************************************
# AUDIT TRAIL START                               INIT  DATE
# ----------------------------------------------  ----- -----------
# 1. Initial version                              PR    2024-04-11
#
# AUDIT TRAIL END
#******************************************************************/

# Start Zookeeper server
cd kafka_2.12-2.8.0
bin/zookeeper-server-start.sh config/zookeeper.properties
