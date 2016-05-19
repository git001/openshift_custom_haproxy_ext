FROM openshift3/ose-haproxy-router:v3.1.1.6

COPY custom-haproxy-config.template /var/lib/haproxy/conf/haproxy-config.template
