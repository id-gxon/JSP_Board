<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>writePro.jsp</h1>
	<%
	// 한글처리 인코딩
	request.setCharacterEncoding("UTF-8");
	%>
	<!-- BoardBean bb = new BoardBean(); -->
	<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean" />

	<jsp:setProperty property="*" name="bb" />

	toString: <%=bb.toString()%><hr>
	<%
	// 작성자의 IP 주소 가져오기
	System.out.println(request.getRemoteAddr());
	bb.setIp(request.getRemoteAddr());
	%>
	toString: <%=bb.toString()%><hr>

	<jsp:getProperty property="name" name="bb" />
	<jsp:getProperty property="pass" name="bb" />
	<jsp:getProperty property="subject" name="bb" />
	<jsp:getProperty property="content" name="bb" />
	
	<!-- 전달받은 정보를 DB에 저장 -->
	<%
	BoardDAO dao = new BoardDAO();
	
	dao.insertBoard(bb);
	
	// 페이지 이동
	response.sendRedirect("list.jsp");
	%>
	
</body>
</html>