<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>전화번호 입력페이지</title>
		<c:import url="/WEB-INF/view/template/link.jsp"></c:import>
	</head>
	<body>
		<c:import url="/WEB-INF/view/template/header.jsp"></c:import>
			<h2>전화번호 입력</h2>
			<div id="formBox">
				<form method="post" action="insert.pb">
					<fieldset>
						<legend class="screen_out">전화번호 입력폼</legend>
						<div class="row">
							<label for="name">이 름</label>
							<input id="name" name="name" title="2~6글자 한글과 숫자로만 입력해주세요."
							 placeholder="이름입력" />
						</div>
						<div class="row">
							<label for="phone">전화번호</label>
							<span id="phone">
							<select name="phone1" title="반드시 선택해주세요.">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>019</option>
							</select>
							- 
							<input name="phone2" title="3~4글자 숫자만 입력해주세요." class="digit4"
								placeholder="숫자입력" size="4" maxlength="4" />
							- 
							<input name="phone3" title="4글자 숫자만 입력해주세요." class="digit4"
							placeholder="숫자입력" size="4"	maxlength="4" />
							</span>
						</div>
						<div class="row">
							<label for="age">생년월일</label><span id="age">
							<select id="year" name="year">
								<c:forEach var="i" begin="0" end="${2017-1900}">
									<c:set var="yearOption" value="${2017-i}" />
									<option value="${yearOption}">${yearOption}</option>
								</c:forEach>
							</select><em>년</em>
							<select id="month" name="month">
								<c:forEach var="i" begin="1" end="12">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select><em>월</em>
							<select id="date" name="date">
								<c:forEach var="i" begin="1" end="31">
									<option value="${i}">${i}</option>
								</c:forEach>
								<!--  
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								-->
							</select><em>일</em>
							</span>
						</div>
						<div class="row">
							<label for="gender">성 별</label>
							<span id="gender">
							<input name="gender" value="F" type="radio" checked="checked" id="female" />
							<label for="female"><i class="fa fa-female"></i> 여 자</label>
							<input name="gender" value="M" type="radio" id="male" /> 
							<label for="male"><i class="fa fa-male"></i> 남 자</label>
							</span>
						</div>
						<div id="btnBox">
							<button type="submit" class="btn">
								<i class="fa fa-floppy-o"></i> 전화번호 등록
							</button>
							<button type="reset" class="btn">
								<i class="fa fa-undo"></i> 리 셋
							</button>
							<a href="main.pb" class="btn"><i class="fa fa-arrow-left"></i> 전화번호부로</a>
						</div>
					</fieldset>
				</form>
			</div><!-- //formBox  -->    
		<c:import url="/WEB-INF/view/template/footer.jsp"></c:import>
	</body>
</html>

