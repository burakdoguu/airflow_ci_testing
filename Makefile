setup:
		docker-compose up -d --force-recreate --remove-orphans
#		docker compose -f docker-compose-new.yml up -d
		sleep 30
		docker ps

test:
		docker exec airflow pytest -v -W ignore

test_cov:
		docker exec airflow pytest --cov -v -W ignore

down:
		docker compose down


