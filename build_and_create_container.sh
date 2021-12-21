docker build \
    -t minecraft_1.17.1_server \
    .

# create dir
mkdir /docker/minecraft_1.17.1_server/

curl https://papermc.io/api/v2/projects/paper/versions/1.17.1/builds/402/downloads/paper-1.17.1-402.jar -o server.jar

# copy jar
cp server.jar /docker/minecraft_1.17.1_server/server.jar

# copy plugins folder
cp plugins /docker/minecraft_1.17.1_server/ -r

docker run \
    -d \
    --restart unless-stopped \
    --name "minecraft_1.17.1_server" \
    --publish 25565:25565 \
    -v /docker/minecraft_1.17.1_server:/data/ \
    tor_image