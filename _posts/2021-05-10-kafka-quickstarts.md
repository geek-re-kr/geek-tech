---
layout: posts
title: Kafka - Quickstarts
date: 2021-05-10 09:00:00 +0900
categories: middleware
pagination: 
  enabled: true
  category: middleware
  permalink: /:num/
tags:
  - kafka
  - quickstarts
  - basic
---

## 설치

### 실행


주키퍼 `zookeeper-server-start.sh config/zookeeper.properties`
카프카 `kafka-server-start.sh config/server.properties`

https://kafka.apache.org/quickstart

## 사용법

도커 컨테이너에서 구동한 경우

### topic 목록조회

```
kafka-topics.sh --list --zookeeper localhost:2181
```

### topic 생성

간편생성 - 개발용
```
kafka-topics.sh --create --topic quickstart-events --bootstrap-server localhost:9092
```

풀옵션 - 운영용
```
kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092
Topic:quickstart-events  PartitionCount:1    ReplicationFactor:1 Configs:
    Topic: quickstart-events Partition: 0    Leader: 0   Replicas: 0 Isr: 0
```

### message 보내기

```
kafka-console-producer.sh --topic quickstart-events --bootstrap-server localhost:9092
event1 <enter>
event2 <enter>
```

### message 받기

```
kafka-console-consumer.sh --topic quickstart-events --from-beginning --bootstrap-server localhost:9092
```

### topic 삭제

파티션 확장이 동적으로 이뤄지지 않아서 삭제 후 재생성 해야한다
```
kafka-topics --delete --zookeeper localhost:2021 --topic quickstart-events
```

바로삭제되지 않고 삭제 대기상태가 되는데 클러스터를 재시작하거나 수동으로 삭제처리 해야하는 경우가 있다

#### 오류 또는 삭제대기중

##### force

--force를 붙여서 완전 삭제 가능

```
kafka-topics --delete --zookeeper localhost:2021 --topic quickstart-events --force
```

##### already marked for deletion 오류

server.properties 에 설정 추가되지 않아서 발생
아래 설정을 추가
```
delete.topic.enable = true
```

파티션이 여러개일 때 전부 삭제가 안되고 남는것처럼 오류가 발생한다고 한다
기존 파티션 지워지지도 않고 사용도 못하는 먹통이 됨

이미 발생한 오류의 경우 zookeeper shell에 접속해서 직접 삭제

```
zookeeper-shell.sh localhost:2181
ls /brokers/topics
[topic1, topic2, ....., quickstart-events]
rmr /brokers/topics/quickstart-events
ls /brokers/topics
[topic1, topic2, .....]
```
