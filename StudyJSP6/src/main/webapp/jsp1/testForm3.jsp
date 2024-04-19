<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testForm3.jsp</h1>

	<fieldset>
		<form action="testPro3.jsp" method="get">
			이름: <input type="text" name="name"><br>
			나이: <input type="number" name="age"><br>
			성별: <input type="radio" name="gender" value="남">남
				<input type="radio" name="gender" value="여">여
			<hr>
			취미: <input type="checkbox" name="hobby" value="게임">게임
				<input type="checkbox" name="hobby" value="요리">요리
				<input type="checkbox" name="hobby" value="운동">운동
			<hr>
			강의장:
			<select name="roomNo">
				<option value="1">1강의장</option>
				<option value="2">2강의장</option>
				<option value="3">3강의장</option>
				<option value="4">4강의장</option>
				<option value="5">5강의장</option>
				<option value="6">6강의장</option>
			
			</select>
			<hr>
			<input type="submit" value="전송">
		</form>

	</fieldset>
</body>
</html>