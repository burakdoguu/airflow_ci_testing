include .env

setup:
		docker-compose up -d --force-recreate --remove-orphans
		sleep 120

down:
		docker-compose down

test:
		docker exec airflow pytest -v -W ignore

test_cov:
		docker exec airflow pytest --cov -v -W ignore

dag_test:
		docker exec airflow airflow tasks test data_aware_producer count_products_df 2023-01-01
