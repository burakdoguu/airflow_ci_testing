
FILE_PATH_DEST:=/opt/airflow/dateset_final/count_product.csv
FILE_PATH_HOME:=/opt/airflow/dateset_start/product-category-map.csv


setup:
		docker-compose up -d --force-recreate --remove-orphans
		sleep 60
		docker ps


check_permissions:
		docker exec airflow /dataset_final ls -l
#		docker exec airflow ls -l $(FILE_PATH_HOME)

update_permissions:
		docker exec airflow chmod +rw $(FILE_PATH_HOME)

test:
		docker exec airflow pytest -v -W ignore

test_cov:
		docker exec airflow pytest --cov -v -W 

down:
		docker compose down

#dag_test:
#		docker exec airflow airflow tasks test data_aware_consumer read_dataset 2023-01-01
