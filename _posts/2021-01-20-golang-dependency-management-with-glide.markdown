---
layout: posts
title: "Golang Dependency management with Glide"
date: "2021-01-20 09:04:48 +0900"
---

Golang으로 뭔가를 하려고 할 때 기본 gopath `$HOME/go`라는 디렉토리에 라이브러리도 받고 실행파일도 받고 내 소스코드도 넣고 해야되서 굉장히 불편하다.

의존성 설치 할 때도 `go get -u ./...` 하면 되기야 되는데 버전 정의도 안 돼 있고 찜찜하다

그래서 뭐 없나 찾아보다가 보니 역시 발견한 Glide

https://github.com/Masterminds/glide <br/>
https://glide.readthedocs.io/en/latest/getting-started/

## 설치

Shell : `curl https://glide.sh/get | sh`
Mac : `brew install glide`
Ubuntu20 : `sudo add-apt-repository ppa:masterminds/glide && sudo apt-get update -y && sudo apt-get install -y glide`

## 프로젝트 초기화

기존프로젝트에서 명령어 실행
```
glide init
```
이것저것 물어보는데 어차피 설정파일 편집하면 되니까 대충 y 하면 아래처럼 디렉토리 구조가 추가된다.

```
.
├── glide.yaml
└── vendor
```

초기화가 완료되면
```
glide up
```
초기화 할 때 의존성이 꼬여있을 수도 있어서 up으로 하는게 낫다. <br/>
설치 완료되고 vendor 디렉토리가 라이브러리도 가득 찬다

잘 되진 않고 아래같은 에러를 몇 개 만나게 된다
```
Error scanning github.com/go-playground/validator/v10: cannot find package
go get -u gopkg.in/go-playground/validator.v9
```

중지중지...

Glide 버려

go mod를 씁시다.
