docker-compose build
docker-compose run --rm signup_ms rails db:create
docker-compose run --rm signup_ms rails db:migrate
docker-compose up
