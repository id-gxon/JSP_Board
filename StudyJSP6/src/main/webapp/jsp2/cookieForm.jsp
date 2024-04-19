<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>cookieForm.jsp</h1>

	<!-- 
	메세지 출력
	"안녕! 쿠키 연습! / "HELLO! COOKIE TEST!"
	
	쿠키를 사용해서 언어의 정보를 저장
	 -->
	 
	 <%
	 // 쿠키에 저장된 언어 설정에 따른 출력 메세지 변경
	 
	 // 쿠키 정보 확인
	 Cookie[] cookie = request.getCookies();
	 
	 // 언어 설정값(내가 생성한 쿠키 정보)을 찾기
	 if(cookie != null){
		 for(int i = 0; i < cookie.length; i++){
			 if(cookie[i].getName().equals("lang")){
				 // 출력 메세지
				 if(cookie[i].getValue().equals("kor")){
					 out.println("안녕! 쿠키 연습!");
				 }else{
					 out.println("HELLO! COOKIE TEST!");
				 }				 
			 }
		 }
	 }
	 %>
	 

	<form action="cookiePro.jsp" method="post">
		<input type="radio" name="language" value="kor">한국어
		<input type="radio" name="language" value="eng">English
		
		<input type="submit" value="언어 설정">
	</form>
</body>
</html>