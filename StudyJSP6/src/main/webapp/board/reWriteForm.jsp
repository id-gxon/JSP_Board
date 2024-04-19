<%@page import="com.itwillbs.board.BoardBean"%>
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
	<h1>reWriteForm.jsp</h1>
	<h2>답글쓰기</h2>
	<%
	//전달 정보 저장
	String pageNum = request.getParameter("pageNum");
	%>
	<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean" />
	<jsp:setProperty property="*" name="bb" />

	<fieldset>
		<form action="reWritePro.jsp?pageNum=<%=pageNum %>" method="post">
			<input type="hidden" name="bno" value="<%=bb.getBno() %>">
			<input type="hidden" name="re_ref" value="<%=bb.getRe_ref() %>">
			<input type="hidden" name="re_lev" value="<%=bb.getRe_lev() %>">
			<input type="hidden" name="re_seq" value="<%=bb.getRe_seq() %>">
			작성자: <input type="text" name="name"><br>
			비밀번호: <input type="password" name="pass"><br>
			제목: <input type="text" name="subject" value="[답글]"><br>
			내용: <textarea rows="5" cols="20" name="content"></textarea><hr>
			<input type="submit" value="답글쓰기">
		</form>
	</fieldset>
</body>
</html>