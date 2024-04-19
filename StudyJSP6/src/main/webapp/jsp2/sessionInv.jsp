<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionInv.jsp</h1>
	
	<h2>서버(카페)</h2>
	
	<%
	// 요청 정보 처리
	
	// 세션 정보 초기화(회원 탈퇴)
	session.invalidate();
	
	// 요청에 대한 응답 처리
	%>
	<script type="text/javascript">
		alert("요청 처리 완료!(세션 초기화 완료!)");
		location.href="sessionTest.jsp";
	</script>
</body>
</html>