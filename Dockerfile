FROM alpine:3.9.6
RUN apk update && apk add --no-cache tcpdump iproute2 net-tools curl wget bind-tools mtr httpie
CMD ["/bin/sh"]
