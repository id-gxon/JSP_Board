<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paramTest1</title>
</head>
<body>
	<fieldset>
		<form action="paramPro1.jsp" method="post">
			이름: <input type="text" name="name"><br>
			아이디: <input type="text" name="id"><br>
			나이: <input type="number" name="age"><br>
			좋아하는 음식1: <input type="text" name="foods"><br>
			좋아하는 음식2: <input type="text" name="foods"><br>
			<input type="submit" value="전송">
		</form>
	</fieldset>
</body>
</html>