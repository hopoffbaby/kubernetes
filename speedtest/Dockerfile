FROM alpine:3.12.3

RUN apk add curl

RUN wget https://bintray.com/ookla/download/download_file?file_path=ookla-speedtest-1.0.0-x86_64-linux.tgz -O /tmp/ookla-speedtest-1.0.0-x86_64-linux.tgz && \
    tar -xzvf /tmp/ookla-speedtest-1.0.0-x86_64-linux.tgz && \
    rm -rvf /tmp/ookla-speedtest-1.0.0-x86_64-linux.tgz

COPY speedtest-cli.json /root/.config/ookla/speedtest-cli.json
COPY speed.sh /speed.sh

RUN chmod +x /speed.sh

CMD ["/speed.sh"]