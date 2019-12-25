FROM alpine:3.11 as builder
ARG HUGO_VERSION=0.62.0
RUN wget -O- https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux-64bit.tar.gz | tar -xz -C /usr/local/bin
ADD . /src
RUN hugo -s /src

FROM alpine:3.11
RUN apk add --no-cache darkhttpd
COPY --from=builder /src/public /var/www
ENTRYPOINT [ "/usr/bin/darkhttpd" ]
CMD [ "/var/www" ]
