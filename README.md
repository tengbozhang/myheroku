# 一键部署 v2ray 到 heroku
V2ray-Core 4.20.0

1.服务端部署后，应 open app ，显示 Bad Request，表示部署成功。

2.客户端应使用websocket+tls传输协议。Vmess协议的 users id 应当换成自己的UUID，"alterId": 64。

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/wangyi2005/v2ray-heroku)

参考 https://github.com/onplus/v2hero/
