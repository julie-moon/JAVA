<%@page import="vo.Group"%>
<%@page import="java.util.List"%>
<%@page import="util.SqlSessionUtil"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SqlSession sqlSession = SqlSessionUtil.getSession();
	List<Group> list = sqlSession.selectList("groups.selectList");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>그룹 목록</h1>
		<table border="1">
			<caption>그룹목록표</caption>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>데뷔일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<% for(Group group : list) { %>
				<tr>
					<td><%= group.getNo() %></td>
					<td><%= group.getName() %></td>
					<td><%= group.getDebutDate() %></td>
					<td><a href="">삭제</a></td>
				</tr>
				<% } %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<a href="">장르입력</a>
						<a href="">돌아가기</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</body>
</html>