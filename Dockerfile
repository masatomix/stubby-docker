FROM ubuntu
MAINTAINER masatomix

RUN apt update
RUN apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x |  bash -
RUN apt install -y nodejs
RUN apt install -y git

RUN npm install --global grunt-cli bower  yo generator-karma generator-angular
RUN apt install -y ruby
RUN apt install -y ruby-dev build-essential
RUN gem install compass

ARG user="stubby"
ARG homeDir="/home/${user}"

RUN useradd ${user}

WORKDIR ${homeDir}

ADD Gruntfile.js ${homeDir}/Gruntfile.js
ADD package.json ${homeDir}/package.json
ADD grunt ${homeDir}/grunt
ADD mocks ${homeDir}/mocks

RUN chown -R ${user}:${user} ${homeDir}
USER ${user}
RUN npm install 

CMD ["grunt","serve"]
