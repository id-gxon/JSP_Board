<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attrbute</title>
</head>
<body>
	<%
	// JSP 스크립틀릿
	int cnt = 1000;
	
	int cnt2 = (Integer) request.getAttribute("cnt");
	
	session.setAttribute("scnt", 3000);
	%>
	
	cnt(JSP): <%=cnt %> (변수)<br>
	cnt(JSP): <%=request.getAttribute("cnt") %> (속성)<br>
	cnt(JSP): <%=cnt2 %> (속성)<br>
	cnt(EL): ${cnt } (속성)<br>
	scnt(EL-request): ${requestScope.scnt }<br>
	scnt(EL-session): ${sessionScope.scnt }<br>
	
	<h3>참조 영역 객체는 범위가 존재한다.</h3>
	<h4>page -> request -> session -> application</h4>
	
	EL 표현식으로 정보(속성)를 출력할 때는 참조 영역의 범위가 작은 곳에서 큰 곳 순서로 검색
	-> 영역의 범위가 작은 곳에서 데이터가 발견되면 먼저 사용
</body>
</html>