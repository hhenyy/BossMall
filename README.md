# 남성 의류 쇼핑몰 (BossMall)

## 소개
쇼핑몰 기본기능(상품관리, 회원관리, 리뷰, 문의, 관리자페이지, 결제)와 더불어 유저들이 더 오래 쇼핑몰에 머물수 있도록 챗봇 기능과 유저 커뮤니티 게시판을 제작.<br/>

## 활용기술 
 JAVA, Oracle, Spring Framework, HTML, CSS, JavaScript, maven, MyBatis, <br/>

 Tomcat, GitHub, AWS, JQuery, Ajax, REST API, OpenAI API, vector DB 

## 역할 
 UI 설계, 요구사항 분석, 흐름도 작성, ppt자료 제작
 메인 페이지&유저 커뮤니티 게시판 제작<br/>

-AWS ec2에 프로젝트 배포, DB 구축 경험<br/>
-Googling, Git, Stackoverflow, chatGPT를 이용하여 검색 및 활용하여 구현<br/>
<br/>

## 기능
##  1) 메인 페이지<br/>
<img width="934" alt="스크린샷 2023-12-29 094617" src="https://github.com/hhenyy/BossMall/assets/141230104/4a38e7d9-1cc7-444c-848c-af96e2e19c34">
<img width="942" alt="스크린샷 2023-12-29 094635" src="https://github.com/hhenyy/BossMall/assets/141230104/346a1aac-94d6-4151-b9e1-17bbd25bc085">

: 메인 이미지 슬라이드 bootstrap/ 팝업창<br/>
: header/menu/footer 분리 & 회원/비회원/관리자 아이디 별 노출 아이콘 링크 분리<br/>
: 관리자 아이디 로그인 시 상품 변경 버튼 메인 이미지 노출/ 변경 페이지 이동<br/>
: 챗봇(js popup chatbot/vector DB/openAI API) <br/>
  저장된 상품 정보를 embedding하여 vector DB에 저장해두고 유저가 질문한 내용을 embedding하여 vector DB에 query를 하면 두 개의 embedding으로 유사도를 구하게 되고 이때 코사인유사도 값이 정해 놓은 수치 이상이면 해당 상품추천과 상품 상세 페이지로 링크설정  <br/>
<br/>
##  2) 유저 커뮤니티 게시판<br/>
<img width="947" alt="스크린샷 2023-12-29 094654" src="https://github.com/hhenyy/BossMall/assets/141230104/0488c51d-c146-4d62-9283-9507c3a2cc20">
<img width="936" alt="스크린샷 2023-12-29 094705" src="https://github.com/hhenyy/BossMall/assets/141230104/207b2f75-0af8-4e5d-a04e-cc7c858d09c8">

: 제목, 내용 검색기능 / 목록 페이징<br/>
: 댓글 기능 : 댓글 목록/수정/삭제 Ajax이용 비동기 출력<br/>
: 첨부 파일 기능<br/>
: 글 신고 (클릭시 신고 게시판으로 이동) <br/>
: 좋아요 기능 (Ajax, Json) : 클릭시 하트 이미지 변경 & 개수 카운팅 update<br/>
: 유투브 data API ('남성 패션' 검색키워드 조회수 top9 data추출)(REST API) <br/>
