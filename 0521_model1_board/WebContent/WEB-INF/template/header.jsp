<%@page import="com.jbm.model1.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	User loginUser = (User)session.getAttribute("loginUser");
%>
<div id="header">
	<div class="aux">
    	<h1 id="logo">
           	<a href="index.jsp"><i class="fa fa-instagram"></i> 멋진 게시판</a>
       	</h1>
       	<div id="logBox">
       		<% if(loginUser == null) { %>
	       	<h2 class="screen_out">로그인</h2>
	       	<%-- 로그인 안된 상태일 때 --%>
	      	<form action="login.jsp" method="post">
		       	<fieldset>
			        <legend class="screen_out">로그인 폼</legend>
			        <label for="id" class="screen_out">아이디</label>
			        <input type="text" id="id" name="id" placeholder="아이디입력" />
			        <label for="pwd" class="screen_out">비밀번호</label>
			        <input type="password" id="pwd" name="password" placeholder="비밀번호입력" />
			        <button class="btn">로그인</button>
			        <a href="joinForm.jsp" class="btn"> 회원가입</a>
				</fieldset>
			</form>
			<% } else { %>
			<%-- 로그인 한 상태일 때 --%>
			<img class="img_profile" title="<%=loginUser.getNickname()%>" alt="<%=loginUser.getNickname()%>"
             src="profile/<%=loginUser.getProfile()%>" width="50"/>
            <a class="btn" href="logout.jsp">로그아웃</a> 
     		<% } %>
		</div><!-- //logBox -->
	</div><!-- //aux -->
</div><!-- //header -->
<div id="content">
    <div class="aux">