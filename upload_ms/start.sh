docker-compose build
docker-compose run --rm upload_ms rails db:create
docker-compose run --rm upload_ms rails db:migrate
docker-compose up