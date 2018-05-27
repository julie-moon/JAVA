<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
	<div id="header">
		<div class="aux">
		<h1>
		<a href="main.pb"><img src="profile/${loginUser.profile}" class="profile"/> <span>${loginUser.nickname}님의 전화번호부</span></a>
		</h1>
		<a href="logout.pb" class="logout_btn">로그아웃</a>
		</div><!-- //.aux-->
	</div><!-- //header -->
	<div id="content">