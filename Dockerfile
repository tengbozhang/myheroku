
FROM alpine:latest

ENV VER=4.20.0
ENV CONFIG_JSON1={\"log\":{\"access\":\"\",\"error\":\"\",\"loglevel\":\"warning\"},\"inbound\":{\"protocol\":\"vmess\",\"port\": 
#ENV PORT=8080
ENV CONFIG_JSON2=,\"settings\":{\"clients\":[{\"id\":\"
#ENV UUID=91cb66ba-a373-43a0-8169-33d4eeaeb857 
ENV CONFIG_JSON3=\",\"alterId\":233}]},\"streamSettings\":{\"network\":\"ws\"}},\"inboundDetour\":[],\"outbound\":{\"protocol\":\"freedom\",\"settings\":{}}} 

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && mkdir -m 777 /v2raybin \ 
 && cd /v2raybin \
 && curl -L -H "Cache-Control: no-cache" -o v2ray.zip https://github.com/v2ray/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
 && unzip v2ray.zip \
 && mv /v2raybin/v2ray-v$VER-linux-64/v2ray /v2raybin/ \
 && mv /v2raybin/v2ray-v$VER-linux-64/v2ctl /v2raybin/ \
 && mv /v2raybin/v2ray-v$VER-linux-64/geoip.dat /v2raybin/ \
 && mv /v2raybin/v2ray-v$VER-linux-64/geosite.dat /v2raybin/ \
 && chmod +x /v2raybin/v2ray \
 && rm -rf v2ray.zip \
 && rm -rf v2ray-v$VER-linux-64 
 
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh 

CMD /entrypoint.sh
