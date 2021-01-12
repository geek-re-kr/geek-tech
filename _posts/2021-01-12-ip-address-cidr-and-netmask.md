---
layout: posts
title: "IPv4 주소 표기방법 - CIDR, Subnet mask"
date: "2021-01-12 12:00:00 +0900"
categories: network
tags:
  - network
  - ip
  - cidr
  - subnetmask
---

# CIDR, Netmask 표현법

그냥 IP만으로 표현하지 못하는 범위까지 나타내는 표현식

8.8.8.8/32
8.8.8.8(255.255.255.255)

## CIDR
* Subnet mask
  0.0.0.0 (255.255.255.255)
* CIDR
  0.0.0.0/0

두 표기법 모두

8bit.8bit.8bit.8bit



IPv4는 4블럭의 숫자로 표현되는데

0.0.0.0/0 

## Netmask

## 범위 지정

192.168.1.21/32 2^32
192.168.1.0/24 2^24
192.168.1.0/20 2^20
192.168.0.0/16 2^16
192.0.0.0/8 2^8

앞에서부터 몇 자리까지 표현식으로 사용할것인가를 표시

## CIDR 계산기

- https://www.ipaddressguide.com/cidr
