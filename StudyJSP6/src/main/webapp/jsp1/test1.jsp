<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>Test1.jsp</h1>
	실행: Ctrl + F11
	<br> JSP => HTML + Java
	<br> 주석문: 비실행문(설명, 테스트)
	<br>
	<!--  HTML 주석문(Ctrl + Shift + /, \) -->
	<%
	//Java 주석문1
	/* Java 주석문2 */
	%>
	<script type="text/javascript">
		//JavaScript 주석문1
		/* JavaScript 주석문2 */
	</script>
	<%-- JSP 주석문 --%>
	<%
	System.out.println("안녕하세요!"); // console 출력
	// Ctrl + Alt + 방향키 아래: 코드라인 복사
	out.println("안녕하세요!!"); // HTML 출력
	%>
	안녕하세요!!!
	<br>

	<%
	// 이름을 저장하는 변수를 사용해서 이름을 저장하고 화면에 출력하는 콛를 작성
	String name = "Kim";
	out.println("name: " + name);
	
	// 데이터 타입
	// -기본형(8)
	// boolean(1), char(2), byte(1), short(4), int(4), long(8), float(4), double(8)
	//
	//
	// -참조형(8개를 제외한 나머지)
	%>

</body>
</html>