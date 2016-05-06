FROM java:8-jre

ENV DRILL 1.6.0

ENV APACHE /opt/apache
RUN mkdir -p $APACHE/archive $APACHE/drill

ENV PACKAGE apache-drill-$DRILL.tar.gz

RUN wget "http://www.apache.org/dyn/closer.lua?filename=drill/drill-$DRILL/$PACKAGE&action=download" --output-document=$APACHE/archive/drill.tar.gz

RUN tar -xzvf $APACHE/archive/drill.tar.gz --directory $APACHE/drill --strip-components=1

ADD conf/ $APACHE/drill/conf/

WORKDIR $APACHE

ENTRYPOINT [ "drill/bin/runbit" ]
