<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt_number</title>
</head>
<body>
	HTML: ${10000000 }<br>
	fmt: <fmt:formatNumber value="10000000" /><br>
	fmt: <fmt:formatNumber value="10000000" groupingUsed="true" /><br>
	fmt: <fmt:formatNumber value="10000000" groupingUsed="false" /><br>
	<!-- 가격을 출력할 때 사용 -->
	
	<hr>
	
	3.141592를 소수점 2번 째 자리까지 표현<br>
	<fmt:formatNumber value="${3.141592 }" pattern="#.##" /><br>
	<fmt:formatNumber value="${3.141592 }" pattern="#.####" /><br>
	<!-- #을 사용하여 소수점 자리수를 표현 가능(반올림) -->
	
	<hr>
	
	10.5를 소수점 2번 째 자리까지 표현<br>
	<fmt:formatNumber value="${10.5 }" pattern="##.00" /><br>
	<fmt:formatNumber value="${10.5 }" pattern="##.0000" /><br>
	<!-- 빈 공간을 추가할 때는 0을 사용하여 처리 -->
	
	<hr>
	
	<fmt:formatNumber value="100000000" type="currency" /><br>
	<fmt:formatNumber value="100000000" type="currency" currencySymbol="@@" /><br>
	<fmt:formatNumber value="0.5" type="percent" /><br>
	<fmt:formatNumber value="${6/17 }" type="percent" /><br>
	<!-- 숫자 데이터를 퍼센트 형태로 자동 전환 -->
</body>
</html>