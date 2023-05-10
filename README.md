# KookminStore

#### [23-01 네트워크최신기술] 팀프로젝트 - 스마트 컨트랙트와 이를 활용한 웹 서비스 개발
#### 기간: 23.05.07 ~ 23.05.10
#### 팀원: 권해담, 김혜은, 이찬우

<br/><br/>

프로젝트 소개
------------------------
* 국민대학교의 굿즈를 한정 판매하는 스마트 컨트랙트
* 스마트 컨트랙트를 이더리움 Ganache에 배포
* 이를 사용자에게 서비스하기 위한 웹 페이지 및 웹 서버 구현

<br/>

시작 가이드
-----------------------
### 1. 요구 사항
* nodejs 설치
* web3.js 라이브러리 설치
* Ganache 설치 및 계정 생성

### 2. 설치 방법
```
$ sudo apt-get install nodejs

$ git clone https://github.com/godeka/KookminStore.git
$ sudo npm install web3

$ cp node_modules/web3/dist/web3* .
```

기술 스택
------------------------
<div>
  <img src="https://img.shields.io/badge/ethereum-3C3C3D?style=for-the-badge&logo=ethereum&logoColor=white"> 
  <img src="https://img.shields.io/badge/solidity-363636?style=for-the-badge&logo=solidity&logoColor=white"> 
  <br/>
  <img src="https://img.shields.io/badge/html-E34F26?style=for-the-badge&logo=html5&logoColor=white">
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
  <br/>
  <img src="https://img.shields.io/badge/node.js-339933?style=for-the-badge&logo=Node.js&logoColor=white">
  <img src="https://img.shields.io/badge/Web3.js-F16822?style=for-the-badge&logo=Web3.js&logoColor=white">
</div>


화면 구성
----------------------




주요 기능
----------------------
#### 사용자
1. 원하는 굿즈 선택해 구매 (Buy 버튼 클릭!)
2. 품절됐을 시, alert 창 띄움

#### 컨트랙트 owner
1. 모든 굿즈가 판매되었으면 컨트랙트 종료 (check soldout 버튼 클릭!)
2. 컨트랙트 소멸 (kill 버튼 클릭!)


시연 영상
----------------------
[https://youtu.be/fZzHUkN6jBk]
