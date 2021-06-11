---
layout: posts
title: 메시징 시스템 
date: 2021-06-10 16:00:00 +0900
categories: data/message
pagination: 
  enabled: true
  category: python
  permalink: /:num/
tags:
  - python
  - list
  - basic
---

## 목차

- 기술설명
  - 간략 설명
  - 기술 특성
  - 왜 쓰는가
  - 하위 기술
- 관련 솔루션
  - 유료
  - 무료
  - defacto

## 메시징 시스템은 뭔가

메시지를 저장 전달하는 서비스

## 메시징 시스템 사용 이유

처리할게 많아지면서 간단한 싱글 어플리케이션에서 멀티스레드, 멀티프로세스, 멀티서버 프로그램이 생겨나기 시작한다
어플리케이션 로직이 복잡해지면서 MSA도 사용되기 시작하고
복잡한 메시지를 한개 어플리케이션에서 관리하긴 힘들어졌고
별도의 서비스에서 메시지만 관리해주는 서비스가 필요하게 되었고
그런 솔루션들이 출시되었다

## 메시징 솔루션 종류

- Kafka
- RabbitMQ
- Pulsar
- Redis
- ZeroMQ

언어/OS에서 지원
- JMS
- Pipe
- Queue

프레임워크에서 메시지를 관리
- Elixir
- Akka

## 메시징 시스템의 기본원칙

- 느슨한 연계loose coupling 
- 공용 인터페이스 정의common interface
- 응답속도latency
- 신뢰성reliability

### 느슨한 연계
애플리케이션 상호간 의존성 최소화
한쪽에서 오류가 나더라도 다른쪽은 지속적으로 동작 가능하도록
단, 비핵심 기능인 경우에만 가능

불가능사례) 주문시스템에서 장바구니가 동작하지 않는 경우
장바구니가 동작하지 않습니다. 주문이 불가능합니다. 정도 오류만 나올 수 있음
가능사례1) 로깅시스템에 동작하지 않는 경우
가능사례2) 포인트 결제서버가 동작하지 않는 경우. 포인트 없이 카드결제만 허용

### 공용 인터페이스
데이터 스키마, 전달 프로토콜
http,socket tcp/udp,pipe(os),grpc on http,amqp
text,xml,json,avro,protobuf,thrift

### 응답속도
원격서버의 응답이 너무 느릴경우 실패처리 할 필요가 있음
네트워크 및 프로세스 속도에 따라 적절하게 설정

### 신뢰성
일시적인 가용성 문제가 발생해도 곧 해결될 것
(여기서 신뢰성의 뜻은 HA 와 비슷할지도?)

## 메시징 시스템이 아닌 정보의 공유
- 원격 프로시저 호출 RPC, remote procedure calls
- 공유 데이터베이스 shared database
- 웹서비스 호출 invocation

## 메시징 개념

- Message Queue
- Message(Data packet)
- Sender/Producer/
- Receiver/Consumer/Listener
- 데이터 전송 프로토콜
- 전송모드

### MessageQueue

채널과 유사

### Message

네트워크를 통해 전달되는 기본단위, 패킷

송신 프로그램에서 프로토콜과 헤더를 기반으로 Wrapping되어 메시지 큐에 전달

### Sender

메시지를 생성해서 전달하는 프로그램

### Receiver

~~

### 데이터 전송 프로토콜

- AMQP Advanced Message Queueing Protocol
- STOMP Streaming Text Oriented MEssage Protocol
- MQTT Message Queue Telemetry Transport
- HTTP Hypertext Transfer Protocol

### 전송모드

- 동기
- 비동기
- 배치

## 메시짐 시스템 종류

- PTP point-to-point
- Publish-Subscribe
- AMQP

### 지점간 메시징 시스템 PTP point-to-point

PTP 메시징 모델을 지원하는 큐는 FIFO queue

사용한 메시지를 삭제하는 대신에 메시지의 offset으로 현재 위치를 기억
이전 offset을 사용하면 replay 가능
여러개 Receiver을 연결할 경우 각 Receiver마다 offset을 별도로 관리하는 것도 가능.
반대로 offset을 공유하는 것도 가능 kafka에서는 동일한 consumer group

Fire-and-forget message 전송 후 ACK를 대기하지 않음. 메시지 유실허용
request/reply message 전송 후 blocking wait으로 ACK를 대기. 메시지 전달 후 Receiver에서 응답까지 확인. RPC과 유사??한건가?
https://docs.microsoft.com/en-us/azure/architecture/patterns/async-request-reply

Receiver가 Queue에서 메시지를 꺼내온다. loop

### Publish-Subscribe

구독자subscriber는 특정 토픽이나 이벤트에 대해서 구독의사interest를 등록하고 Message가 등록될 때 마다 비동기적으로 이벤트를 통보받는다
게시자publisher는 이벤트가 생성될 때 마다 토픽에 메시지를 전달

메시지는 Subscriber/Receiver로 Broadcast된다. PTP모델에서는 리시버가 큐에서 새로운 메시지를 꺼내온다.
메시지 브로커에서 Subscriber의 socket으로 push

drawio1

### AMQP

Exchange가 특징이다.pub-sub모델은 토픽을 중심으로 메시지가 분기되지만
AMQP는 토픽도 있지만 다양한 라우팅 규칙에 따라 전달된다.
Exchange에서 등록된 Queue로 전달한다
Queue에 달린 컨슈머는 같은 내용을 받아간다

#### AMQP 요소

- Publisher/Producer
- Consumer
- Broker/Server

#### 라우팅(교환) 방식

- Direct: 라우팅 키와 동일한 키로 전달
- fan-out: 모든 큐에 대해 메시지 경로 설정
- Topic Exchange: 메시지 멀티캐스트 라우팅에 사용
