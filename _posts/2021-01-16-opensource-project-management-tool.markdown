---
layout: posts
title: "쓸만한 프로젝트 관리 도구"
date: "2021-01-16 00:27:59 +0900"
---

https://en.wikipedia.org/wiki/Comparison_of_project_management_software

SourceServer
* gitlab : https://github.com/gitlabhq
* gitea : https://github.com/go-gitea
* gogs : https://github.com/gogs/gogs

IssueTracker
* redmine : https://www.redmine.org/, https://github.com/redmine/redmine
* Mantis
* Bugzilla
* Trac

* open project : https://www.openproject.org
* phabricator : https://phacility.com/phabricator
* MyCollab : https://mycollab.com
* Collabtive : https://collabtive.o-dyn.de/, https://github.com/philippK-de/Collabtive
* odoo : https://www.odoo.com
* Tuleap : https://www.tuleap.org, https://github.com/Enalean/tuleap
* Backlog
* Zoho
* dotProject : https://dotproject.net/
* ProjectLibre : https://www.projectlibre.com/
* OrangeScrum : https://www.orangescrum.org/
* Leantime : https://leantime.io/
* ProjeQtOr : https://www.projeqtor.org/en/
* ZenTao : https://www.zentao.pm/
* TaskJuggler : https://taskjuggler.org/
* web2Project : https://web2project.net/
* Youtrack
* DoneDone
* Webissues : https://webissues.mimec.org/
* GitBug : https://github.com/MichaelMure/git-bug

KanbanBoard
* Taiga : https://taiga.io, https://github.com/taigaio
* Restyaboard
* Wekan
* Kanboard : https://kanboard.org/, https://github.com/kanboard/kanboard
* TaskBoard

## 쓸만한 툴

### Gitlab

원래 소스코드 관리툴이이었는데

지금은 온갖거 다 된다. 빠른 속도로 발전 중

현재 1짱

약간의 단점이라면
* gitlab은 모든게 프로젝트는 소스셋 단위라서 업무 단위로 프로젝트관리를 하려면 힘들다
  그룹단위라던가 프로젝트를 묶어주는 단위가 있으면 좋겠는데
  위키도 소스코드 단위라서 잘 안쓰게 된다
* 도커 레지스트리는 별도로 설치해야한다

추가되면 좋을점
* 깃허브 소스 미러링할 때 조직전체 미러링
* 프로젝트 단위를 소스셋단위가 아닌 업무 단위로 관리가 되면 좋겠다

### Gitea

go로 만들어진 git 소스관리툴

gitlab에서 원했던 기능 - 조직단위 미러링이 된다

다른건 다 gitlab의 하위호환수준

go언어로 만들어서 그런가 초기 실행속도가 매우 빠르다

### phabricator

맘에 쏙 들지는 않는데 그냥 돌아는 간다

뭘 생성하면 지울수가 없어서

### leantime

개발용이라기보다는 다른용도로 봐야할 것 같다

## 새로 설치하지 말아야 할 툴

### Redmine

오래된 툴이다

업데이트도 잘 안되고 약간 죽은 프로젝트 느낌인데 뭔가 코드는 수정이 되고 있다

플러그인 개발도 중지된게 많고 UI개선은 전혀 안되고 있다.

쓸만한 유료 플러그인이 좀 있는데 가성비가 매우 조진다

프로젝트를 접던어서 다른 프로젝트로 화력이 가게 해 주던가

리뉴얼을 하던가 해 줬으면 좋겠다

## Trac

여기도 뭔가 하고 있는 것 같기는 한데...

애매한 상태

### openproject

칸반이 유료 기능이면 어떻게해... 지라 클라우드 무료버전을 쓰고말지
