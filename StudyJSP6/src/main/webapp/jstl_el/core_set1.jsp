<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core_set1</title>
</head>
<body>
	<%
	// JSP 코드로 작성 시 해당 페이지에서만 사용 가능(단점)
	
	int num1 = 10;
	int num2 = 20;
	int sum = num1 + num2;
	%>

	SUM: <%=sum%>

	<hr>
	
	<!-- JSTL 사용 변수 선언(=영역 객체에 저장되는 정보(속성)를 생성) -->
	<%-- <c:set var="변수명" value="변수값" /> --%>
	<!-- EL 표현식을 사용해서 정보를 사용 -->
	<c:set var="num3" value="100" scope="page"/>
	<c:set var="num4" value="200" />
	<c:set var="sum2" value="${num3 + num4 }" />
	
	SUM2: <c:out value="${sum2 }" />

	${sum2 }
	
	<hr>
	
	${pageScope }
	
	<hr>
	
	<h3>다른 영역에 정보를 저장</h3>
	<%
	// request.setAttribute("model", "S24");
	%>
	<c:set var="model" value="S24" scope="request" />
	<c:set var="color" value="RED" scope="request" />
	<c:set var="price" value="100" scope="request" />
	<c:set var="price" value="100" scope="session" />
	
	<!-- core_set2.jsp에 정보 전달 & 이동(forward) -->
	<!-- core_set2.jsp에서 model 정보 출력 -->
	
	<jsp:forward page="core_set2.jsp"></jsp:forward>
</body>
</html>