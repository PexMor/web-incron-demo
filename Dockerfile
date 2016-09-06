FROM ubuntu:16.04

MAINTAINER Petr Moravek v0.1

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

ADD 01-base.sh /root/
ADD 02-add.sh /root/
ADD 03-add.sh /root/

RUN chmod +x /root/*.sh
RUN bash -C /root/01-base.sh 1>&2
RUN bash -C /root/02-add.sh 1>&2
RUN bash -C /root/03-add.sh 1>&2

# Use baseimage-docker's init system.
# CMD ["/sbin/my_init"]

# RUN apt-get install all_my_dependencies
# ADD my_app_files /my_app
#
# CMD ["/my_app/start.sh"]
