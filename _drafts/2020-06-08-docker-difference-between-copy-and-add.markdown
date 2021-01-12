---
layout: post
title: "Docker: difference between COPY and ADD"
date: "2020-06-08 15:06:31 +0900"
categories: devops
tags:
  - devops
  - docker
---

## 도커 이미지

도커 이미지에 파일을 넣는 방법은 COPY와 ADD가 있다.

### COPY
```
IMAGE ubuntu:latest
COPY . /app
COMMAND ["java", "-jar", "/app/server.jar"]
```

### ADD
```
IMAGE ubuntu:latest
ADD . /app
COMMAND ["java", "-jar", "/app/server.jar"]
```
url이나 압축파일을 바로 사용가능

## 
