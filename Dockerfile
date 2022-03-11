FROM debian:bullseye-slim

RUN apt-get update \
    && apt-get install openssh-client -y \
    && apt-get clean \
	&& groupadd --gid 1000 -r sshclient && useradd --uid 1000 --create-home --system -g sshclient sshclient \
	&& mkdir -p /home/sshclient/.ssh \
	&& chown -R sshclient:sshclient /home/sshclient

USER sshclient
