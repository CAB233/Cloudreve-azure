FROM alpine:latest

WORKDIR /app

COPY run.sh /app/

RUN apk update \
    && apk add --no-cache tzdata curl\
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && curl -sOL https://github.com/cloudreve/Cloudreve/releases/download/3.7.1/cloudreve_3.7.1_linux_amd64.tar.gz \
    && tar -xvf cloudreve_3.7.1_linux_amd64.tar.gz \
    && rm LICENSE README_zh-CN.md README.md cloudreve_3.7.1_linux_amd64.tar.gz \
    && touch conf.ini \
    && chmod +x cloudreve \
    && chmod +x run.sh

EXPOSE 5212

CMD sh /app/run.sh
