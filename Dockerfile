FROM registry.access.redhat.com/rhel7
MAINTAINER cleciovarjao@gmail.com

ENV PHP_UPLOAD_MAX_FILESIZE=64M \
    PHP_MAX_INPUT_VARS=2000
    
RUN rpm -Uvh 'https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm' && \
    rpm -Uvh 'https://mirror.webtatic.com/yum/el7/webtatic-release.rpm' && \
    yum install -y tar sudo cronie php56w-cli php56w-mysql php56w-opcache php56w-common php56w-gd php56w-mcrypt php56w-xml curl && \
    sed -i '/Defaults    requiretty/s/^/#/' /etc/sudoers

ADD https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz /tmp/phpmyadmin.tar.gz
ADD https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64 /usr/local/bin/gosu
ADD https://github.com/tianon/gosu/releases/download/1.9/gosu-amd64.asc /usr/local/bin/gosu.asc
COPY ./files/ /

RUN chmod +x /usr/local/bin/gosu
RUN mkdir -p /app/phpmyadmin/www && \
    tar xzf /tmp/phpmyadmin.tar.gz --strip-components=1 -C /app/phpmyadmin/www && \
    useradd -Um phpmyadmin && \
    chmod +x /app/phpmyadmin/run.sh
    
EXPOSE 80 8080
#tar xzf /tmp/phpmyadmin.tar.gz -C /tmp/phpmyadmin
ENTRYPOINT ["/app/phpmyadmin/run.sh"]
