<%@page import="com.jbm.model1.dao.BoardDAO"%>
<%@page import="com.jbm.model1.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	Board content = BoardDAO.selectContent(no);
%>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글쓰기</title>
		<%@ include file="/WEB-INF/template/link.jsp"%>
		<link rel="stylesheet" href="css/form.css" />
	</head>
	<body>
		<%@ include file="/WEB-INF/template/header.jsp"%>
		<h2>게시글쓰기</h2>
		<div id='formBox'>
			<!--서버로 데이터를 보내는 폼 -->
			<form action="update.jsp" method="post">
			<input type="hidden" name="no" value="<%=no%>" />
				<fieldset>
					<legend class="screen_out">글쓰기폼</legend>
					<p>
						<label for="title">제 목</label> 
						<input type="text" id="title" name="title" value="<%=content.getTitle()%>" />
					</p>
					<p>
						<label for="contents">내 용</label>
						<textarea cols="60" rows="5" name="contents" id="contents"><%=content.getContents()%></textarea>
					</p>
					<p class="btn_box">
						<button class="btn" type="submit">글 수정</button>
						<button class="btn" type="reset">리셋</button>
						<a class="btn" href="contents.jsp?no=<%=no%>">글 수정 취소</a>
					</p>
				</fieldset>
			</form>
		</div> <!-- // #formBox -->
		<%@ include file="/WEB-INF/template/footer.jsp"%>
	</body>
</html>