# FROM alpine:latest
FROM alpine:edge

RUN apk update && apk add --no-cache \
    bash \
    grep \
    python3 py3-pip

RUN pip install pyyaml --break-system-packages

RUN echo "*	*	*	*	*	run-parts /etc/periodic/1min" >> /etc/crontabs/root

RUN mkdir /src
RUN mkdir /etc/periodic/1min

ADD ./src/ /src/
RUN chmod 0755 /src/*

RUN mv /src/start.sh /etc/periodic/1min

ENTRYPOINT ["/src/entrypoint.sh"]
