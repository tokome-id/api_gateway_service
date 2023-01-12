create-network:
	sudo docker network create tkm-public-net
	sudo docker network create tkm-internal-net

deploy-nginx:
	sudo docker compose -f docker-compose.01.nginx.yaml build api-gateway && sudo docker compose -f docker-compose.01.nginx.yaml up --no-deps -d api-gateway

deploy-core-api:
	sudo docker compose -f docker-compose.02.tokome-core.yaml build --pull --no-cache tokome-core-api && sudo docker compose -f docker-compose.02.tokome-core.yaml up --no-deps -d tokome-core-api

renew-certbot:
	sudo docker compose run --rm certbot renew

up:
	sudo docker compose -f docker-compose.01.nginx.yaml -f docker-compose.02.tokome-core.yaml -f docker-compose.03.move-core.yaml up -d

stop:
	sudo docker compose -f docker-compose.01.nginx.yaml -f docker-compose.02.tokome-core.yaml -f docker-compose.03.move-core.yaml stop

down:
	sudo docker compose -f docker-compose.01.nginx.yaml -f docker-compose.02.tokome-core.yaml -f docker-compose.03.move-core.yaml down
