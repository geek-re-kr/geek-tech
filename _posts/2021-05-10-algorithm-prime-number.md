---
layout: post
title: Algorithm - 소수 추출
date:   2021-05-10 09:00:00 +0900
categories: algorithm
pagination: 
  enabled: true
  category: python
  permalink: /:num/
tags:
  - python
  - list
  - basic
  - snippet
---

## 그냥 한개씩 확인

특정 숫자가 입력되는 경우 그 숫자가 소수인지 나눠보고 판별하는 방법

```python
def is_prime(x: int) -> bool:
    if x < 2:
        return False
    for i in range(2, x):
        if x % i == 0:
            return False
    return True
```


## 에라토스테네스의 체

일정 범위의 숫자 전체에서 소수가 아닌 숫자를 제거하는 방법
https://ko.wikipedia.org/wiki/%EC%97%90%EB%9D%BC%ED%86%A0%EC%8A%A4%ED%85%8C%EB%84%A4%EC%8A%A4%EC%9D%98_%EC%B2%B4

```python
def eratosthenes_sieve(limit: int) -> []:
    prime_arr = [True] * (limit + 1)

    prime_arr[0] = False
    prime_arr[1] = False

    for i in range(2, limit + 1):
        if not prime_arr[i]:
            continue
        for j in range(i * 2, limit + 1, i):
            prime_arr[j] = False

    return [idx for idx, elm in enumerate(prime_arr) if elm]
```

위키코드 - 조회가 조금 줄어듦
```python
def prime_list(n):
    # 에라토스테네스의 체 초기화: n개 요소에 True 설정(소수로 간주)
    sieve = [True] * n

    # n의 최대 약수가 sqrt(n) 이하이므로 i=sqrt(n)까지 검사
    m = int(n ** 0.5)
    for i in range(2, m + 1):
        if sieve[i] == True:           # i가 소수인 경우
            for j in range(i+i, n, i): # i이후 i의 배수들을 False 판정
                sieve[j] = False

    # 소수 목록 산출
    return [i for i in range(2, n) if sieve[i] == True]
```
