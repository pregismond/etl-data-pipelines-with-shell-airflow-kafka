#!/bin/bash

#/*****************************************************************
# SCRIPT: livetolldata_health.sh
# AUTHOR: Pravin Regismond
# DATE: 2024-04-11
# DESCRIPTION: Health check of the streaming data pipeline
#              - Connect to MySQL on the IBM Skills Network Labs
#              - Execute query to list the top 10 rows in the
#                livetolldata table
#
#******************************************************************
# AUDIT TRAIL START                               INIT  DATE
# ----------------------------------------------  ----- -----------
# 1. Initial version                              PR    2024-04-11
#
# AUDIT TRAIL END
#******************************************************************/

# Connect to MySQL and perform query
mysql --host=127.0.0.1 --port=3306 --user=root --password=${MYSQL_PASSWORD} --table << EOF
-- List the top 10 rows in the table livetolldata
system echo 'Listing the top 10 rows in the livetolldata table';
use tolldata;
select * from livetolldata limit 10;
exit
EOF
