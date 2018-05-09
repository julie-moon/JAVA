<%@page import="dao.IdolsDAO"%>
<%@page import="vo.Idol"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	// get 방식일 때는 파라미터로 얻어온 값 한글 안깨짐. post 방식일 때 한글 깨짐(막아주기 위한 코드)
	request.setCharacterEncoding("UTF-8"); 

	// 넘어오는 파라미터 값 얻어오기
	String name = request.getParameter("name");
	String heightStr = request.getParameter("height");
	String weightStr = request.getParameter("weight");
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	String dateStr = request.getParameter("date");
	String groupNoStr = request.getParameter("groupNo");

	// 파라미터로 넘어온 값들은 String형이기 때문에 필요에 따라 형변환 해줘야 함
	double height = Double.parseDouble(heightStr);
	double weight = Double.parseDouble(weightStr);
	
	Date birthDate = Date.valueOf(yearStr+"-"+monthStr+"-"+dateStr);
	int groupNo = Integer.parseInt(groupNoStr);
	
	// Idol 객체 생성 후 세팅
	Idol idol = new Idol();
	idol.setName(name);
	idol.setHeight(height);
	idol.setWeight(weight);
	idol.setBirthDate(birthDate);
	idol.setGroupNo(groupNo);
	
	// 아이돌 입력
	IdolsDAO.insertIdol(idol);
	
	// listIdol로 이동(리다이렉트)
	response.sendRedirect("listIdol.jsp");
	
%>
<%-- 
이름 : <%=name %> / 
키 : <%=height%> / 
몸무게 : <%=weight%> / 
생년월일 : <%=birthDate%> / 
그룹 번호 : <%=groupNo%>
--%>