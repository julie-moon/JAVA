<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// getAttribute()의 리턴 값이 Object형이므로
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>멋진 웹서비스</title>
		<link href='css/notosanskr.css' rel='stylesheet'/>
		<style>
			body{
				font-family:'Noto Sans KR', sans-serif;
			}
			#logout{
				padding:5px 15px;
				background-color:#9E9E9E;
				color:#FFF;
				font-family:'Noto Sans KR', sans-serif;
				border:none;
				font-weight:500;
				text-decoration:none;
			}
			#logout:hover{
				background-color:#424242;
				font-weight:900;
			}
			form input{
				padding:5px;
			}
			button{
				padding:5px 15px;
				background-color:#9E9E9E;
				color:#FFF;
				font-family:'Noto Sans KR', sans-serif;
				border:none;
				font-weight:500;
			}
			button:hover{
				background-color:#424242;
				font-weight:900;
			}
			.msg{
				color:red;
			}
		</style>
	</head>
	<body>
		<% if(loginUser != null) { %>
		<%-- 로그인 되었을 때 --%>
		<h1><%=loginUser.getNickname()%>님 환영!</h1>
		<a href="logout.jsp" id="logout">로그아웃</a>
		<% } else { %>
		<%-- 로그아웃 되었을 때 --%>
		<h1>로그인</h1>
		<form action="login.jsp" method="post">
			<fieldset>
				<legend>로그인 폼</legend>
				<p>
					<input name="id" placeholder="아이디" />
				</p>
				<p>
					<input name="password" type="password" placeholder="비밀번호" />
					<% 
						Object msg = session.getAttribute("msg");
						if(msg != null) { %>
						<span class="msg"><%=msg%></span>
					<% 
						// 한 번 작동하고 다시 없앰
						session.removeAttribute("msg");
					} %>
				</p>
				<p>
					<button>로그인</button>
				</p>
			</fieldset>
		</form>
		<% } %>
	</body>
</html>