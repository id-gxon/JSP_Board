<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>DBConnectTest.jsp</h1>
	
	<h2>MySQL DB와 JSP 코드를 연결</h2>
	
	<%
	/*
	MySQL에서 SQL 구문 실행하는 방법
	1) MySQL 프로그램 실행
	2) 데이터베이스 접속(로그인)
	3) SQL 구문 작성
	4) SQL 구문 실행
	*/
	
	// https://dev.mysql.com/doc/connector-j/en/connector-j-reference.html
	// JSP에서 SQL 구문 실행하는 방법
	// 0. mysql-connector-j-8.0.33.jar 파일(라이브러리) 설치(WEB-INF/lib 폴더 복사)
	
	// 1. 설치한 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	System.out.println("드라이버 로드 성공");
	
	// 2. DB 연결
	// DB 접속 주소 = jdbc:mysql://localhost:3306/jspdb
	//					    http://localhost:8088/StudyJSP6/jsp3/DBConnectTest.jsp
	// 				[프로토콜] // [IP 주소] : [Port 번호] / [DB명/프로젝트명]
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
	System.out.println("DB 연결 성공");
	System.out.println("con: " + con);
	System.out.println("con: " + con.toString());
	// com.mysql.cj.jdbc.ConnectionImpl@6509c1e9
	// [해당 객체의 클래스명] @ [객체의 고유번호(hashcode)]
	
	%>
</body>
</html>