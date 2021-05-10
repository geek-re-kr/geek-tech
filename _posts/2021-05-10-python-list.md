---
layout: post
title: Python list로 할 수 있는 것들
date:   2021-05-10 09:00:00 +0900
categories: python
pagination: 
  enabled: true
  category: python
  permalink: /:num/
tags:
  - python
  - list
  - basic
---

## 샘플 데이터

SAMPEL DATA
```python
animals = ['Cat', 'Dog', 'Elephant', 'Giraffe', 'Turtle', 'Tiger', 'Bull', 'Bear']
numbers = [1, 2, 3, 4, 5, 6, 7, 3, 4, 6, 5, 6]
```

## list

### JOIN - list를 한 문자열로 합치기

#### 문자열만 있는 경우

```python
joinstr = ','.join(animals)
print(joinstr)
```

쉼표 구분자로 합쳐진 문자열
`Cat,Dog,Elephant,Giraffe,Turtle,Tiger,Bull,Bear`

#### 문자열과 다른 데이터타입이 섞여있는 경우

```python
joinstr = ','.join(animals + numbers)
print(joinstr)
```

그냥 하면 오류 발생
`TypeError: sequence item 8: expected str instance, int found`

먼저 문자열로 변경해 준 후에 join
```python
strings = [f'{elm}' for elm in animals + numbers]
joinstr = ','.join(strings)
print(joinstr)
```

### for-if 조건추출 - 3보다 큰 숫자만 추출

```pythonn
ext_numbers = [num for num in numbers if num > 3]
print(ext_numbers)
```

정상출력
`[4, 5, 6, 7, 4, 6, 5, 6]`



