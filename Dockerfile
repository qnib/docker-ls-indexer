FROM qnib/logstash
MAINTAINER "Christian Kniep <christian@qnib.org>"

# Redis
RUN yum install -y redis python-redis
ADD etc/diamond/collectors/RedisCollector.conf /etc/diamond/collectors/

# Add key,cert
ADD etc/pki/tls/certs/logstash-forwarder.crt /etc/pki/tls/certs/
ADD etc/pki/tls/private/logstash-forwarder.key /etc/pki/tls/private/

# Add redis startscript
ADD etc/supervisord.d/redis.ini /etc/supervisord.d/
# Overwrite logstash check with service checks
ADD etc/consul.d/check_logstash.json /etc/consul.d/check_logstash.json
