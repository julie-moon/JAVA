<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>모델1 게시판</title>
		<%@ include file="/WEB-INF/template/link.jsp"%>
		<link rel="stylesheet" href="css/joinForm.css" />
	</head>
	<body>
		<%-- 회원가입의 경우 header가 다름 --%>
		<div id="header">
			<div class="aux">
			   	<h1 id="logo">
			    	<a href="index.jsp"><i class="fa fa-instagram"></i> 멋진 게시판</a>
			    </h1>
			</div><!-- //aux -->
		</div><!-- // #header -->
		<div id="content">
		    <div class="aux">
				<h2>회원가입폼</h2>
				<%--
					유효성 검사 : 유저가 입력한 정보가 제대로 되었는지 확인하는 검사 
				 	예) id를 입력해야 하고, 영어와 숫자로 4~20글자 사이
				 	
				 	유효성 검사 방법 2가지
				 	1) 자바스크립트 이용
				 	2) HTML5 요소의 속성으로 
				 	   - required : 반드시 입력
				 	   - pattern : 정규 표현식 패턴
				--%>
				<div id="joinBox">
					<form method="post" action="join.jsp" enctype="multipart/form-data">
						<fieldset>
							<legend class="screen_out">회원가입폼</legend>
							<div class="row">
								<label for="id">아이디</label> 
								<input id="id" name="id" maxlength="20" autocomplete="off"
									placeholder="영어,숫자로 4~20자 입력" title="영어,숫자로 4~20자 입력"
									pattern="[a-z|A-Z]{1}[\w]{4,20}" required /> 
								<div class="msg id">4~20자의 영문 소문자, 숫자만 사용 가능합니다.</div>
							</div>
							<div class="row">
								<label for="nickname">별 명</label> 
								<input id="nickname" required maxlength="10" autocomplete="off"
									pattern="[ㄱ-힣|0-9]{1,10}" placeholder="10자 내로 한글,숫자 입력"
									title="10자 내로 한글,숫자 입력" name="nickname" /> 
								<div class="msg nickname">2~10자의 한글, 숫자만 사용 가능합니다.</div>
							</div>
							<div class="row">
								<label for="pwd">비밀번호</label> 
								<input type="password" id="pwd"
									required pattern="[\w]{4,32}" placeholder="4~32자로 입력"
									title="4~32자로 입력" name="password" /> 
								<div class="msg password">필수 정보입니다.</div>
							</div>
							<div class="row">
								<label for="confirm">비밀번호 확인</label> 
								<input type="password"
									id="confirm" pattern="[\w]{4,32}" required
									placeholder="위와 동일하게 입력" title="위와 동일하게 입력" /> 
								<div class="msg confirm"> 필수 정보입니다.</div>
							</div>
							<div class="row">
								<label for="birthDate">생년월일</label>
								<p id="birthDate">
									<label> 
										<input type="text" id="year" name="year" required
										pattern="[1-9]{1}[0-9]{3}" title="태어난 년도를 입력" placeholder="년" />년
									</label> 
									<label> 
										<input type="text" id="month" name="month"
										required pattern="[0-9]{1,2}" title="태어난 월을 입력" placeholder="월" />월
									</label> 
									<label> 
										<input type="text" id="date" name="date" required
										pattern="[0-9]{1,2}" title="태어난 일을 입력" placeholder="일" />일
									</label>
								</p>
							</div>
							<div class="row">
								<label for="profile">
									<span>프로필사진</span>
								</label> <input type="file" required name="profile" id="profile" /> 
								<div class="msg profile">필수 정보입니다.</div>
							</div>
							<div class="btn_box">
								<button class="btn" type="submit">회원가입</button>
								<button class="btn" type="reset">초기화</button>
								<a class="btn" href="index.jsp">index으로</a>
							</div>
						</fieldset>
					</form>
				</div> <!--// joinBox -->
		<%@ include file="/WEB-INF/template/footer.jsp"%>
		<script src="js/jquery.js"></script>
		<script>
			var $id = $("#id"),
			    $idMsg = $(".id"),
			    $nickname = $("#nickname"),
			    $nickMsg = $(".nickname"),
			    nickReg = /^[ㄱ-힣|0-9]{1,10}$/;
			
			// 1) id가 id인 input요소에 keyup 이벤트리스너를 붙이고 이벤트핸들러 작성
			$id.keyup(function(){
				
				// 2) 유저가 입력한 글자를 얻어옴
				var id = $id.val();
				// console.log(id);
				
				// 3) 유효성 검사(id가 3글자인 경우에는 확인할 필요 없으므로) 
				var reg = /^[a-z|A-Z]{1}[\w]{3,19}$/; // reg는 정규 표현식 객체(test라는 메소드를 가지고 있음)
				// console.log(reg.test(id));
				// 4) 정규 표현식으로 테스트해서 실패했을 때(유저가 잘못 썼을 때)
				if(!reg.test(id)) {
					// 5) id의 메세지를 보여줌
					$idMsg.text("영어, 숫자로 4~20자 입력해 주세요-!").removeClass("ok").show();
					// 6) 끝-!
					return false;
				} // if end
				
				// 5) 여기에 왔다는 것은 유저가 잘 입력했다는 뜻. (즉, ajax 서버와 통신)
				$.ajax({
					
					url:"ajax/checkId.jsp",
					data:{
						id:id
					},
					error:function(){
						// alert('서버 점검중-!');
						$idMsg.text('서버 점검중-!').show();
					},
					success:function(json){
						// alert('성공-!');
						// $idMsg.text(json.count).show();
						
						if(json.count==0) {
							$idMsg.text("멋진 아이디네요-!").addClass("ok").show();
						} else{
							$idMsg.text(id + "은(는) 사용할 수 없습니다-!").removeClass("ok").show();
						} // if ~ else end
						
					} // url, data, error, success end
					
				}); // $.ajax() end
				
			}); // keyup() end
			
			// 1) id가 nickname인 input요소에 keyup 이벤트리스너를 붙이고 이벤트핸들러 작성
			$nickname.keyup(function(){
				
				// 2) 유저가 입력한 글자를 얻어옴
				var nickname = $nickname.val();
				// console.log(nickname);
				
				// 3) 유효성 검사 // 정규 표현식으로 테스트해서 실패했을 때(유저가 잘못 썼을 때)
				if(!nickReg.test(nickname)) {
					// 5) nickname의 메세지를 보여줌
					$nickMsg.text("2~10자의 한글, 숫자만 사용 가능합니다.").removeClass("ok").show();
					// 6) 끝-!
					return false;
				} // if end
				
				// 5) 여기에 왔다는 것은 유저가 잘 입력했다는 뜻. (즉, ajax 서버와 통신)
				$.ajax({
					
					url:"ajax/checkNickname.jsp",
					data:{
						nickname:nickname
					},
					error:function(){
						$nickMsg.text('서버 점검중-!').removeClass("ok").show();
					},
					success:function(json){
						
						// console.log(json)
						
						if(json.count==0) {
							$nickMsg.text("멋진 닉네임이네요-!").addClass("ok").show();
						} else{
							$nickMsg.text(nickname + "은(는) 사용할 수 없습니다-!").removeClass("ok").show();
						} // if ~ else end
						
					} // url, data, error, success end
					
				}); // $.ajax() end
				
			}); // keyup() end
			
		</script>
	</body>
</html>