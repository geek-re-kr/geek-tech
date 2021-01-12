---
layout: post
title: "Generate Custom RootCA and SSL Cert with OpenSSL"
date: "2020-06-15 17:00:32 +0900"
---

rootCA

https://www.lesstif.com/system-admin/openssl-root-ca-ssl-6979614.html

RootCA 생성
```
## 키 생성
openssl genrsa -aes256 -out rootCA.key 2048
chmod 600 rootCA.key

## rootCA_openssl.conf 편집

## 인증서 요청 생성
openssl req -new -key rootCA.key -out rootCA.csr -config rootCA_openssl.conf

## 10년짜리 인증서 생성
openssl x509 -req \
-days 3650 \
-extensions v3_ca \
-set_serial 1 \
-in rootCA.csr \
-signkey rootCA.key \
-out rootCA.crt \
-extfile rootCA_openssl.conf
```

SSL 인증서 생성
```
## key pair 생성
openssl genrsa -aes256 -out redis.key 2048

## pass phrase 제거
cp redis.key redis.key.enc
openssl rsa -in redis.key.enc -out redis.key

## SSL 인증서 요청
openssl req -new  -key redis.key -out redis.csr -config host_openssl.conf

## 5년짜리 redis 용 SSL 인증서 발급 (서명시 ROOT CA 개인키로 서명)
openssl x509 -req -days 1825 -extensions v3_user \
-in redis.csr \
-CA rootCA.crt -CAcreateserial \
-CAkey rootCA.key \
-out redis.crt  -extfile host_openssl.conf

## 출력해서 확인
openssl x509 -text -in redis.crt
```



rootCA

https://gist.github.com/fntlnz/cf14feb5a46b2eda428e000157447309
