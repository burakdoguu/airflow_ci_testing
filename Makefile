setup:
#		docker-compose up -d --force-recreate --remove-orphans
		docker compose -f docker-compose-new.yml
		sleep 30
		docker ps


test:
		docker exec airflow-scheduler pytest -v -W ignore

test_cov:
		docker exec airflow-scheduler pytest --cov -v -W 

down:
		docker compose down


