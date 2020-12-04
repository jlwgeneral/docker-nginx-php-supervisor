FROM corbosman/nginx-php:7.2
MAINTAINER jlw<wjl931@qq.com>

ENV TIMEZONE Asia/Shanghai
ENV TZ Asia/Shanghai
RUN echo -e 'https://mirrors.aliyun.com/alpine/v3.6/main/\nhttps://mirrors.aliyun.com/alpine/v3.6/community/' > /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk --no-cache add ttf-dejavu fontconfig \
	&& apk add supervisor \
    && rm -rf /var/cache/apk/*

RUN mkdir -p /etc/services.d/supervisor/ \
	&& mkdir -p /etc/supervisor.d/ \
	&& mkdir -p /www/ \
	&& mkdir -p /var/run/php/ \
	&& touch /www/http.conf \
	&& touch /www/supervisor.ini \
	&& ln -s /www/http.conf /etc/nginx/conf.d/http.conf \
	&& ln -s /www/supervisor.ini  /etc/supervisor.d/supervisor.ini

COPY supervisor /etc/services.d/supervisor/run
COPY php-fpm.conf /usr/local/etc/php-fpm.conf
ADD pool.d /usr/local/etc/pool.d/

CMD ["/init"]
