<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>logoutPro.jsp</h1>
	<%
	// 로그아웃 처리 > 로그인 정보를 삭제(세션 영역의 정보를 제거)
	session.invalidate();
	%>
	<script type="text/javascript">
		alert("로그아웃 성공!");
		location.href = "main.jsp";
	</script>
</body>
</html>