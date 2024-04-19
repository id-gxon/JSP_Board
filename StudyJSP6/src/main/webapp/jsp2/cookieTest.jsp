<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieTest.jsp</h1>

	<h2>쿠키: 서버와 클라이언트의 상태를 유지하기 위해 사용</h2>
	- 클라이언트의 하드디스크에 파일 저장
	<br> - 이름, 값, 유효기간, 경로, 도메인...
	<br> 쿠키 객체 생성(서블릿 API)
	<br> Cookie cookie = new Cookie("쿠키이름", 쿠키값);
	<br> 쿠키 정보를 전달
	<br> -> 사용자의 응답 정보에 쿠키를 담아서 전달
	<br> response.addCookie(쿠키 객체);
	<br> -> 쿠키 데이터를 사용자의 HDD에 저장(유효기간 있음 but 유효기간이 지나도 실제 파일이 삭제되지 않음)
	<hr>

	<%
	// 서블릿 API를 사용하여 쿠키 객체를 처리

	//기존의 쿠키 정보를 가져오기(여러개)
	Cookie[] cookie = request.getCookies();

	// 여러 개의 쿠키 정보 중에서 내가 생성한 쿠키 정보 찾기
	if (cookie != null) {
		for (int i = 0; i < cookie.length; i++) {
			if (cookie[i].getName().equals("name")) {
				System.out.println("내가 만든 쿠키가 있음");
				System.out.println("값: " + cookie[i].getValue());
			}
		}
	}
	%>

	<input type="button" value="쿠키값 생성"
		onclick="location.href='cookieSet.jsp';">
	<input type="button" value="쿠키값 삭제"
		onclick="location.href='cookieDel.jsp';">

</body>
</html>