ARG JITSI_REPO=jitsi
# FROM ${JITSI_REPO}/base
FROM ubuntu:bionic

ADD https://github.com/just-containers/s6-overlay/releases/download/v2.0.0.1/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / --exclude='./bin' && tar xzf /tmp/s6-overlay-amd64.tar.gz -C /usr ./bin

RUN apt-get update && apt-get install -y apt-transport-https software-properties-common wget vim curl patch sed ufw sudo && apt-add-repository universe && apt-get update

RUN wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | apt-key add - && \
    sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list" && \
    apt-get update

# RUN sudo ufw allow 80 && sudo ufw allow 443 && sudo ufw allow in 10000:20000/upd && sudo ufw enable

RUN apt-get install -y openjdk-8-jre-headless nginx
RUN apt install -y jitsi-meet

# RUN patch -d /usr/lib/prosody/modules/muc -p0 < /prosody-plugins/muc_owner_allow_kick.patch

# COPY rootfs/ /

EXPOSE 80 5222 5269 5347 5280

# VOLUME ["/config", "/prosody-plugins-custom"]
