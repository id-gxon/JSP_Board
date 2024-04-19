<%@page import="com.itwillbs.javabean.JavaBean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>beanPro2.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	%>
	ID: <%=id %><br>
	PASS: <%=pass %><br>
	NAME: <%=name %><br>
	AGE: <%=age %><hr>
	
	<%
	JavaBean2 bean1 = new JavaBean2();
	
	bean1.setId(id);
	bean1.setPass(pass);
	bean1.setName(name);
	bean1.setAge(age);
	%>
	ID: <%=bean1.getId() %><br>
	ID: <%=bean1.getPass() %><br>
	ID: <%=bean1.getName() %><br>
	ID: <%=bean1.getAge() %><hr>
	
	<jsp:useBean id="bean2" class="com.itwillbs.javabean.JavaBean2"/>
	
	<jsp:setProperty property="id" name="bean2" param="id"/>
	<jsp:setProperty property="pass" name="bean2" param="pass"/>
	<jsp:setProperty property="name" name="bean2" param="name"/>
	<!-- 전달받은 정수 데이터 자동으로 형변환 -->
	<jsp:setProperty property="age" name="bean2" param="age"/>
	
	<!-- 전달받는 파라메터명과 변수명이 같은 경우 param 생략 가능 -->
	<jsp:setProperty property="id" name="bean2"/>
	<jsp:setProperty property="pass" name="bean2"/>
	<jsp:setProperty property="name" name="bean2"/>
	<jsp:setProperty property="age" name="bean2"/>
	
	<!-- 전달받는 모든 파라메터를 각각의 변수에 저장 -->
	<jsp:setProperty property="*" name="bean2" param="*"/>
	
	<!-- 전달받는 파라메터명과 변수명이 모두 같은 경우 param 생략 가능 -->
	<jsp:setProperty property="*" name="bean2"/>
	
	ID: <jsp:getProperty property="id" name="bean2"/><br>
	PASS: <jsp:getProperty property="pass" name="bean2"/><br>
	NAME: <jsp:getProperty property="name" name="bean2"/><br>
	AGE: <jsp:getProperty property="age" name="bean2"/><hr>
</body>
</html>