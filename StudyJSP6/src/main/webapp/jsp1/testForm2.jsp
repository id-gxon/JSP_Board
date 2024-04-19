<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testForm2.jsp</h1>

	<fieldset>
		<!-- testPro2.jsp 페이지로 정보 전달 후 출력 -->
		<form action="testPro2.jsp" method="post">
			이름: <input type="text" name="name"><br>
			나이: <input type="text" name="age"><br>
			<input type="submit" value="전송">
		</form>
	</fieldset>
</body>
</html>