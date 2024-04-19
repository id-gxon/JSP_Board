<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionMain.jsp</h1>
	<!-- 
	사용자의 정보(로그인을 했는지 안했는지 체크)
	로그인을 안한 경우 다시 로그인 페이지로 이동,
	로그인을 한 경우 사용자의 아이디를 출력
	 -->
	<%
	// 로그인 정보 받아오기(session)
	String userID = (String) session.getAttribute("loginID");

	if (userID == null) {
		response.sendRedirect("sessionLoginForm.jsp");
	}
	%>

	<h2><%=userID%>님 환영합니다!
	</h2>

	<!-- 로그아웃 기능 -->
	<input type="button" value="로그아웃"
		onclick="location.href='sessionLogout.jsp'">

</body>
</html>