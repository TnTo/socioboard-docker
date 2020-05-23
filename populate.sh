#!/bin/bash
docker-compose exec -d -w /home/node/app/library/sequelize-cli socioboard-api-user "sequelize db:migrate && sequelize db:seed —seed 20190213051930-initialize_application_info.js"