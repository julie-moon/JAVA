<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 관리 프로그램</title>
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
			#insertBox{
				width:400px;
				border:1px solid #424242;
				position:relative;
				padding:10px;
				margin:10px;
				margin-top:0px;
				float:left;
			}
			#insertBox h2, #listBox h2{
				text-align:center;
			} 
			#insertBox #name{
				font-family:'Noto Sans KR', sans-serif;
				padding:5px;
			}
			#insertBox select{
				font-family:'Noto Sans KR', sans-serif;
				padding:5px 15px;
			}
			#listBox {
				width:725px;
				padding:10px;
				margin:0 10px 10px 0;
				border:1px solid #424242;
				float:right;
				position:relative;
				min-height:400px;
			}
			#listBox table{
				border-collapse:collapse;
				width:725px;
			}
			#listBox td, #listBox th{
				border:1px solid #424242;
				padding:5px 10px;
				text-align:center;
			}
			#listBox th{
				background-color:#E0E0E0;
			}
			button{
				background-color:#BDBDBD;
				font-family:'Noto Sans KR', sans-serif;
				border:none;
				padding:5px 15px;
				color:#FFF;
				font-weight:500;
			}
			button:hover{
				background-color:#757575;
				font-weight:700;
				box-shadow: 0 12px 15px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
			}
			.loader{
				position:absolute;
				left:0;
				top:0;
				width:100%;
				height:100%;
				background-color:rgba(255, 255, 255, .7);
				background-image:url(img/loader.gif);
				background-repeat:no-repeat;
				background-position:center;
				background-size:20%;
				display:none;
			}
		</style>
	</head>
	<body>
		<div id="wrap">
			<h1>그룹 관리 프로그램</h1>
			<div id="insertBox">
				<h2>그룹 입력</h2>
				<form id="insertForm">
					<fieldset>
						<legend>입력 폼</legend>
						<p>
							<input type="text" id="name" placeholder="그룹명 입력" />
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
							<button>그룹 입력</button>
						</p>
					</fieldset>
				</form>
				<div class="loader"></div> <!-- // .loader -->
			</div> <!-- // #insertBox -->
			<div id="listBox">
				<h2>그룹 목록</h2>
				<table border="1">
					<thead>
						<tr>
							<th>번호</th>
							<th>그룹명</th>
							<th>데뷔일</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4">아직 없음</td>
						</tr>
					</tbody>
				</table>
				<div class="loader"></div> <!-- // .loader -->
			</div> <!-- // #listBox -->
		</div> <!-- // #wrap -->	
	</body>
	<%-- underscore 템플릿 --%>
	<script type="text/template" id="groupTmp">
	<@ _.each(groups, function(group){ @>
	<@ var debutDate = moment(group.debutDate).format("YYYY년 MM월 DD일"); @>
		<tr>
			<td><@=group.no@></td>
			<td><@=group.name@></td>
			<td><@=debutDate@></td>
			<td><button class="delete" data-no="<@=group.no@>">삭제</button></td>
		</tr>
	<@ }) @>
	</script>
	<script src="js/jquery.js"></script>
	<script src="js/moment-with-locales.js"></script>
	<script src="js/underscore-min.js"></script>
	<script>
	
		// -1) underscore 템플릿을 jsp에도 사용하기 위해 <@ @>로 변경
			_.templateSettings = {
				interpolate: /\<\@\=(.+?)\@\>/gim,
				evaluate: /\<\@(.+?)\@\>/gim,
				escape: /\<\@\-(.+?)\@\>/gim
			};
		
		// 0) 여러가지 변수 선언
		var $insertLoader = $('#insertBox .loader');
		var $listLoader = $('#listBox .loader');
		var tmp = _.template($("#groupTmp").html());
		
		// 1) 목록 리스트를 받아오는 함수
		function getList() {
			
			// 2)로딩 이미지 보여주기
			$listLoader.show();
			
			// 3)ajax 처리
			$.ajax({
				url:"ajax/getGroups.jsp",
				error:function(){
					alert("서버 점검중-!");
				}, 
				success:function(json){
					console.log(json);
					
					var markup = tmp({groups:json});
					// console.log(markup);
					
					// 4)템플릿 이용하여 붙이기	
					$('#listBox tbody').empty().append(markup);
			
					// 5) listLoader 숨기기
					$listLoader.fadeOut(500);
				} // url, data, error, success end
				
			}); // $.ajax() end
			
		} // getList() end
	
		// 한 번 호출
		getList();
		
		// 6) #insertForm이 submit될 때
		$("#insertForm").on('submit', function(){
			
			// ) #name인 input 요소의 값 얻기
			var name = $("#name").val();
			
			// 유효성 검사(name 입력 안했을 때)
			if(name.length == 0) {
				
				alert("그룹명을 제대로 입력해 주세요-!");
				
				$("#name").val("").focus();
				
				// 로딩 이미지 숨기기
				$insertLoader.hide();
				
				return false;
				
			} // if end
			
			// ) 로딩 이미지 보여주기
			$insertLoader.show();
			
			// 9) #year인 select 요소의 값 얻기
			var year = $("#year").val();
			
			// 10) #month인 select 요소의 값 얻기
			var month = $("#month").val();
			
			// 11) #date인 select 요소의 값 얻기
			var date = $("#date").val();
			
			// console.log(name + " / " + year + " / " + month + " / " + date);
			
			// 12) ajax
			$.ajax({
				
				url:"ajax/insertGroup.jsp",
				data:{
					name:name,
					year:year,
					month:month,
					date:date
				},
				error:function() {
					alert("서버 점검중-!");
				},
				success:function(json) {
					
					// alert("성공-!");
					$insertLoader.fadeOut(500);
					
					// 폼 리셋
					// $("#insertForm")[0].reset();
					$("#insertForm").trigger('reset');
					
					// 갱신
					getList();
					
				} // url, data, error, success end
				
			}); // $.ajax() end
			
			return false; // e.preventDefault와 같음
			
		}); // on() end
		
		// .delete 버튼을 클릭 했을 때
		$("tbody").on('click', '.delete', function(){
			// alert('test');
			
			// var no = $(this).parents('tr').children().eq(0).text();
			// var no = $(this).dataset.no; 
			var no = $(this).attr("data-no");
			// alert(no);
			
			$listLoader.show();
			
			// ajax
			$.ajax({
				url:"ajax/deleteGroup.jsp",
				data:{
					no:no
				},
				error:function() {
					alert('서버 점검중-!');
				},
				success:function(json) {
					
					// alert('성공');
					
					// 로더 이미지 사라짐
					$listLoader.fadeOut(500);
					
					// 갱신
					getList();
					
				} // url, data, error, success end
				
			}); // $.ajax end
			
		}); // on() end
		
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
</html>