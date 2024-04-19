<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>loginPro.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8"); // 한글 처리

	// 전달 정보 저장(파라메터 - id, pass)
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");

	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";

	// 전달 정보가 DB에 있는지 체크
	Class.forName(DRIVER); // 드라이버 로드

	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW); // DB 연결

	String sql = "SELECT pass FROM itwill_member WHERE id=?"; // SQL 구문 작성
	PreparedStatement pstmt = con.prepareStatement(sql); // pstmt 객체

	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery(); // SQL 실행

	if (rs.next()) {
		if (pass.equals(rs.getString("pass"))) {
			session.setAttribute("id", id);
			response.sendRedirect("main.jsp");
		} else {
	%>
			<script type="text/javascript">
				alert('아이디나 비밀번호를 확인하세요.');
				history.back();
			</script>
	<%
		}
	} else {
	%>
		<script type="text/javascript">
			var result = confirm('회원 정보가 없습니다. 회원가입 페이지로 이동하시겠습니까?');
			if (result) {
				location.href='insertForm.jsp';
			} else {
				history.back();
			}
		</script>
	<%
	}
	%>
</body>
</html>