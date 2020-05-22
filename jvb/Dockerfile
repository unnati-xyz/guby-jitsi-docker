ARG JITSI_REPO=jitsi
FROM guby/base-java

RUN \
	apt-dpkg-wrap apt-get update && \
	apt-dpkg-wrap apt-get install -y jitsi-videobridge2 jq curl && \
	apt-cleanup

COPY rootfs/ /

VOLUME /config
