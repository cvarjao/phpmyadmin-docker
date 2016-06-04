FROM registry.access.redhat.com/rhscl/php-56-rhel7
MAINTAINER cleciovarjao@gmail.com
ADD https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz /tmp/phpmyadmin.tar.gz
RUN uname -a  && mkdir -p /tmp/phpmyadmin && \
    ls -la /tmp

#tar xzf /tmp/phpmyadmin.tar.gz -C /tmp
ENTRYPOINT ["top", "-b"]
