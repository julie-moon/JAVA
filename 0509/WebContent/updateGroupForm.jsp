<%@page import="java.sql.Date"%>
<%@page import="vo.Group"%>
<%@page import="dao.GroupsDAO"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	Calendar now = Calendar.getInstance();
	
	int year = now.get(Calendar.YEAR);
	
	// 넘어온 파라미터(그룹 번호)로 한 개의 그룹 정보를 얻어와야 함
	String noStr = request.getParameter("no");
	int no = Integer.parseInt(noStr);
	
	Group group = GroupsDAO.selectOne(no);

	// 년 월 일을 얻어와야 함
	Date debutDate = group.getDebutDate();
	
	// 제대로 하려면 Calendar로 형변환
	Calendar debut = Calendar.getInstance();
	debut.setTime(debutDate);
	int debutYear = debut.get(Calendar.YEAR);
	int month = debut.get(Calendar.MONTH)+1;
	int date = debut.get(Calendar.DATE);
	
	/*
	int debutYear = debutDate.getYear()+1900; // 밀레니엄 버그 이전 메소드(1999년 -> 99) // +1900 
	int month = debutDate.getMonth()+1; // 0월부터이기 때문에 +1
	int date = debutDate.getDate();
	*/
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 수정</title>
	</head>
	<body>
		<h1>그룹 수정</h1>
		<form action="updateGroup.jsp" method="post">
		<!-- 유저에게 보여주는 데이터는 아니지만, 파라미터로 넘겨야 할 때 input type="hidden"을 사용 -->
		<input type="hidden" name="no" value="<%=no%>" />
			<fieldset>
				<legend>그룹 수정 폼</legend>
				<p>
					<label for="name">그룹명</label>
					<input id="name" type="text" name="name" value="<%=group.getName()%>" placeholder="그룹명" />
				</p>
				<p>
					<span>데뷔일</span>
					<select name="year">
						<%for(int i=year; i>1904; i--) { 
							if(i==debutYear) { %>
								<option selected><%=i %></option>
							<% } else{ %>
								<option><%=i %></option>
							<% } %>
						<% } %>
					</select>
					<select name="month">
						<%for(int i=1; i<13; i++) { %>
							<option
							<% if(i==month) { %>
								selected 
							<% } %>
							><%=i %></option>
						<% } %>
					</select>
					<select name="date">
						<%for(int i=1; i<32; i++) { %>
							<option
							<% if(i==date) { %>
								selected 
							<% } %>
							><%=i %></option>
						<% } %>
					</select>
				</p>
				<p>
					<button type="reset">입력 리셋</button>
					<button type="submit">그룹 수정</button>
				</p>
			</fieldset>
		</form>
		<a href="listGroup.jsp">이전으로</a>
	</body>
</html>