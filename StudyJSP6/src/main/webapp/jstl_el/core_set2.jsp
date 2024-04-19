<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core_set2</title>
</head>
<body>
	<!-- core_set1.jsp에서 전달한 정보 출력 -->
	model: ${model }<br>
	color: ${color }<br>
	
	price-req: ${requestScope.price }<br>
	price-ses: ${sessionScope.price }
	
	<h3>JSTL - 영역 객체 정보 제거</h3>
	<%
	// request.removeAttribute(name);
	%>
	<!-- 모든 영역의 정보를 삭제 -->
	<%-- <c:remove var="price" /> --%>
	
	<!-- session 영역에만 정보를 삭제 -->
	<c:remove var="price" scope="session"/>
	
	price-req: ${requestScope.price }<br>
	price-ses: ${sessionScope.price }<br>
	
	<hr>
	
	<!-- Servlet -->
	${person }<br>
	NAME: ${requestScope.person.name }<br>
	TELNUMBER: ${requestScope.person.phone.telNum }<br>
	MODELNAME: ${requestScope.person.phone.modelName }<br>
	
	<c:set var="p" value="${person.phone }" />
	TELNUMBER: ${p.telNum }<br>
	MODELNAME: ${p.modelName }<br>
	
	<hr>
	
	${requestScope.personList }<br>
	<c:set var="person" value="${requestScope.personList }" />
	<c:set var="phone" value="${person[0].phone }" />
	${person[0].name }<br>
	${phone.telNum }<br>
	${phone.modelName }
</body>
</html>