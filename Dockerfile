FROM pingme998/ss-tor:1

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget unzip qrencode\
    && apt install -y shadowsocks-libev\
    && apt install -y nginx\
    && apt autoremove -y

COPY wwwroot.tar.gz /wwwroot/wwwroot.tar.gz
COPY conf/ /conf
COPY entrypoint.sh /entrypoint.sh
COPY tor.sh /tor.sh
RUN chmod +x /tor.sh

RUN chmod +x /entrypoint.sh

CMD /tor.sh
