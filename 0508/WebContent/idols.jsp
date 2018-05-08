<%@page import="vo.Idol"%>
<%@page import="java.util.List"%>
<%@page import="util.SqlSessionUtil"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlSession sqlSession = SqlSessionUtil.getSession();
	List<Idol> list = sqlSession.selectList("idols.selectList");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>아이돌 목록</h1>
		<table border="1">
			<caption>아이돌 목록 표</caption>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>키</th>
					<th>몸무게</th>
					<th>생년월일</th>
					<th>그룹 번호</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<% for(Idol idol : list) { %>
				<tr>
					<td><%= idol.getNo() %></td>
					<td><%= idol.getName() %></td>
					<td><%= idol.getHeight() %></td>
					<td><%= idol.getWeight() %></td>
					<td><%= idol.getBirthDate() %></td>
					<td><%= idol.getGroupNo() %></td>
					<td>
						<a href="">삭제</a>
					</td>
				</tr>
				<% } %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8">
						<a href="">아이돌 입력</a>
						<a href="">돌아가기</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</body>
</html>