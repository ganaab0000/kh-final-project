
<div align="center">

<img src="/docs/img/android-chrome-192x192.png" alt="logo" width="100" />

##### 아티스트와 후원자를 연결해주는 플랫폼

</div>

# TUMBLEUP 
'크라우드 펀딩'을 주제로 기획 / 제작된 프로젝트입니다. KH정보교육원 - 스마트 콘텐츠융합 응용SW 엔지니어 양성과정 'TUMBLEUP(텀블업)'의 파이널 프로젝트로 기획되었으며
[공주희](https://github.com/jamjam306)
, [노정권](https://github.com/kwon6837)
, [박효길](https://github.com/hg19910)
, [송하준](https://github.com/ganaab0000)
, [안승철](https://github.com/graeen3)
, [함든솔](https://github.com/non093) 총 6명이 참가하였습니다.

## 목차
1. [개발환경](#개발환경)
2. [ERD](#ERD)
3. [유스케이스](#유스케이스)
4. [프로젝트 화면](#프로젝트-화면)
    1. [일반 회원](#일반-회원)
    2. [관리자](#관리자)
5. [설치](docs/installation.md)
6. [발표영상](https://youtu.be/qQJLGfPixyU)


## 개발환경
* OS
    * Window 10
* DevTools
    * Spring Tool Suite 3, Sqldeveloper
* DBMS
    * Oracle 11g
* Server
    * Pivotal tc Server Developer Edtion v4.0
* Language
    * JAVA
* Framework
    * Spring Boot
* Frontend 
    * HTML5, CSS3, Javascript, Jquery, Bootstrap5, Chart.js(차트), Snackbar.js(알림창), Summernote.js, CKEditor
* Backend
    * Maven, Mybatis, JSTL, Spring Security, Iamport(결제모듈), Google SMTP(메일 인증), Oauth2(Google, Naver), Lombok
## ERD
* [DB Diagram IO에서 보기](https://dbdiagram.io/d/605840deecb54e10c33c9058)

![tumbleup_erd](/docs/img/tumbleup_erd.png)
## 유스케이스

 ![tumbleup_erd](/docs/img/usecase_2.jpg) | ![tumbleup_erd](/docs/img/usecase_1.jpg)
:-------------------------:|:-------------------------:



## 프로젝트 화면
### 일반 회원

#### 메인화면 (박효길)
<img src="/docs/img/hyogil/main.png"> |
:-:|
* 좋아요(프로젝트 목록, 상세 공통)

#### 프로젝트 목록 (박효길)
<img src="/docs/img/hyogil/list.png"> | <img src="/docs/img/hyogil/like.png">
:-:|:-:
* 필터링, 정렬, 검색 기능

#### 프로젝트 상세 (박효길)
##### 프로젝트 상세 화면
<img src="/docs/img/hyogil/detail_story.png"> |
:-:|

##### 커뮤니티
<img src="/docs/img/hyogil/community_list.png"> | <img src="/docs/img/hyogil/community_detail.png">
:-:|:-:
* 게시글, 댓글 기능

#### 프로젝트 등록
#### 프로젝트 예약

### 고객센터(안승철)
#### 공지사항
<img src="/docs/img/cs/NOTICE.PNG" width="800px">
* 쓰기/읽기/수정/삭제/검색 기능

#### 이용약관
<img src="/docs/img/cs/TOS.PNG" width="800px">

#### FAQ
<img src="/docs/img/cs/FAQ.PNG" width="800px">
* 쓰기/읽기/수정/삭제/검색 기능

#### Q&A
<img src="/docs/img/cs/Q&A_SEND.PNG" width="400px"> | <img src="/docs/img/cs/Q&A_LIST.PNG" width="450px">
:-:|:-:
* 쓰기/읽기/삭제 기능

#### 회원 기능 (송하준)
##### 로그인
 <img src="/docs/img/hajun/image4.png"  width="900px"> | <img src="/docs/img/hajun/image2.png"><img src="/docs/img/hajun/image6.png"> | <img src="/docs/img/hajun/image10.png"><img src="/docs/img/hajun/image11.png">
:-:|:-:|:-:
* 자동 로그인 (Remember-Me)
* 소셜 로그인 (Google, Naver)
* Spring Security 기반 구현

##### 회원가입
 <img src="/docs/img/hajun/image5.png"> | <img src="/docs/img/hajun/image12.png"> | <img src="/docs/img/hajun/image1.png">
:-:|:-:|:-:

* 비밀번호 - Bcrypt 암호화
* SMTP
##### 비밀번호 찾기
<img src="/docs/img/hajun/image7.png"> | <img src="/docs/img/hajun/image13.png">  | <img src="/docs/img/hajun/image3.png"> 
:-:|:-:|:-:

* SMTP
##### 회원정보 변경, 비밀번호 변경, 회원탈퇴
<img src="/docs/img/hajun/image8.png"> | <img src="/docs/img/hajun/image15.png"> | <img src="/docs/img/hajun/image16.png">  | <img src="/docs/img/hajun/image17.png">  | <img src="/docs/img/hajun/image18.png"> 
:-:|:-:|:-:|:-:|:-:

#### 알림 (송하준)
<img src="/docs/img/hajun/image19.png">

### 관리자
#### 대시보드 (송하준)
<img src="/docs/img/hajun/image21.png">

* 통계 기능(Chart.js)
#### 계정 관리 (송하준)

<img src="/docs/img/hajun/image22.png"> | <img src="/docs/img/hajun/image23.png"> | <img src="/docs/img/hajun/image24.png">  | <img src="/docs/img/hajun/image25.png">  | <img src="/docs/img/hajun/image26.png"> 
:-:|:-:|:-:|:-:|:-:

* Spring Security 기반 Role 관리
#### 프로젝트 관리
#### 예약 관리
#### 고객 관리
