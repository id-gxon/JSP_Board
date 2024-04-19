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
	<h1>delete.jsp</h1>
	<h2>MySQL에 저장되어 있는 회원정보 삭제</h2>
	<%
	int idx = 1;
	String jumin = "000101-1111111";
	
	// DB 정보
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
		
	// 1. 드라이버 로드
	Class.forName(DRIVER);
	
	// 2. DB 연결
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	
	// 3. SQL 구문 & pstmt 객체
	// idx = 1이고 주민번호가 000101-1111111인 사람의 정보 삭제
	String sql = "DELETE FROM itwill_member WHERE idx=? AND jumin=?";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 3.1
	pstmt.setInt(1, idx);
	pstmt.setString(2, jumin);
	
	// 4. SQL 구문 실행
	pstmt.executeUpdate();
	%>
</body>
</html>