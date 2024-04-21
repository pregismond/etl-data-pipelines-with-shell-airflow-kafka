"""
SCRIPT: ETL_toll_data.py
AUTHOR: Pravin Regismond
DATE: 2024-04-11
DESCRIPTION: Final Assignment (Part 1) - Creating ETL Data Pipelines using
             Bash with Apache Airflow

AUDIT TRAIL START                               INIT  DATE
----------------------------------------------  ----- -----------
1. Initial version                              PR    2024-04-11

AUDIT TRAIL END
"""

# Import libraries
from datetime import timedelta
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.utils.dates import days_ago

# Task 1.1 - Define DAG arguments
default_args = {
    'owner': 'airflow',
    'start_date': days_ago(0),
    'email': ['airflow@example.com'],
    'email_on_failure': True,
    'email_on_retry': True,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# Task 1.2 - Define the DAG
dag = DAG(
    dag_id='ETL_toll_data',
    schedule_interval=timedelta(days=1),
    default_args=default_args,
    description='Apache Airflow Final Assignment',
)

# Task 1.9 - Create a task
extract_transform_load = BashOperator(
    task_id="extract_transform_load",
    bash_command="/home/project/airflow/dags/Extract_Transform_data.sh ",
    dag=dag,
)

# task pipeline
extract_transform_load
