FROM nginx:alpine

EXPOSE 8000

RUN    ln -sf /dev/stdout /tmp/access.log \
    && ln -sf /dev/stderr /tmp/error.log

COPY http.js    /etc/nginx/
COPY nginx.conf /etc/nginx/

#USER nginx

ENTRYPOINT ["/usr/sbin/nginx"]


