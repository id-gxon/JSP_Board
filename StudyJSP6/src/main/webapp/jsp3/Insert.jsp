<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Insert.jsp</h1>
	<h2>JSP의 정보를 MySQL에 저장(CREATE)</h2>
	<%
	String name ="Choi";
	String gender ="남";
	int age = 28;
	String jumin ="000101-2828282";
	
	// 0. 드라이버 설치(라이브러리 설치) - 프로젝트당 1번만
	
	// DB 연결 정보 저장
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	
	
	// 1. 드라이버 로드
	Class.forName(DRIVER);
	System.out.println("드라이버 로드 성공");
	
	// 2. DB 연결
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	System.out.println("DB 연결 성공");
	System.out.println("con: " + con);
	
	// 3. SQL 작성하기 & stmt 객체
	// String sql = "INSERT INTO itwill_member VALUES(null, '" + name + "', '" + gender + "', '" + age + "', '" + jumin + "')";
	String sql = "INSERT INTO itwill_member(idx, name, gender, age, jumin) VALUES(null, ?, ?, ?, ?)";
	
	// SQL 구문을 실행하는 객체
	// Statement stmt = con.createStatement();
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 3-1. ? 채우기
	// pstnt.set[변수 타입](?의 위치, 값);
	// set메서드와 ?의 개수는 항상 같아야 함.
	pstmt.setString(1, name);
	pstmt.setString(2, gender);
	pstmt.setInt(3, age);
	pstmt.setString(4, jumin);
	
	
	// 4. SQl 실행하기
	// stmt.executeUpdate(sql);
	pstmt.executeUpdate();
	System.out.println("글 정보 저장 완료(CREATE)");
	%>
</body>
</html>