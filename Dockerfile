FROM ubuntu
MAINTAINER masatomix

#EXPOSE 8882
#EXPOSE 8889
#EXPOSE 7443

RUN apt update
RUN apt install -y curl
RUN curl -sL https://deb.nodesource.com/setup_8.x |  bash -
RUN apt install -y nodejs
RUN apt install -y git
RUN apt install -y vim

ARG user="stubby"
ARG homeDir="/home/${user}"

RUN useradd ${user}

WORKDIR ${homeDir}

ADD package.json ${homeDir}/package.json
ADD mocks ${homeDir}/mocks

RUN chown -R ${user}:${user} ${homeDir}
USER ${user}
RUN npm install

CMD ["./node_modules/.bin/stubby","--data","mocks/config.yaml","-w"]
