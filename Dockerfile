FROM alpine:3.10
LABEL maintainer "Axel Etcheverry - https://github.com/euskadi31"
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 22
COPY rootfs /

RUN apk add --no-cache openssh openssl \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && openssl rand -base64 32 | chpasswd \
  && passwd -d root
