

setup:
#		docker-compose up -d --force-recreate --remove-orphans
		docker compose --env-file ./env up --build -d
		sleep 30
		docker ps


test:
		docker exec airflow pytest -v -W ignore

test_cov:
		docker exec airflow pytest --cov -v -W 

down:
		docker compose down


