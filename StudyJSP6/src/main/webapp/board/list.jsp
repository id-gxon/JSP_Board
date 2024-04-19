<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
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
	<h1>list.jsp</h1>
	<h2>게시판 목록</h2>



	<h2>
		<a href="writeForm.jsp">글 작성</a>
		<a href="fileWriteForm.jsp">글 작성(첨부파일)</a>
	</h2>

	<%
	// 조회수 UPDATE 가능 여부를 체크하는 정보를 저장
	session.setAttribute("readCountCheck", true);
	
	// DB 처리 객체
	BoardDAO bdao = new BoardDAO();

	// 전체 글의 개수 조회
	int count = bdao.getBoardCount();

	/* 페이징 처리 1 */

	// 원하는 만큼의 게시판 글을 가져와서 출력

	// 한 페이지에서 보여줄 글의 개수 설정
	int pageSize = 10;

	// 페이지의 정보를 가져오기
	String pageNum = request.getParameter("pageNum");

	// 페이지 정보가 없을 때 기본값 설정(1Page)
	if (pageNum == null) {
		pageNum = "1";
	}

	// 시작행 구하기
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;

	// 끝행 구하기
	int endRow = currentPage * pageSize;

	// SQL 구문: limit 시작위치(startRow - 1), 개수(pageSize) 추가 사용

	/* 페이징 처리 1 */

	if (count != 0) {
		// 모든 글의 정보를 조회 - DAO 메서드 생성
		System.out.println("글 정보 있음");

		ArrayList boardList = bdao.getBoardList(startRow, pageSize);
		// System.out.println(boardList.size());
		// System.out.println(boardList);
	%>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
			<td>IP</td>
		</tr>
		<%
		for (int i = 0; i < boardList.size(); i++) {
			BoardBean bb = (BoardBean) boardList.get(i);
		%>
		<tr>
			<td><%=bb.getBno()%></td>
			<td>
				<%
				if(bb.getRe_lev() > 0){
					%>
					<img src="image/level.gif" width="<%=bb.getRe_lev() * 10 %>">
					<img src="image/re.gif">
					<%
				}
				%>
				<a href="content.jsp?bno=<%=bb.getBno() %>&pageNum=<%=pageNum %>"><%=bb.getSubject()%></a>
			</td>
			<td><%=bb.getName()%></td>
			<td><%=bb.getDate()%></td>
			<td><%=bb.getReadcount()%></td>
			<td><%=bb.getIp()%></td>
		</tr>
		<%
		}
	}
	%>
	</table>
	<%
	
	if (count != 0) {
		/* 페이징 처리 2 */
		// 전체 페이지 수 계산
		// int pageCount = (int) Math.ceil((double) count / pageSize);
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);

		// 한 화면에서 보여줄 페이지 블럭 수
		int pageBlock = 10;
		
		// 페이지 블럭의 시작 페이지 번호
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		
		// 페이지 블럭의 마지막 페이지 번호
		int endPage = startPage + pageBlock - 1;
		
		// 페이지의 글이 적은 경우
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		// [이전]
		if (startPage != 1) { // (startPage > paeBlock)
		%>
		<a href = "list.jsp?pageNum=<%=startPage - 1 %>">[이전]</a> <!-- startPage - pageBlock -->
		<%
		}
		
		// 페이징
		for (int i = startPage; i <= endPage; i++) {
			%>
			<a href = "list.jsp?pageNum=<%=i %>">[<%=i %>]</a>
			<%
		}
		
		// [다음]
		if (endPage < pageCount) {
		%>
		<a href = "list.jsp?pageNum=<%=endPage + 1 %>">[다음]</a> <!-- startPage + pageBlock -->
		<%
		}
		/* 페이징 처리 2 */
	}
	%>
</body>
</html>