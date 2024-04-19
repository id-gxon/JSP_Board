<%@page import="javax.script.ScriptContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionLoginPro.jsp</h1>

	<%
	// 한글 처리(폼 태그를 POST 방식으로 전송)
	request.setCharacterEncoding("UTF-8");

	// 사용자가 전달해 준 ID/PW 저장
	String userID = request.getParameter("id");
	String userPW = request.getParameter("pw");

	// 정보 확인(출력)
	System.out.println(userID + "//" + userPW);

	// ID, PW를 비교(기존의 회원 정보와 비교)
	String DBID = "itwill";
	String DBPW = "1234";

	if (userID.equals(DBID)) {
		System.out.println("아이디 같음");
		if (userPW.equals(DBPW)) {
			System.out.println("(아이디 같음)비밀번호 같음 - 로그인 성공");
			// 로그인ID를 세션 영역에 저장
			session.setAttribute("loginID", userID);
			session.setMaxInactiveInterval(3600); // 3600sec = 1hour(second 단위)

			// 메인 페이지 이동
			response.sendRedirect("sessionMain.jsp");
		} else {
			System.out.println("(아이디 같음)비밀번호 다름");

// 			out.println("<script>");
// 			out.println("alert('ID와 PASSWORD를 확인해주세요!');");
// 			out.println("</script>");

			response.sendRedirect("sessionMain.jsp");
		}
	} else {
		System.out.println("아이디 다름 - 비회원");
		
// 		out.println("<script>");
// 		out.println("alert('ID와 PASSWORD를 확인해주세요!'");
// 		out.println("</script>");
		
		response.sendRedirect("sessionMain.jsp");
	}
	%>

</body>
</html>