---
title: Linux防火墙开放端口号
date: "2017-04-08 06:24:38.544+01"
---
Linux防火墙开放端口号

```shell
iptables -I INPUT -p tcp -m tcp --dport 5432 -j ACCEPT
```