<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLoginForm.jsp</h1>

	<h2>사용자가 ID, PASSWORD를 입력(비교하는 페이지(sessionLoginPro.jsp)로 이동)</h2>

	<fieldset>
		<form action="sessionLoginPro.jsp" method="post">
			ID: <input type="text" name="id"><br> PW: <input
				type="password" name="pw"><br> <input type="submit"
				value="로그인">
		</form>
	</fieldset>



</body>
</html>