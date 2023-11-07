from airflow import DAG
from airflow.datasets import Dataset
from airflow.operators.python import PythonOperator

from datetime import datetime
import pandas as pd


csv_dataset=Dataset("/opt/airflow/dataset_final/count_product.csv")

def count_products():
    df = pd.read_csv("/opt/airflow/dataset_start/product-category-map.csv")
    total_product_by_category = df.groupby("categoryid").count()
    df_config = total_product_by_category.reset_index()
    df_config.to_csv("/opt/airflow/dataset_final/count_product.csv", index=False)

def read_dataset():
    with open("/opt/airflow/dataset_final/count_product.csv","r") as f:
        print(f.read())

with DAG(
    dag_id="data_aware_producer",
    start_date=datetime(2022, 1, 1),
    schedule='* * * * *', #at every minute
    catchup=False ):

    count_products_df = PythonOperator(
        task_id="count_products_df",
        python_callable=count_products,
        outlets=[csv_dataset]
    )


with DAG(
    dag_id="data_aware_consumer",
    start_date=datetime(2022, 1, 1),
    schedule=[csv_dataset]):

    read_dataset=PythonOperator(
        task_id="read_dataset",
        python_callable=read_dataset
    )


