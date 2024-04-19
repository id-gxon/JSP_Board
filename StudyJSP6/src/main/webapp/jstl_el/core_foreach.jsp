<%@page import="com.itwillbs.servlet.Person"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>core_foreach</title>
</head>
<body>
	<%
	for (int i = 1; i <= 10; i++) {
	%>
		<%=i%>
	<%
	}
	%>
	
	<hr>
	
	<h2>JSTL-foreach문</h2>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }
	</c:forEach>
	
	<hr>
	
	<%
	Vector personList = (Vector) request.getAttribute("personList");
	
	for(int i = 0; i < personList.size(); i++){
		Person p = (Person) personList.get(i);
	%>
		<%=p.getName() %><br>
	<%
	}
	
	for(Object p : personList){
		Person pp = (Person) p;
	%>
		<%=pp.getName() %><br>
	<%
	}
	
	%>
	<%=personList %><br>
	
	<hr>
	
	<!-- EL 코드 사용 -->
	${personList }<br>
	${personList[0].name }<br>
	
	<hr>
	
	<!-- JSTL 코드 사용 -->
	<!-- var="변수명" items="반복할 대상(리스트, 배열)" -->
	<c:forEach var="p" items="${personList }">
		${p }<br>
		${p.name }<br>
	</c:forEach>
	
	<hr>
	
	<c:forTokens var="tmp" items="a, b, c, d, e, f, g" delims=",">
		${tmp }
	</c:forTokens>
	
	<hr>
	
	<c:forTokens var="tmp" items="ab c def g" delims=" ">
		${tmp }
	</c:forTokens>
</body>
</html>