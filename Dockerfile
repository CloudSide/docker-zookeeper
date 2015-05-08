FROM debian:jessie
MAINTAINER Bruce Chen <smcz@qq.com>

RUN apt-get update && apt-get install -y openjdk-7-jre-headless wget
RUN wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-3.4.6 /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
    && mkdir -p /tmp/zookeeper

ENV TZ "Asia/Shanghai"
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

ADD ./run.sh /opt/run.sh
RUN chmod 777 /opt/run.sh

EXPOSE 2181 2888 3888

WORKDIR /opt/zookeeper

VOLUME ["/opt/zookeeper/conf", "/tmp/zookeeper"]

CMD ["/opt/run.sh"]
