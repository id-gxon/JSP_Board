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
	<h1>deleteForm.jsp</h1>
	<%
	//전달 정보 저장
	int bno = Integer.parseInt(request.getParameter("bno"));
	String pageNum = request.getParameter("pageNum");

	// BoardDAO 객체 생성
	BoardDAO bdao = new BoardDAO();

	// 수정할 글 정보 가져오기
	BoardBean bb = bdao.getBoard(bno);

	// 해당 폼 태그에 출력
	%>
	<script type="text/javascript">
		// 자바스크립트 코드 실행 영역 => 데이터 유효성 체크
		function check(){
			var pass = document.fr.pass.value;
			if (pass == ""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}			
		}
	</script>
	
	<fieldset>
		<form action="deletePro.jsp?pageNum=<%=pageNum %>" method="post" name="fr" onsubmit="return check();">
			<input type="hidden" name="bno" value="<%=bb.getBno() %>">
			<%-- <input type="hidden" name="pageNum" value="<%=pageNum %>"> --%>
			작성자: <input type="text" name="name" value="<%=bb.getName() %>" readonly="readonly"><br>
			비밀번호: <input type="password" name="pass" placeholder="비밀번호를 입력하세요."><br>
			제목: <input type="text" name="subject" value="<%=bb.getSubject() %>" readonly="readonly"><br>
			내용: <textarea rows="5" cols="20" name="content" readonly="readonly"><%=bb.getContent() %></textarea><hr>
			<input type="submit" value="글 삭제하기">
		</form>
	</fieldset>
</body>
</html>