FROM alpine:3.4

WORKDIR /app
RUN apk add --no-cache gcc ncurses git make sudo ncurses-dev musl-dev; \
    git clone https://github.com/bartobri/no-more-secrets.git; \
    cd /app/no-more-secrets; \
    make && make install && make clean; \
    apk del gcc git make sudo ncurses-dev musl-dev
COPY ./vacancy.txt /data/vacancy.txt

ENTRYPOINT [ "/bin/sh", "-c" ]

CMD [ "sleep 0.2 && cat /data/vacancy.txt | nms -a -f green && read -n 1 -s -r -p \"\" && less /data/vacancy.txt" ]

