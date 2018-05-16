<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>파일 업로드 폼</title>
	</head>
	<body>
		<h1>사진 업로드</h1>
		<%-- 
			파일 업로드는 method="post"
			enctype="multipart/form-data"
		--%>
		<form action="upload.jsp" method="post" enctype="multipart/form-data">
			<fieldset>
				<legend>업로드 폼</legend>
				<p>
					<label>이름
						<input name="name" />
					</label>
				</p>
				<p>
					<label>사진
						<input name="profile" type="file" />
					</label>
				</p>
				<p>
					<button>업로드</button>
				</p>
			</fieldset>
		</form>
	</body>
</html>