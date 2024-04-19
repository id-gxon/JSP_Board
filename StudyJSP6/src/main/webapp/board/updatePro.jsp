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
	<h2>updatePro.jsp</h2>
	<%
	// 한글처리 인코딩
	request.setCharacterEncoding("UTF-8");

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

	// 정보 수정 메서드 호출
	int result = bdao.updateBoard(bb);

	if (result == 1) {							// 수정 완료
		%>
		<script type="text/javascript">
			alert('수정 완료');
			location.href="list.jsp?pageNum=<%=pageNum %>";
		</script>
		<%
	} else if (result == 0) {					// 수정 실패 - 비밀번호 오류
		%>
		<script type="text/javascript">
			alert('수정 실패 - 비밀번호 오류');
			history.back();
		</script>
		<%
	} else {									// 수정 실패 - 게시판 글 없음
		%>
		<script type="text/javascript">
			alert('수정 실패 - 글 없음');
			history.back();
		</script>
		<%
	}
	%>
</body>
</html>