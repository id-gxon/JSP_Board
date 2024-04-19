<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>insertForm.jsp</h1>

	<fieldset>
		<legend>회원 정보 입력창</legend>
		<form action="insertPro.jsp" method="post">
			ID: <input type="text" name="id"><br>
			PASSWORD: <input type="text" name="pass"><br>
			NAME: <input type="text" name="name"><br>
			GENDER: <input type="radio" name="gender" value="M">남<input type="radio" name="gender" value="W">여<br>
			AGE	: <input type="number" name="age"><br>
			EMAIL: <input type="text" name="email"><br>
			<input type="submit" value="회원 가입">
		</form>
	</fieldset>
</body>
</html>