<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fileWriteForm.jsp</h1>
	<h2>게시판 첨부파일 글쓰기</h2>
	<fieldset>
		<!-- 
		첨부파일을 포함해서 전송하려면 필수 사용
			1) method="post"
			2) enctype="multipart/form-data"
		 -->
		<form action="fileWritePro.jsp" method="post" enctype="multipart/form-data">
			작성자: <input type="text" name="name"><br>
			비밀번호: <input type="password" name="pass"><br>
			제목: <input type="text" name="subject"><br>
			내용: <textarea rows="5" cols="20" name="content"></textarea><hr>
			
			<input type="file" name="file" >
			<input type="submit" value="글쓰기(첨부파일)">
		</form>
	</fieldset>
</body>
</html>