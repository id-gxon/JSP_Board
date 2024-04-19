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
	<h1>info.jsp</h1>
	<h2>회원 정보 출력(내 정보 보기)</h2>

	<%
	String id = (String) session.getAttribute("id");

	if (id == null) {
		response.sendRedirect("loginForm.jsp");
	}

	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";

	Class.forName(DRIVER);

	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);

	String sql = "SELECT * FROM itwill_member WHERE id = ?";
	PreparedStatement pstmt = con.prepareStatement(sql);

	pstmt.setString(1, id);

	ResultSet rs = pstmt.executeQuery();

	if (rs.next()) {
	%>
	<h4>아이디: <%=id %></h4>
	<h4>이름: <%=rs.getString("name") %></h4>
	<h4>성별: <%=rs.getString("gender") %></h4>
	<h4>나이: <%=rs.getInt("age") %></h4>
	<h4>이메일: <%=rs.getString("email") %></h4>
	<h4>회원가입일:<%=rs.getTimestamp("regdate") %></h4>
	<%
	}
	%>
	<h2>
		<a href="main.jsp">메인 페이지로 이동</a>
	</h2>
</body>
</html>