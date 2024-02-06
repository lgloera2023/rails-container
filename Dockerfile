# Won't do latest since Github Actions doesn't support 3.3 yet
FROM ruby:3.2.2

RUN apt-get update

# Install everything we need for Ruby on Rails with PSQL
RUN apt-get -y install postgresql postgresql-contrib libpq-dev
RUN apt-get -y install vim

# NodeJS installation script
RUN curl -SLO https://deb.nodesource.com/nsolid_setup_deb.sh
RUN chmod 500 nsolid_setup_deb.sh
RUN ./nsolid_setup_deb.sh 20
RUN apt-get -y install nodejs
RUN npm install --global yarn
RUN npm install -g heroku

# Shell scripts allow user to configure:
# 1) Shortcut to launch rails server in container
# 2) Universally preloaded gems
# 3) Database setup
COPY rserver /bin/rserver
RUN chmod +x /bin/rserver
COPY rap /bin/rap
RUN chmod +x /bin/rap
COPY gems.txt /user_dev/gems.txt
COPY install_gems.sh /user_dev/install_gems.sh
RUN cd /user_dev && ./install_gems.sh
COPY entrypoint.sh /user_dev/entrypoint.sh
ENTRYPOINT ["/user_dev/entrypoint.sh"]