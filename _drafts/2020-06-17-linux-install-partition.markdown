---
layout: post
title: "linux install partition"
date: "2020-06-17 14:22:55 +0900"
categories: linux
---

초기 설치시 파티션을 수동으로 셋팅하는 경우

ex1)
512G SSD(sda), 1T HDD(sdb)

sda
```
256m boot
remains /
```

sdb
```
/home
```

라이브러리 디렉토리나 하나하나 나누는 경우도 있는데 불필요 해 보이고
logs드라이브를 별도로 잡는 경우도 있는데 데스크탑 환경에는 불필요

/usr, /var 디렉토리에 주로 어플리케이션이 설치되긴 하는데.. 딱 정해진대로 되는것도 아니고 해서 애매하다.


300m fat32 /boot/efi boot
