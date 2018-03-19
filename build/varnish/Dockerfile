FROM ubuntu:latest

MAINTAINER Amin M

# clean up
RUN apt clean && apt update && apt upgrade -y

RUN apt-get install -y varnish

# Expose port 80
EXPOSE 80

#RUN varnishd -f /etc/varnish/default.vcl -s malloc,100M -a 0.0.0.0:80

#CMD ["varnishd", "-f", "/etc/varnish/default.vcl", "-s", "malloc,100M", "-a ", "0.0.0.0:80", " && varnishlog"]
ADD start /start

RUN chmod 0755 /start

CMD ["/bin/bash",  "-c",  "tail -f /dev/null"]
