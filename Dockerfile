FROM alpine:3.18.2

RUN apk add --update smokeping bash curl bc bind-tools fping tcptraceroute perl-lwp-protocol-https && rm -rf /var/cache/apk/*

RUN [ -d /usr/data ] || mkdir -p /usr/data && \
    [ -d /usr/cache/smokeping ] || mkdir -p /usr/cache/smokeping && \
    [ -d /var/smokeping ] || mkdir -p /var/smokeping

RUN echo "" -n >> /var/log/smokeping.log

RUN curl -o /usr/bin/tcpping http://www.vdberg.org/~richard/tcpping && chmod 755 /usr/bin/tcpping

COPY entrypoint.sh .

RUN chmod 755 ./entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]
