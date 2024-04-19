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
	<h1>content.jsp</h1>
	<h2>글 내용(본문) 보기</h2>

	<%
	// 전달 정보 저장(bno, pageNum)
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");

	// DAO 객체 생성
	BoardDAO bdao = new BoardDAO();
	
	// 게시판 조회수 1 증가 method()
	boolean check = (boolean) session.getAttribute("readCountCheck");
	if (check) {
	// ** F5(새로고침) 동작 시 조회수 증가 x
	// 리스트 -> 본문으로 이동 시에만 증가 o
		bdao.updateReadcount(bno);
	}
	
	// 조회수 UPDATE 가능 여부를 체크하는 정보를 저장
	session.setAttribute("readCountCheck", false);
	
	// 글 정보 조회 method()
	BoardBean bb = bdao.getBoard(bno);
	%>

	<%=bb%>
	
	<table border="1">
		<tr>
			<td>글 번호</td>
			<td><%=bb.getBno() %></td>
			<td>조회수</td>
			<td><%=bb.getReadcount() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=bb.getName() %></td>
			<td>작성일</td>
			<td><%=bb.getDate() %></td>
		</tr>
		<tr>
			<td>제목</td>
			<td colspan="3"><%=bb.getSubject() %></td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td colspan="3"><%=bb.getFile() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td colspan="3"><%=bb.getContent() %></td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="button" value="수정하기" onclick="location.href='updateForm.jsp?bno=<%=bno %>&pageNum=<%=pageNum %>';">
				<input type="button" value="삭제하기" onclick="location.href='deleteForm.jsp?bno=<%=bno %>&pageNum=<%=pageNum %>';">
				<input type="button" value="답글쓰기" onclick="location.href='reWriteForm.jsp?bno=<%=bno %>&pageNum=<%=pageNum %>&re_ref=<%=bb.getRe_ref()%>&re_lev=<%=bb.getRe_lev() %>&re_seq=<%=bb.getRe_seq()%>';">
				<input type="button" value="목록이동" onclick="location.href='list.jsp?pageNum=<%=pageNum %>';">
			</td>
		</tr>
	</table>

</body>
</html>