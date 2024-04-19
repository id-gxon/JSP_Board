<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>paramPro1</title>
</head>
<body>
	<h2>기존 표현식 사용</h2>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	int age = Integer.parseInt(request.getParameter("age"));
	// String foods1 = request.getParameter("foods");
	// String foods2 = request.getParameter("foods");
	String[] foods = request.getParameterValues("foods");
	%>
	
	전달된 이름: <%=name %><br>
	전달된 아이디: <%=id %><br>
	전달된 나이: <%=age %><br>
	전달된 음식1: <%=foods[0] %><br>
	전달된 음식2: <%=foods[1] %>
	
	<hr>
	
	<h3>for-each문</h3>
	<%
	for(String f : foods){
		%>
		전달된 음식: <%=f %><br>
		<%
	}
	%>
	
	<hr>
	
	<h2>EL 표현식 사용</h2>
	전달된 이름: ${name } (EL 표현식에서 값이 null인 경우 공백으로 출력)
	
	<hr>
	
	전달된 이름: ${param.name }<br>
	전달된 아이디: ${param.id }<br>
	전달된 나이: ${param.age } (자동으로 형변환)<br>
	전달된 나이: ${param.age + 100 }<br>
	전달된 좋아하는 음식1: ${paramValues.foods[0] }<br>
	전달된 좋아하는 음식2: ${paramValues.foods[1] }
	
	<hr>
	
</body>
</html>