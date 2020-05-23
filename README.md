# socioboard-docker
Docker-compose stack for Socioboard 4.0

__NOT WORKING__

This docker-compose stack aims to install [SocioBoard](https://github.com/socioboard/Socioboard-4.0/) released under GPLv3 license.

SocioBoard main page is expose on 172.10.0.2:80

To populate the SQL DB you should open a shell in any socioboard-api-* container and run
```
cd ../library/sequelize-cli/
sequelize db:migrate && sequelize db:seed —seed 2019021305
```
SQL volume is persistente so, unless you delete the volume, you need to do this only the first time.

#### What is not working
* node cointainers (i.e. socioboard-api-*) crash at startup
* links in the SocioBoard main page are broken
* no e-mail server (sendgrid is not in the stack)
* no https configuration
* Sometime ```docker-composed up``` fails at first attempt, but repeating the command solve the issue.

__I'm not plan to try to solve this issues. Feel free to fork and improve!__