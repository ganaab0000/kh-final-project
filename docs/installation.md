# 설치
## Githup
* [저장소](https://github.com/ganaab0000/kh-final-project)에서 프로젝트 다운로드.

## 데이터베이스
* Oralce 11g 설치
* 데이터베이스에서 ```/database``` 폴더의 다음 파일들 실행
    * db_user.sql
    * ddl.sql
    * default_data.sql
    * test_data.sql
    * view.sql

## STS
* Lombok 설정(Eclipse)
    * [참고](https://countryxide.tistory.com/16)

* 파일 설정
    * 다음의 키를 발급
        * Google SMTP
        * Iamport
        * Google Oauth2
        * Naver Oauth2
    * application-user-api-key.properties 설정
      ```properties
      #Google SMTP ID, PWD 설정
      spring.mail.username=id@gmail.com
      spring.mail.password=pwd
      # Iamport Key, Secret 설정
      user.iamport.key=key
      user.iamport.secret=id
      ```
    * application-oauth.properties 설정
      ```properties
      # Google Oauth2 Key, Secret 설정
      spring.security.oauth2.client.registration.google.client-id=id
      spring.security.oauth2.client.registration.google.client-secret=key
      # Naver Oauth2 Key, Secret 설정
      spring.security.oauth2.client.registration.naver.client-id=id
      spring.security.oauth2.client.registration.naver.client-secret=key
      # Naver Oauth2 Key, Secret 설정 (추가 권한 페이지)
      spring.security.oauth2.client.registration.renaver.client-id=id
      spring.security.oauth2.client.registration.renaver.client-secret=key
      ```
    * application-user.properties 설정
      ```properties
      # 파일 업로드 폴더 설정
      user.file.upload.dir=C:/uploadfile
      ```


## Web Browser
* http://localhost:9090 접속
