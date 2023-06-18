FROM alpine:latest
MAINTAINER cab233
ENV VERSION=3.8.0
EXPOSE 5212

WORKDIR /app

COPY run.sh /app/

RUN apk update && \
    apk add --no-cache tzdata curl && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    curl -sOL https://github.com/cloudreve/Cloudreve/releases/download/${VERSION}/cloudreve_${VERSION}_linux_amd64.tar.gz && \
    tar -xvf cloudreve_${VERSION}_linux_amd64.tar.gz && \
    touch conf.ini && \
    chmod +x cloudreve && \
    chmod +x run.sh && \
    apk del curl && \
    rm LICENSE README_zh-CN.md README.md cloudreve_${VERSION}_linux_amd64.tar.gz && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

ENTRYPOINT ["/app/run.sh"]
