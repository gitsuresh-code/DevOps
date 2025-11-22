#base image 
FROM node:20

#it will create directory and change directory to server
WORKDIR /opt/server

#to copy the files to current directory
COPY package.json .
COPY *.js .

#to install the dependencies
RUN npm install

#to set environment variable and connect to mongodb
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"

#to run the container
CMD ["node", "server.js"]


# meta info to users so that they can understand on which PORT container is running
EXPOSE 8080

