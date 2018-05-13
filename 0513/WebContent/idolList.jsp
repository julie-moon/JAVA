<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>아이돌 목록</title>
	<link href='css/notosanskr.css' rel='stylesheet'/>
		<style>
			body{
				margin:0;
				font-family:'Noto Sans KR', sans-serif;
			}
			#wrap{
				width:1200px;
				border:1px solid #424242;
				margin:10px auto;
				overflow:hidden;
			}
			h1{
				/*background-color:pink;*/
				text-align:center;
				margin:40px 0;
			}
			h2{
				text-align:center;
			}
			#insertBox {
				border:1px solid #424242;
				width:278px;
				padding:10px;
				margin:10px;
				margin-top:0;
				float:left;
			}
			#insertBox
			#listBox {
				border:1px solid #424242;
				width:845px;
				padding:10px;
				margin:0 10px 10px 0;
				float:right;
			}
			#listBox table{
				border-collapse:collapse;
				width:845px;
			}
			#listBox td, #listBox th{
				border:1px solid #424242;
				padding:5px 10px;
				text-align:center;
			}
			#listBox th{
				background-color:#E0E0E0;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<h1>아이돌 관리 프로그램</h1>
			<div id="insertBox">
				<h2>아이돌 입력</h2>
				<form id="insertForm">
					<fieldset>
						<legend>입력 폼</legend>
						<p>
							<input id="name" placeholder="이름을 입력하세요." />
						</p>
						<p>
							<input id="height" placeholder="키를 입력하세요." />
						</p>
						<p>
							<input id="weight" placeholder="몸무게를 입력하세요." />
						</p>
						<p>
							<select id="year">
								<% for(int i = 2017; i>1950; i--){ %>
								<option><%=i%></option>
								<% } %>
							</select> 년
							<select id="month">
								<% for(int i=1; i<13; i++) { %>
								<option><%=i%></option>
								<% } %>
							</select> 월
							<select id="date">
							</select> 일
						</p>
						<p>
							<select>
								<option>워너원</option>
								<option>레드벨벳</option>
								<option>아이오아이</option>
							</select>
						</p>
						<p>
							<button>그룹 입력</button>
						</p>
					</fieldset>
				</form> <!-- // #insertForm -->
			</div> <!-- // #insertBox -->
			<div id="listBox">
				<h2>아이돌 목록</h2>
				<table border="1">
					<thead>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>키</th>
							<th>몸무게</th>
							<th>생년월일</th>
							<th>그룹명</th>
							<th>삭제</th>
						</tr>
						<tr>
							<td colspan="7">아직 없음</td>
						</tr>
					</thead>
				</table>
			</div> <!-- // #listBox -->
		</div> <!-- // #wrap -->
		<script src="js/jquery.js"></script>
		<script src="js/moment-with-locales.js"></script>
		<script src="js/underscore-min.js"></script>
		<script>
function createDate() {
	        
	        // 11/15 10번) 해당 년, 월을 얻어옴
	        var year = $("#year").val();
	        var month = $("#month").val();
	        
	        // 11/15 11번) 그 년도와 월로 moment 객체를 생성
	        var thatDate = moment([year,month-1]);
	        console.log(thatDate);
	        
	        // 11/15 12번) 그 달의 마지막 날을 얻어옴
	        var endDay = thatDate.endOf("month").date();
	        console.log(endDay);
	        
	        // 11/14 20번) 기존의 option 요소들을 전부 비우기
	        $('#date').empty();
	        
	        // 11/15 13번) 1~endDay까지 for문
	        for(var i=1; i<=endDay; i++){
	            var value = i;
	            // 11/15 14번) 만약 i의 값이 10보다 작으면
	            if(value<10) {
	                value = "0" + value;
	            } // if end
	            // 11/15 15번) option요소 생성 후, #date에 appendTo
	            $("<option>").attr("value",value).text(i).appendTo("#date");
	        } // for end
	        
	    } // createDate() end
	   
	    // 11/16 01번) 한 번 호출
	    createDate();
	    // 11/16 02번) id가 year와 month인 select 요소의 값을 변경했을 때 createDate가 호출됨
	    $("#year, #month").on('change', createDate);
		</script>
	</body>
</html>