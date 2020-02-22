## SpigotMC Docker
A simple and fully functional Minecraft server based on SpigotMC


### How to use

#### Configuration

Edit the `server.properties` in `data` directory and set your values in this file. Then check the `eula.txt` in that directory and ensure it's in `true` state. Check [this](https://minecraft.gamepedia.com/Server.properties) link for more configuration on `server.properties`

#### Build Docker image

To reduce the size of image, the Dockerfile is a multistage Dockerfile. It means that first, it builds and download dependencies then create a spigot.jar file. Then another image with lower size run this file. So all the build stuffs will be deleted. In this scenario we have a 137MB docker image instead of 954MB.
With this command you can build the image. Also this Dockerfile downloads the latest version of `buildtool.jar` so everytime there's a release, you can update it easily without any modification
```
docker build -t spigotmc:TAG .
```
#### Run

Run the Docker container using this command:
```
docker run -d -p 25565:25565 -v ./data:/game --name minecraft-server numb95/spigotmc-docker
```
You can also use the `docker-compose` to run the server:
```
version: '3'
services:
  spigotmc:
    image: numb95/spigotmc-docker
    restart: always
    volumes:
       - ./data:/game
    ports:
      - 25565:25565
```
### Plugins and other stuffs
All the needed directories and files (e.g world, plugins and etc.) are placed in data directory, so feel free to add or do any modification on that files :D