<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieDel.jsp</h1>
	
	<h2>쿠키 정보 삭제(서버/카페)</h2>
	
	<%
	// 쿠키 정보 삭제 -> 쿠키의 유효기간을 재설정(줄이기)
	
	// 기존의 쿠키정보를 가져오기
	Cookie[] cookie = request.getCookies();
	
	// 쿠키 중에서 필요한 쿠키 정보를 찾기
	if(cookie != null){
		for(int i = 0; i < cookie.length; i++){
			if(cookie[i].getName().equals("name")){
				// 내가 생성한 쿠키 정보를 찾음
				// 쿠키 정보를 삭제
				cookie[i].setMaxAge(0);
				// 클라이언트의 정보를 수정
				response.addCookie(cookie[i]);
			}
		}
	}
	
	%>
	
	<script type="text/javascript">
		alert("쿠키 정보 삭제 완료!");
		location.href="cookieTest.jsp";
	</script>
	
	
	
	
	
</body>
</html>