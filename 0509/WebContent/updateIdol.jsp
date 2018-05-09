<%@page import="dao.IdolsDAO"%>
<%@page import="vo.Idol"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// post 방식의 한글 처리
	request.setCharacterEncoding("UTF-8");

	// 넘어온 파라미터 처리
	String name = request.getParameter("name");
	String heightStr = request.getParameter("height");
	String weightStr = request.getParameter("weight");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String date = request.getParameter("date");
	String groupNoStr = request.getParameter("groupNo");
	String noStr = request.getParameter("no"); // no값도 받아야함!!!!!!!
	
	// 필요한 자료형 변환
	double height = Double.parseDouble(heightStr);
	double weight = Double.parseDouble(weightStr);
	Date birthDate = Date.valueOf(year+"-"+month+"-"+date);
	int groupNo = Integer.parseInt(groupNoStr);
	int no = Integer.parseInt(noStr);
	
	// Idol 객체 생성
	Idol idol = new Idol();
	
	// setter 호출하여 값 세팅
	idol.setName(name);
	idol.setHeight(height);
	idol.setWeight(weight);
	idol.setBirthDate(birthDate);
	idol.setGroupNo(groupNo);
	idol.setNo(no);
	
	// IdolsDAO.updateIdol() 호출하여 수정
	IdolsDAO.updateIdol(idol);
	
	// listIdol.jsp로 이동
	response.sendRedirect("listIdol.jsp");
%>
<%--
번호 : <%=no %> / 
이름 : <%=name%> / 
키 : <%=height%> / 
몸무게 : <%=weight%> / 
생년월일 : <%=birthDate%> / 
그룹번호 : <%=groupNo%>
--%>