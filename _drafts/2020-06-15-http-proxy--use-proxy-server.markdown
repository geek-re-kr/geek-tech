---
layout: post
title: "Http Proxy - Use Proxy Server"
date: "2020-06-15 10:35:00 +0900"
---

환경변수에 설정 해 주면 간단하게 적용이 된다

* http_proxy
* https_proxy
* no_proxy

sudo에서 사용할 경우 추가

sudo visudo
```
Defaults  env_keep += "http_proxy"
Defaults  env_keep += "https_proxy"
Defaults  env_keep += "HTTP_PROXY"
Defaults  env_keep += "HTTPS_PROXY"
```
