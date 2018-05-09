<%@page import="vo.Idol"%>
<%@page import="dao.IdolsDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List<Idol> list = IdolsDAO.idolList();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>아이돌 목록</title>
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
					<th>생일</th>
					<th>그룹번호</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(Idol idol : list) { %>
				<tr>
					<td><%=idol.getNo()%></td>
					<th><%=idol.getName()%></th>
					<td><%=idol.getHeight()%></td>
					<td><%=idol.getWeight()%></td>
					<td><%=idol.getBirthDate()%></td>
					<td><%=idol.getGroupNo()%></td>
					<td>
						<a href="updateIdolForm.jsp?no=<%=idol.getNo()%>">수정</a>
					</td>
					<td>
						<a href="deleteIdol.jsp?no=<%=idol.getNo()%>">삭제</a>
					</td>
				</tr>
				<% } %>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8">
						<a href="insertIdolForm.jsp">아이돌 입력</a>
						<a href="index.jsp">이전으로</a>
					</td>
				</tr>
			</tfoot>
		</table>
	</body>
</html>