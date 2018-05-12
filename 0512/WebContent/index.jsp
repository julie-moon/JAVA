<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>그룹 검색 페이지</title>
		<style>
			#loader{
				position:fixed;
				left:0;
				top:0;
				width:100%;
				height:100%;
				background:rgba(255, 255, 255, .8);
				background-image:url(img/loader2.gif);
				background-repeat:no-repeat;
				background-position:center;
				display:none;
			}
		</style>
	</head>
	<body>
		<h1>그룹 검색</h1>
		<p>
			<input id="name" />
		</p>
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>그룹명</th>
					<th>데뷔일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td colspan="3">검색하세요-!</td>
				</tr>
			</tbody>
		</table>
		<div id="loader"></div>
		<%-- 5) underscore 템플릿 --%>
		<script type="text/template" id="groupTmp">
		<@ _.each(groups, function(group){ @>
		<@  var debutDate = moment(group.debutDate).format("YYYY년 MM월 DD일"); @>
			<tr>
				<td><@=group.no@></td>
				<td><@=group.name@></td>
				<td><@=debutDate@></td>
			</tr>
		<@ }) @>
		</script>
		<script src="js/jquery.js"></script>
		<script src="js/moment-with-locales.js"></script>
		<script src="js/underscore-min.js"></script>
		<script>
		
			// 0) underscore 템플릿을 jsp에도 사용하기 위해 <@ @>로 변경
			_.templateSettings = {
				interpolate: /\<\@\=(.+?)\@\>/gim,
				evaluate: /\<\@(.+?)\@\>/gim,
				escape: /\<\@\-(.+?)\@\>/gim
			};
		
			// 1) id가 #loader인 div 요소를 jquery 객체로
			var $loader = $("#loader");
			
			// 6) 템플릿 만들기
			var tmp = _.template($("#groupTmp").html());
			
			// 2) 그룹 목록을 얻어오는 함수 선언
			function getGroupList() {
				
				// 3) 우선 로딩 보여주기
				$loader.show();
				
				// 11) 유저가 입력한 글자 얻기
				var name = $('#name').val();
				
				// 4) ajax
				$.ajax({
					
					url:"ajax/getGroups.jsp",
					data:{name:name},
					error:function(){
						alert("서버 점검중-!");
					},
					success:function(json){
						//console.log(json);
						
						// 7) tmp 작동 시켜 마크업 얻기
						var markup = tmp({groups:json});
						console.log(markup);
						
						// 8) tbody의 기존 컨텐츠를 제거하고 markup을 붙임 
						$('tbody').empty().append(markup);
						
						// 9) loader 숨김
						$loader.hide();
					} // url, error, success end
					
				}); // $.ajax() end
				
			} // getGroupList() end
			
			// 연습용
			// getGroupList();
			
			// 10) 유저가 input요소에 입력할 때마다 getGroupList() 호출
			$('#name').keyup(getGroupList);
		
		</script>
	</body>
</html>