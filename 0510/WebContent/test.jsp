<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%-- include될 jsp는 DOCTYPE, html, head, body등 작성하지 않음 --%>
	<%-- basic.jsp에서 코드가 합쳐지기 때문에 include한 페이지의 변수 등을 함께 사용 가능 --%>
	<h1><%=name%></h1>
	<%-- 
		<h1><%=out.print(name);%></h1>
	--%>