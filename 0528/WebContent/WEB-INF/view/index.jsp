<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>전화번호부</title>
		<link rel="stylesheet" href="css/reset.css" />
		<link rel="stylesheet" href="css/notosanskr.css" />
		<link rel="stylesheet" href="css/font-awesome.min.css" />
		<link rel="icon" href="img/favicon.png">
		<style>
			body {
				font-family:'Noto Sans KR',sans-serif;
			}
			#intro {
				width: 100%;
				height: 100%;
				position: fixed;
				left: 0;
				top: 0;
				transition: .5s cubic-bezier(1,.01,.8,1.16) .3s;
			}
			#loginBox {
				width: 1200px;
				height: 420px;
				position: absolute;
				left: 50%;
				top: 50%;
				margin: -200px 0 0 -600px;
				z-index: 1;
				text-align: center;
			}
			#loginBox>h1 {
				font-weight:900;
				font-size:50px;
				color:#fff;
				margin-bottom:20px;
			}

			#loginBox input, #loginBtn {
				width: 450px;
				height: 50px;
				padding: 5px 10px;
				border: 1px solid #fff;
				font: 300 20px/50px "Noto Sans KR", sans-serif;
				margin: 4px auto;
				background: rgba(255,255,255,.1);
				color: #fff;
				transition: .2s ease;
				position: relative;
				display: block;
			}
			#loginBox input:focus {
				background: rgba(255,255,255,.9);
				color: #333;
			}
			#loginBtn {
				cursor: pointer;
				display: inline-block;
				box-sizing: content-box;
			}
			
			#loginBtn:hover {
				background: rgba(200,200, 200,.9);
				color:#424242;
			}
			
			#joinLink {
				width: 450px;
				height: 50px;
				padding: 5px 10px;
				font: 300 20px/50px "Noto Sans KR", sans-serif;
				margin: 4px auto;
				background: rgba(255,255,255,.1);
				color: #fff;
				transition: .2s ease;
				position: relative;
				display: block;
                text-decoration: none;
			}
			#joinLink:hover {
				background: rgba(255,255,255,.9);
				color: #333;
			}

			#videoContainer {
				width: 100%;
				height: 100%;
				position: absolute;
				left: 0;
				top: 0;
				overflow: hidden;
			}
			#videoContainer::after {
				content: "";
				width: 100%;
				height: 100%;
				display: block;
				position: absolute;
				left: 0;
				top: 0;
				background: rgba(0,0,0,.5);
			}
			#videoContainer > video {
				min-width: 100%;
				min-height: 100%;
			}

			/* 메세지 출력*/
			#msgBox {
				margin:10px;
				position: relative;
				text-align: center;
				color:#fff;
				font-size:21px;
				font-weight: 900;
				display: none;
			}

		</style>
	</head>
	<body>
		<div id="intro">
			<div id="loginBox">
				<h1><i class="fa fa-address-book-o"></i> 멋진 전화번호부</h1>
				<form method="post" action="login.pb">
					<fieldset>
						<legend class="screen_out">로그인폼</legend>
						<label for="id" class="screen_out">아이디</label>
						<input type="text" autofocus name="id"
						 id="id" placeholder="아이디" title="아이디를 입력해주세요."/>
						<label for="pwd" class="screen_out">비밀번호</label>
						<input type="password" name="password"
						 id="pwd" placeholder="비밀번호" title="비밀번호를 입력해주세요."/>
						<!-- 메세지 출력 박스 -->
						 <div id="msgBox"></div>
						 <button id="loginBtn" title="로그인버튼">로그인</button>
					</fieldset>
				</form>
				<a id="joinLink" href="">회원가입</a>
			</div>
			<div id="videoContainer">
				<video autoplay loop id="video">
					<source src="video/loop.mp4"></source>
				</video>
			</div>
		</div>
	</body>
</html>
 
			
			