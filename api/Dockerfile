FROM node:alpine AS socioboard-api
ENV node_env=development
WORKDIR /home/node/app
COPY Socioboard-4.0/socioboard-api/library/ /home/node/app/library/
COPY api/config.json /home/node/app/library/sequelize-cli/config/config.json
RUN npm install -g sequelize-cli; \
    cd library; npm install; npm audit fix; cd ..
RUN cd library/sequelize-cli; sequelize db:migrate; sequelize db:seed —seed 20190213051930-initialize_application_info.js; cd ../..
EXPOSE 3000
EXPOSE 5000
CMD ["node", "app.js"]

FROM socioboard-api
ARG API_NAME
WORKDIR /home/node/app/${API_NAME}
COPY Socioboard-4.0/socioboard-api/${API_NAME}/ /home/node/app/${API_NAME}/
RUN npm install; npm audit fix
COPY api/config.json /home/node/app/${API_NAME}/config/config.json
COPY api/development.json /home/node/app/${API_NAME}/config/development.json
