#base image 
FROM node:20

#it will create and point to this directory
WORKDIR /opt/server

#to copy the files to current directory
COPY package.json .
COPY *.js .

#to install the dependencies
RUN npm install

#to set environment variable and connect to mongodb
ENV REDIS_HOST="redis" \
    CATALOGUE_HOST="catalogue" \
    CATALOGUE_PORT="8080"

#to run the container
CMD ["node", "server.js"]

# meta info to users so that they can understand on which PORT container is running
EXPOSE 8080


