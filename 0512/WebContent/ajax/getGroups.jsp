<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="dao.GroupsDAO"%>
<%@page import="vo.Group"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// json을 문자열로 만들기 쉽지 않음. 그래서 jackson json 라이브러리 활용!
	
	// request.setCharacterEncoding("UTF-8");
	
	// 1) 넘어온 파라미터 받기
	String name = request.getParameter("name");
	
	// 2) 만약 name이 null이면
	if(name == null) {
		// 빈 값을 채움
		name="";
	} // if end
	
	// 3) 파라미터 넘겨서 list 받음
	List<Group> list = GroupsDAO.selectList(name);
	
	// 4) jackson json 라이브러리 활용해서 json으로 변경
	ObjectMapper om = new ObjectMapper();
	String json = om.writeValueAsString(list);
%>
<%=json %>
<%-- >
<% for(Group group : list) { %>
	번호 : <%=group.getNo() %> 
	그룹명 : <%=group.getName() %> 
	데뷔일 : <%=group.getDebutDate() %>
<% } %>
--%

<%-- 
[
	{"no":2, "name":"워너원", "debutDate":"2017-08-07"},
	{"no":3, "name":"방탄소년단", "debutDate":"2017-08-07"},
	{"no":4, "name":"JBJ", "debutDate":"2017-08-07"}
]
--%>