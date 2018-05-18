<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>방명록 글쓰기</title>
		<%@ include file="/WEB-INF/templete/link.jsp" %>
		<style>
			#content h2 {
				font-size:32px;
				color:#2196f3;
				margin:20px 0;
				font-weight:700;
			}
			
			#content label {
				width:80px;
				display: inline-block;
				height:40px;
				font-size:21px;
				line-height:40px;
				text-align: right;
				vertical-align: top;
				color:#424242;
				font-weight: 200;
			}
			
			#writer,#contents {
				vertical-align: top;
				font-family:"Noto Sans KR",sans-serif;
				font-size:25px;
				width:588px;
				padding:10px;
				border:1px solid #2196f3;;
				/*
				 * textarea크기 변경 못하게
				 */
				resize: none;
				margin-left:5px;
			} 
			
			#writer:focus,#contents:focus {
				border-color:#2196f3;;
				background:#efefef;
				outline:2px solid #2196f3;
			}
			
			#content div {
				margin:10px 0;
			}
			
		</style>
	</head>
	<body>
		<%@ include file="/WEB-INF/templete/header.jsp" %>
				<h2><i class="fa fa-pencil-square-o"></i> 방명록 글쓰기</h2>
				<form method="post" action="writeGuestbook.jsp">
					<fieldset>
						<legend class="screen_out">글쓰기폼</legend>
						<div>
							<label for="writer">작성자</label>
							<input type="text" id="writer" name="writer" placeholder="작성자를 입력"/>
						</div>
						<div>
							<label for="contents">내 용</label>
							<textarea id="contents" name="contents" placeholder="내용 입력" cols="50" rows="5"></textarea>
						</div>
						<div class="btn_box">
							<button class="btn" type="reset"><i class="fa fa-refresh "></i> 리 셋</button>
							<button class="btn" type="submit"><i class="fa fa-pencil "></i> 글쓰기</button>
							<a class="btn" href="index.jsp"><i class="fa fa-arrow-left "></i> 방명록으로</a>
						</div>
					</fieldset>					
				</form>
		<%@ include file="/WEB-INF/templete/footer.jsp" %>
	</body>
</html>
    