From alpine

MAINTAINER pdfmail@126.com

RUN apk update && \
 apk add openjdk8 curl busybox tzdata && \
 cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
 echo Asia/Shanghai > /etc/timezone && \
 apk del tzdata && \
 apk add --no-cache ttf-dejavu && \
 rm -rf /tmp/* /var/cache/apk/*

ADD fonts/* /usr/share/fonts/

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk add --no-cache tini

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && apk add --no-cache bash tzdata fontconfig ttf-freefont graphicsmagick && apk add wkhtmltopdf --no-cache --repository http://mirrors.ustc.edu.cn/alpine/edge/testing/ --allow-untrusted
