FROM multiarch/alpine:aarch64-edge 

ENV TZ=Asia/Shanghai

WORKDIR /data

ENV RPC_SECRET=Hello

COPY conf /root/conf
COPY aria2c.sh /root/aria2c.sh

RUN set -ex; \
	\
	sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
	apk --no-cache --no-progress upgrade; \
	apk update && apk add aria2 --no-cache; \
	chmod +x /root/aria2c.sh

#The folder to store conf, ssl keys, session
VOLUME /root/conf
# User downloaded files
VOLUME /data

CMD ["/bin/sh", "/root/aria2c.sh" ]
