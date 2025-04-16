# Asterisk on docker

## Running instructions 

1. Make sure you have docker installed in your machine
2. `docker build -t asterisk-docker .` # don't forget the dot at the end  
    This will create an image in your local machine which we will run in next step
3. `docker run -it --name=asterisk-server --network=host IMAGE_ID` 
    If you don't know the image_id then you can see the list if images by `docker images`
4. Enjoy! Happy calling

### Check the setup 

You can do `docker ps` to check the container is running or not. and if you want to ssh into the container then use `docker exec -it CONTAINER_ID /bin/bash`. 



## TODO
[ ] Add docker-compose file
[ ] Optimize the image for storage 
