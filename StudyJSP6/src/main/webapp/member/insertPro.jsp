<%@page import="java.sql.Timestamp"%>
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
	<h1>insertPro.jsp</h1>
	<%
	// 한글 처리(인코딩 설정)
	request.setCharacterEncoding("UTF-8");
	
	// 전달한 정보(폼 태그 정보 - 파라메터) 저장
	// id, pass, name, gender, age, email
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	int age = Integer.parseInt(request.getParameter("age"));
	String email = request.getParameter("email");
	Timestamp regdate = new Timestamp(System.currentTimeMillis());
	%>

	ID: <%=id%><br>
	PASSWORD: <%=pass%><br>
	NAME: <%=name%><br>
	GENDER: <%=gender%><br>
	AGE: <%=age%><br>
	EMAIL: <%=email%><br>
	REGDATE: <%=regdate %>
	<hr>

	<%
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";

	Class.forName(DRIVER); // 드라이버 로드
	System.out.println("드라이버 로드 성공");

	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW); // DB 연결
	System.out.println("DB 연결 성공");

	String sql = "INSERT INTO itwill_member VALUES(?, ?, ?, ?, ?, ?, ?)"; // SQL 구문 작성(INSERT)
	PreparedStatement pstmt = con.prepareStatement(sql); // pstmt 객체

	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setInt(5, age);
	pstmt.setString(6, email);
	pstmt.setTimestamp(7, regdate);

	pstmt.executeUpdate(); // SQL 실행
	System.out.println("INSERT seccessful");
	
	// 페이지 이동
	response.sendRedirect("loginForm.jsp");
	%>
</body>
</html>