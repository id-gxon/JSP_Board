<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>deleteForm.jsp</h1>
	<fieldset>
		<legend>회원 정보 삭제(탈퇴)</legend>
		<form action="deletePro.jsp" method="post">
			<input type="hidden" name="id" value="<%=session.getAttribute("id")%>">
			PW: <input type="password" name="pass"><br>
			<input type="submit" value="탈퇴하기">
		</form>
	</fieldset>
</body>
</html>