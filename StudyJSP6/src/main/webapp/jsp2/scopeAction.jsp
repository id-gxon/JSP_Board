<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopeAction.jsp</h1>
	<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	%>
	아이디:
	<%=id%><hr>
	비밀번호:
	<%=pw%><hr>

	<h2>영역객체(Scope) 사용</h2>
	page 영역 - pageContext 객체의 공유 데이터(Attribute):
	<%=pageContext.getAttribute("p")%><hr>
	request 영역 - request 객체의 공유 데이터(Attribute):
	<%=request.getAttribute("r")%><hr>
	session 영역 - session 객체의 공유 데이터(Attribute):
	<%=session.getAttribute("s")%><hr>
	application 영역 - application 객체의 공유 데이터(Attribute):
	<%=application.getAttribute("a")%><hr>
</body>
</html>