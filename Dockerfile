FROM registry.access.redhat.com/rhscl/php-56-rhel7
MAINTAINER cleciovarjao@gmail.com
ADD https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz /tmp/phpmyadmin.tar.gz
RUN tar -C /tmp -xzf /tmp/gogs.tar.gz)
ENTRYPOINT ["top", "-b"]
