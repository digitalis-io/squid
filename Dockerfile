FROM centos:7

RUN yum -y install squid openssl
COPY squid.conf.template /etc/squid/squid.conf
COPY myCA.pem /etc/squid/ssl_cert/myCA.pem
COPY entrypoint.sh /entrypoint.sh
RUN chown -R squid:squid /etc/squid && chmod 755 /entrypoint.sh && yum clean all

CMD ["/entrypoint.sh"]
