#!/bin/bash

docker exec -it airflow /bin/bash

output=$(docker exec airflow airflow tasks test data_aware_producer count_products_df 2023-01-01)

echo "$output"