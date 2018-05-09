<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	Calendar now = Calendar.getInstance();
	
	int year = now.get(Calendar.YEAR);

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 입력</title>
	</head>
	<body>
		<h1>그룹 입력</h1>
		<form action="insertGroup.jsp" method="post">
			<fieldset>
				<legend>그룹 입력 폼</legend>
				<p>
					<label for="name">그룹명</label>
					<input id="name" type="text" name="name" placeholder="그룹명" />
				</p>
				<p>
					<span>데뷔일</span>
					<select name="year">
						<%for(int i=year; i>1904; i--) { 
							if(i==(year-18)) { %>
								<option selected><%=i %></option>
							<% } else{ %>
								<option><%=i %></option>
							<% } %>
						<% } %>
					</select>
					<select name="month">
						<%for(int i=1; i<13; i++) { %>
							<option><%=i %></option>
						<% } %>
					</select>
					<select name="date">
						<%for(int i=1; i<32; i++) { %>
							<option><%=i %></option>
						<% } %>
					</select>
				</p>
				<p>
					<button type="reset">입력 리셋</button>
					<button type="submit">그룹 입력</button>
				</p>
			</fieldset>
		</form>
		<a href="listGroup.jsp">이전으로</a>
	</body>
</html>