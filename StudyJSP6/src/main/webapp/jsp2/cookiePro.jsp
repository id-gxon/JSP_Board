<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookiePro.jsp</h1>

	<%
	// 쿠키값 생성 - 전달 받은 언어 설정 정보를 사용해서 쿠키값 생성
	Cookie cookie = new Cookie("lang", request.getParameter("language"));

	// 쿠키 설정값 변경(유효기간 설정 - 1시간)
	cookie.setMaxAge(3600);

	// 쿠키 정보를 클라이언트에게 전달
	response.addCookie(cookie);
	%>

	<!-- cookieForm.jsp 페이지로 이동(js)) -->
	<script type="text/javascript">
		alert("쿠키값 변경!!");
		location.href = 'cookieForm.jsp';
	</script>
</body>
</html>