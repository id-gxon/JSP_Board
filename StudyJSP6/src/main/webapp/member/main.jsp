<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>main.jsp</h1>
	<h2>메인 페이지</h2>
	<%
	String id = (String)session.getAttribute("id");
	
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}else{
		%>
<!-- 		<script type="text/javascript"> -->
<%-- 			alert('환영합니다. <%=id %>님'); --%>
<!-- 		</script> -->
		<%
	}
	%>
	<h2><%=id %>님 환영합니다.</h2>
	<input type="button" value="로그아웃" onclick="location.href='logoutPro.jsp'">
	
	<hr>
	
	<h3><a href="info.jsp">회원 정보 조회(info)</a></h3>
	<h3><a href="updateForm.jsp">회원 정보 수정(update)</a></h3>
	<h3><a href="deleteForm.jsp">회원 정보 삭제(delete)</a></h3>
	<%
	// JSP = jsp(Java) + HTML/CSS + JavaScript
	// > 코드 실행 순서 jsp > HTML > JavaScript
	if (id != null && id.equals("admin")) {
	%>
		<h3><a href="list.jsp">회원 정보 목록(list)</a></h3>
	<%
	}
	%>
	
</body>
</html>