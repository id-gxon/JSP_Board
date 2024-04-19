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
	<h1>updateForm.jsp</h1>
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
	<fieldset>
		<legend>회원 정보 수정</legend>
		<form action="updatePro.jsp" method="post">
			ID: <input type="text" name="id" value=<%=id %> readonly="readonly"><br>
			PASSWORD: <input type="password" name="pass" placeholder="기존 비밀번호를 입력하세요."><br>
			NAME: <input type="text" name="name" value=<%=rs.getString("name") %>><br>
			GENDER: <input type="radio" name="gender" value="M"
			<%
			if (rs.getString("gender").equals("M")) {
			%> checked <%
			}
			%>>남
			<input type="radio" name="gender" value="W"
			<%
			if (rs.getString("gender").equals("W")) {
			%> checked <%
			}
			%>>여<br>
			AGE : <input type="number" name="age" value=<%=rs.getInt("age") %>><br>
			EMAIL: <input type="text" name="email" value=<%=rs.getString("email") %> readonly="readonly"><br>
			<input type="submit" value="회원 정보 수정">
		</form>
	</fieldset>
	<%
	}
	%>
</body>
</html>