#!/usr/bin/env bash

echo '### start bootstrap ###'
echo ''

docker-compose build
docker-compose run --rm app bundle install
docker-compose run --rm app bin/rails db:create
docker-compose run --rm app bin/rails db:migrate
docker-compose run --rm app yarn install --check-files

docker-compose up -d
