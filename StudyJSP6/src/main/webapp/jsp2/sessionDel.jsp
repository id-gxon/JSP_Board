<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionDel.jsp</h1>
	
	<h2>서버(카페)</h2>
	
	<%
	// 사용자 요청 처리
	
	// 세션 정보 삭제(쿠폰 사용)
	session.removeAttribute("userName");
	session.removeAttribute("coupon");
	
	// 응답 정보를 생성 전달
	%>
	<script type="text/javascript">
		alert("요청 처리 완료(세션 정보 삭제)");
		location.href="sessionTest.jsp";
	</script>
	
</body>
</html>