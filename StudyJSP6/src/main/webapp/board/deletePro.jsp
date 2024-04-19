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
	<h1>deletePro.jsp</h1>
	<%
	//전달 정보 저장
	String pageNum = request.getParameter("pageNum");
	%>
	<!-- 자바빈 객체 생성 -->
	<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean" />

	<!-- 자바빈 객체에 전달된 파라메터를 저장 -->
	<jsp:setProperty property="*" name="bb" />

	<%
	// BoardDAO 객체 생성
	BoardDAO bdao = new BoardDAO();

	// 정보 삭제 메서드 호출
	int result = bdao.deleteBoard(bb);

	if (result == 1) {							// 삭제 완료
		%>
		<script type="text/javascript">
			alert('삭제 완료');
			location.href="list.jsp?pageNum=<%=pageNum %>";
		</script>
		<%
	} else if (result == 0) {					// 삭제 실패 - 비밀번호 오류
		%>
		<script type="text/javascript">
			alert('삭제 실패 - 비밀번호 오류');
			history.back();
		</script>
		<%
	} else {									// 삭제 실패 - 게시판 글 없음
		%>
		<script type="text/javascript">
			alert('삭제 실패 - 글 없음');
			history.back();
		</script>
		<%
	}
	%>
</body>
</html>