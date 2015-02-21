FROM qnib/logstash
MAINTAINER "Christian Kniep <christian@qnib.org>"

# Redis
RUN yum install -y redis python-redis
ADD etc/diamond/collectors/RedisCollector.conf /etc/diamond/collectors/

# Add key,cert
ADD etc/pki/tls/certs/logstash-forwarder.crt /etc/pki/tls/certs/
ADD etc/pki/tls/private/logstash-forwarder.key /etc/pki/tls/private/

# Should move to terminal
ADD opt/qnib/bin/ /opt/qnib/bin/
ADD etc/supervisord.d/ /etc/supervisord.d/

# move up
RUN mkdir -p /root/bin/ && \
    ln -s /opt/qnib/bin/* /root/bin/
