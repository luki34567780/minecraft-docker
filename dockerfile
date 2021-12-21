FROM openjdk:17-alpine3.13

# create required Folders
RUN mkdir /scripts
RUN mkdir /data
RUN mkdir /jar

# non sudo user must be allowed to access this dir
RUN chmod 777 /data
RUN chmod 755 /jar

# update image
RUN apk update
RUN apk upgrade
# we need sudo to execute as other user
RUN apk add sudo

# We need a additional user for security
RUN adduser -u 1000 -h /home/server -D server

#copy Server jar and start script
COPY server.jar /jar/server.jar
COPY script.sh /scripts/script.sh

COPY plugins /data/plugins

# set read eula to true
RUN echo eula=true > /data/eula.txt

# expose server port
EXPOSE 25565

CMD ["bin/sh","/scripts/script.sh"]