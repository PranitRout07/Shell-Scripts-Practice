#!/bin/bash
# Before runnin the script
if docker ps | grep aquila;then
    docker stop aquila
    docker rm aquila  
fi
# Set environment variables
export MONGODB_URI=mongodb://10.0.0.48:27017/
export LANGUAGE=en
export FIRSTNAME=Admin
export LASTNAME=User
export EMAIL=admin@gmail.com
export PASSWORD=Pranit123
export APPURL=http://10.0.1.74:3010
export ADMIN_PREFIX=admin
export SITENAME=demo

# Start Docker container with environment variables
echo "Starting Docker container..."
docker run -d \
  -p 10.0.1.74:3010:3010/tcp \
  --name aquila \
  -e MONGODB_URI=$MONGODB_URI \
  -e LANGUAGE=$LANGUAGE \
  -e FIRSTNAME=$FIRSTNAME \
  -e LASTNAME=$LASTNAME \
  -e EMAIL=$EMAIL \
  -e PASSWORD=$PASSWORD \
  -e APPURL=$APPURL \
  -e ADMIN_PREFIX=$ADMIN_PREFIX \
  -e SITENAME=$SITENAME \
  pranit007/aquilacms

# Monitor installation process
echo "Installing.."
sleep 150
echo "RESTARTING THE CONTAINER..."
sudo docker restart aquila
echo "SUCCESSFULLY RESTARTED..."
