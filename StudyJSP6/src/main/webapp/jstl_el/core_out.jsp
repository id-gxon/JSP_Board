<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL-core 사용 준비(필수) -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core_out</title>
</head>
<body>
	안녕하세요.<br>
	
	<c:out value="안녕하세요."/><br>
	
	<%="안녕하세요." %><br>
	
	${"안녕하세요." }<br>
	
	<hr>
	
	10 + 20 = 30<br>
	
	<c:out value="10 + 20 = 30"/><br><!-- 작성된 코드 그대로 표현 -->
	
	<c:out value="${10 + 20 }"/><br><!-- EL 표현식을 사용하여 연산을 처리 -->
	
	<c:out value="<%=10 + 20 %>"/><br><!-- JSP 표현식을 사용하여 연산을 처리 -->
	
	<hr>
	
	<c:out value="${member.name }"/><!-- EL 표현식의 데이터가 null일 경우 공백문자 ""로 출력 -->
	<c:out value="${member.name }" default="NULL값 대신해서 출력 가능 값"/>
	
	<hr>
	
	&lt;abc&gt;태그는 abc로 생성된 태그입니다.<br>
	
	<![CDATA[
	<abc>태그는 abc로 생성된 태그입니다.<br>
	]]><br>
	
	<c:out value="<abc>태그는 abc로 생성된 태그입니다.<br>"/>
	
	${price }
</body>
</html>