<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fmt_date</title>
</head>
<body>
	<c:set var="today" value="<%=new Date() %>" />
	today: ${today }
	
	<hr>
	
	<h2>날짜 정보 출력</h2>
	
	<!-- 기본적인 날짜 정보 출력 -->
	<fmt:formatDate value="${today }" type="date" /><!-- default type = date --><br>
	<!-- 기본적인 시간 정보 출력 -->
	<fmt:formatDate value="${today }" type="time" /><br>
	<!-- 날짜, 시간 모두 출력 -->	
	<fmt:formatDate value="${today }" type="both" /><br>
	
	<h3>날짜 정보 출력</h3>
	<fmt:formatDate value="${today }" type="date" dateStyle="full" /><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="long" /><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="medium" /><br>
	<fmt:formatDate value="${today }" type="date" dateStyle="short" /><br>
	
	<h3>시간 정보 출력</h3>
	<fmt:formatDate value="${today }" type="time" timeStyle="full" /><br>
	<fmt:formatDate value="${today }" type="time" timeStyle="long" /><br>
	<fmt:formatDate value="${today }" type="time" timeStyle="medium" /><br>
	<fmt:formatDate value="${today }" type="time" timeStyle="short" /><br>
	
	2024년 1월 2일 오후 5: 16<br>
	-> fmt 사용 출력: <fmt:formatDate value="${today }" type="both" dateStyle="long" timeStyle="short" />
	
	<hr>
	
	2024/1/2 (오후)5:16:00<br>
	-> fmt 사용 출력: <fmt:formatDate value="${today }" type="date" pattern="yyyy/MM/dd" />
	<fmt:formatDate value="${today }" type="time" pattern="(a) hh:mm:ss" /><br>
	
	-> fmt 사용 출력: <fmt:formatDate value="${today }" type="date" pattern="yyyy/M/d" />
	<fmt:formatDate value="${today }" type="time" pattern="[a] hh:mm:ss" /><br>
</body>
</html>