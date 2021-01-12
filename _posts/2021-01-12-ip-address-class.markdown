---
layout: post
title: "IP Address (IPv4)"
date: "2021-01-12 00:00:00 +0900"
categories: network
tags:
  - network
  - ip
---

## NetworkID와 HostID
여기서 몇 가지 제약조건이 생긴다



### Class A, B, C, D, E

클래스 A~E까지 앞쪽 1비트씩 0으로 채운다.

A : 0xxx xxxx . xxxx xxxx . xxxx xxxx . xxxx xxxx
B : 00xx xxxx . xxxx xxxx . xxxx xxxx . xxxx xxxx
C : 000x xxxx . xxxx xxxx . xxxx xxxx . xxxx xxxx
D : 0000 xxxx . xxxx xxxx . xxxx xxxx . xxxx xxxx
E : 0000 0xxx . xxxx xxxx . xxxx xxxx . xxxx xxxx

#### Class A

0.0.0.0 ~ 127.255.255.255

네트워크 자체를 표현하는 0.0.0.0 제외
127.0.0.0 그냥 제외

1.0.0.0 ~ 126.0.0.0

#### Class B
#### Class C
#### Class D
#### Class E
