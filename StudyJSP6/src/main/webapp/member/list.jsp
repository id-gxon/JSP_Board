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
	<h1>list.jsp</h1>
	<%
	String id = (String)session.getAttribute("id");
		
	if (id == null || !id.equals("admin")) {
		response.sendRedirect("loginForm.jsp");
	}
	
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	Class.forName(DRIVER);
	
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	
	String sql = "SELECT * FROM itwill_member WHERE id != ?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	pstmt.setString(1, "admin");
	
	ResultSet rs = pstmt.executeQuery();
	%>
	<table border="1">
		<tr>
			<td>ID</td>
			<td>PASS</td>
			<td>NAME</td>
			<td>GENDER</td>
			<td>AGE</td>
			<td>EMAIL</td>
			<td>REGDATE</td>
		</tr>
	<%
	while (rs.next()) {
// 		if (rs.getString("id").equals("admin")){
// 			continue;
// 		}else {
	%>
		<tr>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("pass") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("gender") %></td>
			<td><%=rs.getInt("age") %></td>
			<td><%=rs.getString("email") %></td>
			<td><%=rs.getTimestamp("regdate") %></td>
		</tr>
	<%
// 		}
	}
	%>
	</table>
</body>
</html>