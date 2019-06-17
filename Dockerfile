FROM busybox:latest
LABEL maintainer="Chris <c@crccheck.com>"

ADD index.html /www/index.html

EXPOSE 80
HEALTHCHECK CMD nc -z localhost 80

# Create a basic webserver and run it until the container is stopped
CMD trap "exit 0;" TERM INT; httpd -p 80 -h /www -f & wait

#V1.0