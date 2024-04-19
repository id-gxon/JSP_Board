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
	<h1>update.jsp</h1>
	<h2>MySQL에 저장되어 있는 정보 수정(UPDATE)</h2>
	
	<!-- 나이가 10살이고 주민번호가 000101-1111111인 사람의 이름을 '수정된 이름'으로 변경 -->
	<%
	String name = "수정된 이름";
	int age = 10;
	String jumin = "000101-1111111";
	
	// DB 연결 정보
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	// 1. 드라이버 로드
	Class.forName(DRIVER);
	
	// 2. DB 연결
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	
	// 3. SQL 구문 & pstmt 객체
	String sql = "UPDATE itwill_member SET name=? WHERE age=? AND jumin=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 3-1
	pstmt.setString(1, name);
	pstmt.setInt(2, age);
	pstmt.setString(3, jumin);
	
	// 4. SQL 구문의 실행
	pstmt.executeUpdate();
	%>
</body>
</html>