


docker-up:
		docker compose up -d 

perms:
		sudo chmod u=rwx,g=rwx,o=rwx dags tests 


dag_test:
		docker exec airflow airflow tasks test data_aware_consumer read_dataset 2023-01-01














#setup:
#		docker-compose up -d --force-recreate --remove-orphans
#		sleep 120
#		docker ps
#
#down:
#		docker-compose down
#
#test:
#		docker exec airflow pytest -v -W ignore
#
#test_cov:
#		docker exec airflow pytest --cov -v -W ignore
#
#dag_test:
#		docker exec airflow airflow tasks test data_aware_consumer read_dataset 2023-01-01
