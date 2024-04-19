<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieSet.jsp</h1>
	
	<h2>서버(카페)</h2>
	
	<%
	// 사용자의 요청을 처리(커피 만들기)
	System.out.println("사용자 요청 처리 중");
	
	// 쿠키 정보 생성(사용자 쿠폰 생성)
	Cookie cookie = new Cookie("name", "ITWILL");
	
	// 쿠키 설정
	cookie.setMaxAge(600); // 600sec == 10min
	
	// 처리 응답 + 쿠키(사용자의 HDD로 전달)
	response.addCookie(cookie);
	%>
	
	<script type="text/javascript">
		alert("쿠키값 생성!!");
		location.href='cookieTest.jsp';
	</script>
	
</body>
</html>