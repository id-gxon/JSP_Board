<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testForm1.jsp</h1>

	<h2>JSP 사용 정보 전달 - form 태그</h2>

	<fieldset>
		<!-- <form action="정보를 전달할 페이지/ 이동할 페이지" method="get/post 전달방식"> -->
		<!--  method="기본값:get" 생략 가능 -->
		<form action="testPro1.jsp" method="get">
			<!-- input 태그의 "이름"이 반드시 필요함. input 태그 이름 == 파라메터 이름 -->
			숫자: <input type="text" name="num"><br> 
			이름: <input type="text" name="name"><br>
			<input type="submit" value="전송">
		</form>
	</fieldset>
	
	<!-- 
		폼 태그 정보 전달 방식
			1) get 방식(get 메서드)
				- URL에 전달 데이터(파라메터)를 전송
				- URL 끝에[주소?이름=값&이름2=값2] 형태로 전달
				- 전달 데이터 크기 제한 256byte(주소줄에 전달하기 때문에)
				- 빠른 전송
			
			2) post 방식
				- URL에 전달 데이터 전송 X, body에 담아서 전송
				- 전달 데이터 크기 제한 없음(주소줄에 전달 X)
				- 보안적으로 우수
				- get 방식에 비해 느린 전송(body 생성시간 포함)
	 -->
</body>
</html>