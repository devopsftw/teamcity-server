FROM java:openjdk-8-jre

MAINTAINER Danila Shtan <dan@e96.ru>

# Needs to survive container relaunch
# And set the env for TC to put data there

VOLUME  ["/data/teamcity"]
ENV TEAMCITY_DATA_PATH /data/teamcity

ENV TEAMCITY_DIST TeamCity-10.0.tar.gz

RUN wget http://download.jetbrains.com/teamcity/$TEAMCITY_DIST && \
    tar zxf $TEAMCITY_DIST -C /opt && \
    rm -rf $TEAMCITY_DIST

EXPOSE 8111

CMD ["/opt/TeamCity/bin/teamcity-server.sh", "run"]

