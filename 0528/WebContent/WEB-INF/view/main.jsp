<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>메인페이지</title>
		<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
	</head>
	<body>
		<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
			<h2>전화번호 목록</h2>
			<div id="phoneBox">
			<table border="1">
			<caption class="screen_out">전화번호표</caption>
			<colgroup>
			<col id="name"/>
			<col id="phone"/>
			<col id="gender"/>
			<col id="age"/>
			<col id="delete"/>
			</colgroup>
			<thead>
				<tr>
					<th>이 름</th>
					<th>전화번호</th>
					<th>성 별</th>
					<th>나 이</th>
					<th>삭 제</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${list.isEmpty()}">
					<tr>
						<td colspan="5" class="no_data">전화번호가 없습니다.</td>
					</tr>
					</c:when>
					<c:otherwise>
					<c:forEach items="${list}" var="person">
					<tr>
						<td>${person.name}</td>
						<th>${person.phone}</th>
						<td>
							<i class="fa fa-male"></i>
							${person.gender}
						</td>
						<td title="<fmt:formatDate pattern="YYYY년 M월 d일" value="${person.birthDate}" />">31살</td> 
						<td>
							<a href="delete.pb?no=${person.no}" data-name="${person.name}" class="btn delete"><i class="fa fa-times"></i> 삭제</a>
						</td>
					</tr>
					</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td id="btnBox" colspan="7">
						<a href="insert.pb" class="btn"><i class="fa fa-pencil"></i> 전화번호 작성</a>
					</td>
				</tr>
			</tfoot>
			</table>
			</div><!-- //phoneBox -->
		<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
		<script src="js/jquery.js"></script>
		<script>
			$('tbody').on('click', '.delete', function(e){
				e.preventDefault();
				alert("hello");
			});
		</script>
	</body>
</html>