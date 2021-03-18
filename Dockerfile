FROM ubuntu:20.04

MAINTAINER Joan Marc Carbo Arnau <jmcarbo@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install \
  cups \
  cups-filters \
  cups-pdf \
  whois \
  hplip \
  && rm -rf /var/lib/apt/lists/*

# Remove backends that don't make sense for container
RUN rm /usr/lib/cups/backend/parallel \
  && rm /usr/lib/cups/backend/serial \
  && rm /usr/lib/cups/backend/usb

#COPY etc-cups /etc/cups

VOLUME /etc/cups/ /var/log/cups /var/spool/cups /var/cache/cups

#RUN sed -i 's/localhost:631/0.0.0.0:631/g' /etc/cups/cupsd.conf
COPY cupsd.conf /etc/cups/cupsd.conf

COPY etc-pam.d-cups /etc/pam.d/cups

COPY start_cups.sh /root/start_cups.sh
RUN chmod +x /root/start_cups.sh \
  && mkdir -p /etc/cups/ssl

CMD ["/root/start_cups.sh"]

EXPOSE 631
