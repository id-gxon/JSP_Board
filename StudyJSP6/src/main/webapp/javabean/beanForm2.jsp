<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>beanForm2.jsp</h2>
	<!-- 
	사용자의 ID, PASSWORD, NAME, AGE 정보를 입력 받아서
	beanPro2.jsp에 전달/출력 [1) 개별 2) 자바빈 객체 3) 액션 태그]
 	-->
 	<fieldset>
 		<form action="beanPro2.jsp" method="post">
 			ID: <input type="text" name="id"><br>
 			PASS: <input type="password" name="pass"><br>
 			NAME: <input type="text" name="name"><br>
 			AGE: <input type="number" name="age"><br>
 			<input type="submit" value="전달하기">
 		</form>
 	</fieldset>
</body>
</html>