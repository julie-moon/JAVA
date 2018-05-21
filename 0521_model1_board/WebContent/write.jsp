<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<form action="insert.jsp" method="post">
				<fieldset>
					<legend class="screen_out">글쓰기폼</legend>
					<p>
						<label for="title">제 목</label> 
						<input type="text" id="title" name="title" />
					</p>
					<p>
						<label for="contents">내 용</label>
						<textarea cols="60" rows="5" name="contents" id="contents"></textarea>
					</p>
					<p class="btn_box">
						<button class="btn" type="submit">글쓰기</button>
						<button class="btn" type="reset">취 소</button>
						<a class="btn" href="index.jsp">게시판으로</a>
					</p>
				</fieldset>
			</form>
		</div> <!-- // #formBox -->
		<%@ include file="/WEB-INF/template/footer.jsp"%>
	</body>
</html>


