# 패커스 대시보드 프로토타입

### 기본 환경설정

* 개발 환경에 requirements 파일에 있는 패키지 설치
 
### 서버에서 static 파일 빌드, flask 애플리케이션 재시작하기
- 서버에서 `git pull`을 통해 코드를 받은 후, static 파일 빌드, flask 앱 재시작하기
- `packus/restart_server.sh` 파일을 실행한다.
  - `$source /home/ubuntu/workplace/packus-dashboard/packus/restart_server.sh`

### static 파일 설정 - webpack 등

* `static` 디렉토리 안에서 `npm install` 실행

* webpack을 통한 static 파일 빌드(`package.json` 파일이 있는 static 디렉토리 안에서 명령 실행)
  * `$ npm run build`: 현재 static 파일들을 한번 빌드
  * `$ npm run start`: webpack 서버를 띄우고 static 파일에 변화가 있을 때마다 자동으로 빌드 실행

* 참고: 현재 설정상 새로운 js 파일을 만들 때마다 webpack 설정 새로운 entry를 생성해야 함.

### 로컬에서 테스트 서버 띄우기

* `packus/start_local_http.py` 파일 실행
  * `packus` 디렉토리 안에서 `$ python start_local_http.py` 명령어 실행
  * 기본적으로 `5000`번 포트 사용. `http://localhost:5000`에 접속하면 확인 가능. 

### api 사용 시 참고사항

- 세그먼트 별 데이터 가져오기
  - url: `/api/segments/dashboard-data`
  - 매출액 조건은 아래와 같은 워딩을 따른다.(sales_cond에 정확히 동일하게 넣어줘야 함.)
    - 100만원 이상
    - 50 - 100만원
    - 30 - 50만원
    - 5 - 15만원
    - 5만원 미만
  - ajax 요청 시 request body 예시: 
    ```
    {
        "search_cond_list": [
            {"datefrom": "2019-01-01", "dateto" :"2020-05-01", "upjong3_nm": "일반한식/백반,게장전문", "sales_cond": "30 - 50만원"},
            {"datefrom": "2018-01-01", "dateto" :"2019-05-01", "upjong3_nm": "일반한식/백반", "sales_cond": "5 - 15만원"},
            {"datefrom": "2018-01-01", "dateto" :"2020-05-01", "upjong3_nm": "일반한식/백반", "sales_cond": "30 - 50만원"}
        ]
    }
    ```
  - ajax 요청 시 response data 예시
    ```
    {
      "chart1": [146,305,187],
      "chart2": [
        0.0195,
        0.0407,
        0.0249
      ],
      "chart3": [
        {
          "frequency": {
            "data": [9,10,57,30,27,13],
            "label": ["< 11","< 21","< 3","< 5","< 7","< 9"]
          },
          "monetary": {
            "data": [5,2,3,1,23,36,50,19,7],
            "label": ["< 1065000","< 1235000","< 1405000","< 1575000","< 215000","< 385000","< 555000","< 725000","< 895000"]
          },
          "recency": {
            "data": [19,6,21,13,7,15,11,54],
            "label": ["< 136","< 204","< 272","< 340","< 408","< 476","< 544","< 68"]
          }
        },
        {
          "frequency": {
            "data": [6,5,254,28,8,4],
            "label": ["< 11","< 21","< 3","< 5","< 7","< 9"]
          },
          "monetary": {
            "data": [2,2,1,1,1,1,269,16,9,1,2],
            "label": ["< 1065000","< 1235000","< 1405000","< 1575000","< 1915000","< 2085000","< 215000","<385000","< 555000","< 725000","< 895000"]
          },
          "recency": {
            "data": [12,5,6,5,7,27,50,46,25,30,33,37,20,2],
            "label": ["< 136","< 204","< 272","< 340","< 408","< 476","< 544","< 612","< 68","< 680","< 748","< 816","< 884","< 952"]
          }
        },
        {
          "frequency": {
            "data": [3,3,78,52,41,10],
            "label": ["< 11","< 21","< 3","< 5","< 7","< 9"]
          },
          "monetary": {
            "data": [1,23,67,86,9,1],
            "label": ["< 1235000","< 215000","< 385000","< 555000","< 725000","< 895000"]
          },
          "recency": {
            "data": [18,8,24,16,9,16,14,13,51,9,5,4],
            "label": ["< 136","< 204","< 272","< 340","< 408","< 476","< 544","< 612","< 68","< 680","< 748","< 816"]
          }
        }
      ],
      "table": [
        {
          "frequency": 4,
          "mem_count": 146,
          "monetary": 449915,
          "recency": 188.1
        },
        {
          "frequency": 1,
          "mem_count": 305,
          "monetary": 161080,
          "recency": 534.7
        },
        {
          "frequency": 3,
          "mem_count": 187,
          "monetary": 367195,
          "recency": 277.7
        }
      ]
    }
    ```
    
### SMS 퀵사이트 임베딩

* QuickSight
  - 임베딩 할 대시보드 공유
    - 공유할 사용자 추가 -> quicksightembed@nice.co.kr(VS Code의 해당 html에서 axios 내부 userArn 변수에 붙은 계정)
* VS Code
  - HTML 수정
    - 임베딩 할 대시보드를 가져오기 위해 html 생성 후(소스는 sms.html 혹은 total.html 참고) axios 내부의 dashboardId를 해당 대시보드의 id 로 변경
  - 라우팅
    - index.html에 임베딩 한 대시보드 페이지로 연결되는 탭이나 버튼 추가
    - routes.py에 새로 생성한 HTML 라우팅('menu'라는 변수에 따라 라우팅이 되므로 확인 필요!)
* Git
  - upstream(nicezinidata/packus-dashboard)에 push 후 merge
  - merge가 완료되면, packus 서버에 git pull 후 reuwsgi(재기동 alias) -> https://15.164.120.183/ 에서 확인 가능
