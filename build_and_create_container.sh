docker build \
    -t minecraft_1.17.1_server \
    .

# create dir
mkdir /docker/minecraft_1.17.1_server/

# copy jar
cp server.jar /docker/minecraft_1.17.1_server/server.jar

# copy plugins folder
cp plugins /docker/minecraft_1.17.1_server/ -r

docker run \
    -d \
    --name "minecraft_1.17.1_server" \
    --publish 9001:9001 \
    --publish 9030:9030 \
    -v /docker/minecraft_1.17.1_server:/data/ \
    tor_image