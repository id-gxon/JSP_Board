<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core_if</title>
</head>
<body>
	<h2>JSTL을 사용해서 if문 처리</h2>

	<c:set var="test" value="ITWILL" />

	<%-- <c:if test="조건문(EL 표현식)">
		조건문이 참일 때의 실행코드
	</c:if> --%>

	<%-- <c:if test="${test == 'ITWILL' }"> --%>
	<c:if test="${test.equals('ITWILL') }"> <!-- 권장사항 -->
		<h2>아이티윌 정보가 있음.</h2>
	</c:if>

	<hr>

	<fieldset>
		<form action="">
			숫자1: <input type="text" name="number1"><br>
			숫자2: <input type="text" name="number2"><br>
			<input type="submit" value="계산하기">
		</form>
	</fieldset>
	
	<h2>입력된 숫자의 크기 비교</h2>
	num1: ${param.number1 }<br>
	num2: ${param.number2 }<br>
	
	
	<c:if test="${not empty param.number1 and not empty param.number2 }">
		<%-- EL 표현식에서는 전달된 파라메터 데이터를 문자 형태로 비교 --%>
		<c:set var="num1" value="${Integer.parseInt(param.number1) }" />
		<c:set var="num2" value="${Integer.parseInt(param.number2) }" />
	
		large: ${num1 > num2 ? num1 : num2 }<br>
		
		<c:if test="${num1 > num2 }">
			large: ${num1 }<br>
		</c:if>
		
		<c:if test="${num1 < num2 }">
			large: ${num2 }<br>
		</c:if>
	
		<c:if test="${num1.equals(num2) }">
			동일<br>
		</c:if>
	</c:if>
	
	<hr>
	
	<h2>choose문(switch-case)</h2>
<%-- 	<c:choose> --%>
<%-- 		<c:when test="조건 비교"></c:when> --%>
<%-- 		<c:when test="조건 비교"></c:when> --%>
<%-- 		<c:when test="조건 비교"></c:when> --%>
<!-- 		... -->
<%-- 		<c:otherwise> --%>
<!-- 			그 외 나머지 -->
<%-- 		</c:otherwise> --%>
<%-- 	</c:choose> --%>
	<c:if test="${not empty param.number1 and not empty param.number2 }">
		<c:set var="num1" value="${Integer.parseInt(param.number1) }" />
		<c:set var="num2" value="${Integer.parseInt(param.number2) }" />
		<c:choose>
			<c:when test="${num1 > num2 }">${num1 }<br></c:when>
			<c:when test="${num1 < num2 }">${num2 }<br></c:when>
			<c:otherwise>
					동일<br>
			</c:otherwise>
		</c:choose>
	</c:if>
</body>
</html>