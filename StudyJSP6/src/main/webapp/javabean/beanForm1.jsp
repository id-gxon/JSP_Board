<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>beanForm1.jsp</h1>
	<!-- 
	사용자의 ID 정보를 입력 받아서
	beanPro1.jsp에 전달/출력
	-->
	<fieldset>
		<form action="beanPro1.jsp" method="post">
			ID: <input type="text" name="id">
			<input type="submit" value="전달하기">
		</form>
	</fieldset>
</body>
</html>