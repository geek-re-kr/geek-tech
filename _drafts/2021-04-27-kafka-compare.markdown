---
layout: post
title: "Kafka"
date: "2021-04-27 23:43:30 +0900"
---

## 정의

- Messaging Queue
- Message Broker
- 분산 스트리밍 플랫폼
- Enterprise Messaging System
- point to point 메시징 시스템

## 기능

- record stream을 publish-subcribe
- fault-tolerant 지원

## 특징

- publish 된 데이터를 디스크에 순차적으로 기록해서 유실 방지
- 메시지를 일정기간 또는 일정용량 보관가능
- offset을 기준으로 저장된 데이터 조회 가능
- 순차적인 기록으로 검색은 불가
- akc 확인하는경우 디스크 기록 후 알림을 받을 수 있음 유실방지
- 순차적인 읽기쓰기로 디스크와 ssd 차이가 크지 않음

## 함께 사용

- Spark
- Storm
- Flink
- KafkaStreams
- Confluent

## 사용계획

- Kafka로 설치
- 용량계획 capacity plan

## 애플리케이션 통합Integration시 주의

- 느슨한 연계 loose coupling
- 공용 인터페이스 common interface 정의
- 응답(지연)속도 latency
- 신뢰성reliability

### 느슨한 연계loose couping
<-> 밀착결합tight couping

MSA를 하려면 다른 컴포넌트에 영향을 끼치지 않아야 한다

### 공용 인터페이스 common interface

독립적인 컴포넌트 사이의 데이터 교환 규격

### 응답속도 latency

비동기 통신의 경우 느린 응답속도에 메시지 손실 가능

### 신뢰성 reliability

일시적인 가용성 문제 발생시 의존 서비스에 영향을 끼치지 않는 설계
(주로 Hystrix)

## 다른 메시징 시스템

- Message Queue
- Message, Data Packet
- Sender, Producer
- Receiver, Consumer
- 데이터 전송 프로토콜Data Send Protocol
- 전송모드

### Message Queue

송신 - 수신 사이의 연결고리
송신 - (Message Queue) - 수신

### Message, Data Packet

네트워크를 통해 메시지큐로 보내는 단위 데이터 패킷

송신 프로그램은 데이터를 적절한 단위로 쪼개고 프로토콜과 헤더를 기반으로 데이터를 포장wrapping -> 메시지 큐에 전달 -> 수신 프로그램은 메시지를 받아서 unwrapping해서 데이터를 추출

### Sender, Producer

메시지 큐의 endpoint에 연결을 생성해서 인터페이스에 맞게 메시지를 전달

### Receiver, Consumer

데이터를 수신

### 데이터 전송 프로토콜

서로 다른 큐잉 시스템queueing system은 각각 다른 전송 프로토콜을 사용

카프카는 TCP기반의 이진 프로토콜

Producer Client는 ACK(acknowledgement message)를 확인하여 메시지를 기록

기타 프로토콜
- AMQP Advanced Messager Queueing Protocol
- STOMP Streaming Text Oriented Message Protocol
- MQTT Message Queue Telemetry Transport
- HTTP Hypertext Transfer Protocol

### 전송모드

동기, 비동기, 배치

카프카는 비동기

## 다른 메시징 시스템

### 지점간 메시징 시스템 PTP point to point

- 메시지가 오직 하나의 컨슈머에 의해서만 사용된다는 점
- FIFO가 지켜진다
- offset을 유지한다

fire-and-forget 모델 :
프로듀서가 큐에 메시지를 보내고 ACK를 대기하지 않고 잊는다

요청/응답 request/reply 모델 :
메시지를 보내고 나면 blocking wait를 건다

### 게시-구독 publish-subcribe 메시징 시스템

subcriber가 특정 토픽이나 이벤트에 대해서 어떤 구독 의사를 등록하고 해당 이벤트에 대한 일련의 통지를 비동기 방식으로 받는 것

모든 리시버가 같은 데이터를 받을 수 있다 = 모든 리시버에 broadcast 된다

### AMQP
