<%@page import="com.itwillbs.javabean.JavaBean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>beanPro1.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	%>
	ID: <%=id %><br>

	<h2>자바빈 객체 사용</h2>
	<%
	// 전달된 정보를 자바빈 객체에 저장, 출력

	// 자바빈 객체 생성
	JavaBean1 bean1 = new JavaBean1();

	// 객체에 정보 저장
	bean1.setId(request.getParameter("id"));
	%>
	ID: <%=bean1.getId() %><br>
	
	<h2>자바빈 객체 사용(JSP-액션 태그)</h2>
	<!-- HTML에서 작성 -->
	<!-- 자바빈 객체 생성 -->
	<jsp:useBean id="bean2" class="com.itwillbs.javabean.JavaBean1"/>
	
	<!-- 객체에 정보 저장 -->
	<jsp:setProperty property="id" name="bean2" param="id"/>
	
	<!-- 객체 정보 출력 -->
	ID: <jsp:getProperty property="id" name="bean2"/>
</body>
</html>