#!/bin/bash

#/*****************************************************************
# SCRIPT: Extract_Transform_data.sh
# AUTHOR: Pravin Regismond
# DATE: 2024-04-11
# DESCRIPTION: Final Assignment (Part 1) - Creating ETL Data
#              Pipelines using Bash with Apache Airflow 
#
#******************************************************************
# AUDIT TRAIL START                               INIT  DATE
# ----------------------------------------------  ----- -----------
# 1. Initial version                              PR    2024-04-11
# 2. Modified to remove ^M characters when        PR    2024-04-27
#    extracting data from TSV file
#
# AUDIT TRAIL END
#******************************************************************/

# Unzip the data
echo "Unzipping the data..."
tar -xzf /home/project/airflow/dags/tolldata.tgz -C /home/project/airflow/dags

# Extract data from CSV file
echo "Extracting data from the CSV file..."
cut -d "," -f1-4 /home/project/airflow/dags/vehicle-data.csv > /home/project/airflow/dags/csv_data.csv

# Extract data from TSV file
echo "Extracting data from the TSV file..."
# Modified to remove ^M characters (carriage returns) found in tollplaza-data.tsv file
# Used awk command with gsub to remove carriage return after trying sed command, which did not give the desired results
# cut -f5-7 /home/project/airflow/dags/tollplaza-data.tsv | tr "\t" "," > /home/project/airflow/dags/tsv_data.csv
cut -f5-7 /home/project/airflow/dags/tollplaza-data.tsv | awk '{gsub(/\r/,""); print}' | tr "\t" "," > /home/project/airflow/dags/tsv_data.csv

# Extract data from fixed-width file
echo "Extracting data from the fixed-width file..."
cut -c 59- /home/project/airflow/dags/payment-data.txt | tr " " "," > /home/project/airflow/dags/fixed_width_data.csv

# Consolidate data from previous tasks
echo "Consolidating data from previous tasks..."
paste -d "," /home/project/airflow/dags/csv_data.csv \
    /home/project/airflow/dags/tsv_data.csv \
    /home/project/airflow/dags/fixed_width_data.csv \
    > /home/project/airflow/dags/extracted_data.csv

# Transform and load the data
echo "Transforming and loading the data..."
sed 's/[^,]*/\U&/4' /home/project/airflow/dags/extracted_data.csv > /home/project/airflow/dags/transformed_data.csv

echo "Data processing completed!"
