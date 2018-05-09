<%@page import="dao.GroupsDAO"%>
<%@page import="vo.Group"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Group> list = GroupsDAO.groupList();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 목록</title>
	</head>
	<body>
		<h1>그룹 목록</h1>
		<table border="1">
			<caption>그룹 목록표</caption>
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>데뷔일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%-- 이 부분 for문으로 돌아감 --%>
				<%for(Group group : list) { %>
				<tr>
					<td><%=group.getNo()%></td>
					<th><%=group.getName()%></th>
					<td><%=group.getDebutDate()%></td>
					<td><a href="updateGroupForm.jsp?no=<%=group.getNo()%>">수정</a></td>
					<td><a href="deleteGroup.jsp?no=<%=group.getNo()%>">삭제</a></td>
				</tr>
				<% } %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						<a href="insertGroupForm.jsp">그룹 입력</a>
						<a href="index.jsp">이전으로</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</body>
</html>