# docker-zookeeper

### build
```shell
docker build -t cloudmario/docker-zookeeper .
```

### run
```shell
HOST_IP=1.1.1.1
HOST_IP_1=1.1.1.1
HOST_IP_2=2.2.2.2
HOST_IP_3=3.3.3.3
HOST_IP_4=4.4.4.4
SERVER_ID=1

docker run -d \
--net="host" \
--name="zookeeper" \
-p ${HOST_IP}:2888:2888 \
-p ${HOST_IP}:3888:3888 \
-p ${HOST_IP}:2181:2181 \
-e "SERVER_ID=${SERVER_ID}" \
-e "ADDITIONAL_ZOOKEEPER_1=server.1=${HOST_IP_1}:2888:3888" \
-e "ADDITIONAL_ZOOKEEPER_2=server.2=${HOST_IP_2}:2888:3888" \
-e "ADDITIONAL_ZOOKEEPER_3=server.3=${HOST_IP_3}:2888:3888" \
-e "ADDITIONAL_ZOOKEEPER_4=server.4=${HOST_IP_4}:2888:3888" \
-v /var/lib/zookeeper:/tmp/zookeeper \
cloudmario/docker-zookeeper
```
