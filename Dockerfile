FROM --platform=$TARGETPLATFORM alpine AS runtime
ARG TARGETPLATFORM
ARG BUILDPLATFORM

ENV TZ=Asia/Shanghai

WORKDIR /data

ENV RPC_SECRET=Hello

COPY conf /root/conf
COPY entrypoint.sh /usr/local/bin/

RUN set -ex; \
	\
	apk --no-cache --no-progress upgrade; \
	apk update && apk add aria2 --no-cache; \
	chmod +x /usr/local/bin/entrypoint.sh

#The folder to store conf, ssl keys, session
VOLUME /root/conf
# User downloaded files
VOLUME /data

ENTRYPOINT [ "entrypoint.sh" ]