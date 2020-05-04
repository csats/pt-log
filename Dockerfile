FROM alpine:3

RUN \
  apk update && \
  apk upgrade && \
  apk add ca-certificates openssl && \
  wget https://github.com/papertrail/remote_syslog2/releases/download/v0.20/remote_syslog_linux_amd64.tar.gz && \
  echo "fc1f56eab0eab0dfde6839c1c59a430170637729  remote_syslog_linux_amd64.tar.gz" > SHA1SUM && \
  sha1sum -c SHA1SUM && \
  tar -xvzf remote_syslog_linux_amd64.tar.gz && \
  rm SHA1SUM remote_syslog_linux_amd64.tar.gz && \
  rm -rf /var/cache/apk/*

COPY logit watchlogs /

CMD [ "/watchlogs" ]
