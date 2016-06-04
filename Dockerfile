FROM registry.access.redhat.com/rhel7
MAINTAINER cleciovarjao@gmail.com

RUN yum install -y tar sudo cronie php56 && \
    sed -i '/Defaults    requiretty/s/^/#/' /etc/sudoers

ADD https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz /tmp/phpmyadmin.tar.gz
ADD https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64 /usr/local/bin/gosu
ADD https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64.asc /usr/local/bin/gosu.asc


RUN chmod +x /usr/local/bin/gosu
RUN uname -a  && whoami && mkdir -p /tmp/phpmyadmin && \
    ls -la /tmp
EXPOSE 80 8080
#tar xzf /tmp/phpmyadmin.tar.gz -C /tmp
ENTRYPOINT ["top", "-b"]
