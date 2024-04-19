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
	<h1>reWritePro.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");

	// 전달 정보 저장
	String pageNum = request.getParameter("pageNum");
	%>

	<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean" />
	<jsp:setProperty property="*" name="bb" />

	<%
	// ip
	bb.setIp(request.getRemoteAddr());

	// BoardDAO 객체 생성
	BoardDAO bdao = new BoardDAO();

	// 답글쓰기 처리 method()
	bdao.reInsertBoard(bb);

	// 페이지 이동
	response.sendRedirect("list.jsp?pageNum=" + pageNum);
	%>

</body>
</html>