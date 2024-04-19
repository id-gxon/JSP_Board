<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLogout.jsp</h1>

	<%
	// 로그아웃 처리 > 로그인 정보를 삭제(세션 영역의 정보를 제거)
	session.invalidate();
	%>
	<script type="text/javascript">
		alert("회원님의 정보가 안전하게 로그아웃 되었습니다.!");
		location.href = "sessionMain.jsp";
	</script>
</body>
</html>