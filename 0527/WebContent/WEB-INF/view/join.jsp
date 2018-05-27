<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 폼</title>
	</head>
	<body>
		<h1>회원 가입</h1>
		<form method="post" action="join.jbm">
			<fieldset>
				<legend>회원 가입 폼</legend>
				<p>
					<input name="id" placeholder="아이디" />
				</p>
				<p>
					<input name="password" type="password" placeholder="비밀번호" />
				</p>
				<p>
					<input name="nickname" placeholder="닉네임" />
				</p>
				<p>
					<select name="year">
						<option>2017</option>
						<option>2016</option>
						<option>2015</option>
					</select>년
					<select name="month">
						<option>1</option>
						<option>2</option>
						<option>3</option>
					</select>월
					<select name="date">
						<option>1</option>
						<option>2</option>
						<option>3</option>
					</select>일
				</p>
				<p>
					<button>회원가입</button>
				</p>
			</fieldset>
		</form>
	</body>
</html>