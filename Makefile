
FILE_PATH_DEST:=/dateset_final
FILE_PATH_HOME:=/dateset_start


setup:
		docker-compose up -d --force-recreate --remove-orphans
		sleep 60
		docker ps


check_permissions:
#		docker exec airflow cd /dataset_final ls -l
		docker exec airflow  $(FILE_PATH_HOME) ls -l

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
