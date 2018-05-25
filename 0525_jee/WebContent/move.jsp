<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		주소 이동
		1) 리다이렉트 방식 : 클라이언트에게 그 페이지로 이동하라고 응답하는 방식(요청 2번 / 응답 2번)
							 response.sendRedirect("test.jsp");

		2) 포워드 방식 : 서버 내부에서 주소가 변경되고 브라우저에서 주소가 바뀌지 않음(요청 1번 / 응답 1번)
	*/
	RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/hello.jsp");
	rd.forward(request, response);
%>
