<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
	
		속성의 범위(scope)
		
		Servlet & JSP는 네 가지 속성(attribute)을 가짐
		
		1) page : 한 페이지에서만(빈번하게 사용되지 않음-!) 
				  pageContext.setAttribute("name", "유아인");
				  String name = (String)pageContext.getAttribute("name");
				  
		2) request : request에서만(SpringWebMVC에서 아주 아주 아주 많이 씀-!)
					 request.setAttribute("", "");
					 request.getAttribute("");
					 
		3) session : session에서만(로그인 처리, 다른 페이지)
					 session.setAttribute("", "");
					 session.getAttribute("");
					 
		4) context : 서버가 켜있는 동안(거의 안씀)
				     application.setAttribute("", "");
					 application.getAttribute("");
	*/
%>