FROM debian:bullseye

RUN apt-get update -y && \
	apt-get install sudo curl iproute2 systemctl -y

RUN curl -o /tmp/install_retronas.sh https://raw.githubusercontent.com/danmons/retronas/main/install_retronas.sh
RUN chmod a+x /tmp/install_retronas.sh
RUN /tmp/install_retronas.sh


# This is a entrypoint to use while working on this
ENTRYPOINT ["tail", "-f", "/dev/null"]

# This entrypoint seems wrong as its interactive. Will likely change
# ENTRYPOINT ["/opt/retronas/retronas.sh"]

