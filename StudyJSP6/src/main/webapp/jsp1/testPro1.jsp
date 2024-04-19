<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro1.jsp</h1>

	<!-- 이전 페이지(testForm1.jsp)에서 전달한 정보를 받아서 저장 -->
	<%
	// 폼 태그로 전달된(submit) 데이터를 파라메터라고 한다.
	// -> 주소줄 ? 뒤에 이름=값 형태의 데이터
	// http://localhost:8088/StudyJSP6/jsp1/testPro1.jsp?num=123

	// request.getParameter("num");
	%>

	전달된 정보(파라메터):
	<%=request.getParameter("num")%>
	<%=request.getParameter("name")%>
	
	
</body>
</html>