<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<h1>deletePro.jsp</h1>
	<%
	String id = (String) session.getAttribute("id");
	if (id == null) {
		response.sendRedirect("loginForm.jsp");
	}

	// 한글 처리(인코딩 설정)
	request.setCharacterEncoding("UTF-8");

	// 전달한 정보(폼 태그 정보 - 파라메터) 저장
	String pass = request.getParameter("pass");

	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";

	Class.forName(DRIVER);

	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);

	String sql = "SELECT pass FROM itwill_member WHERE id=?"; // 계정 존재 여부 확인
	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
		if (pass.equals(rs.getString("pass"))) {
			sql = "DELETE FROM itwill_member WHERE id=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, id);

			pstmt.executeUpdate();
			session.invalidate();

			response.sendRedirect("loginForm.jsp");
		} else {
	%>
	<script type="text/javascript">
				alert("비밀번호를 확인하세요.");
				history.back();
			</script>
	<%
		}
	}else {
		%>
	<script type="text/javascript">
			alert("관리자에게 문의해주세요.");
			history.back();
		</script>
	<%
	}
	%>
</body>
</html>