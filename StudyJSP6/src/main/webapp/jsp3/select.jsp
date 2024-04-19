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
	<h1>select.jsp</h1>
	<h2>MySQL에 저장된 정보를 조회(READ)</h2>

	<%
	// 0. 드라이버 설치(생략)
	// DB 연결 정보
	final String DRIVER = "com.mysql.cj.jdbc.Driver";
	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";

	// 1. 드라이버 로드
	Class.forName(DRIVER);

	// 2. DB 연결
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	
	// 3. SQL 작성 & pstmt 객체 생성
	String sql = "SELECT * FROM itwill_member";
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	// 4. SQL 실행
	// INSERT, UPDATE, DELETE: pstmt.executeUpdate(); - 구문 실행 결과로 테이블의 변화가 있을 때
	// SELECT: pstmt.executeQuery(); - 구문 실행 결과로 테이블의 변화가 없을 때
	
	// SQL 구문의 실행 결과(레코드셋)를 객체에 저장
	ResultSet rs = pstmt.executeQuery();
	
	// 5. 데이터 처리
	
	// 커서를 이동해서 데이터가 존재하면 true, 없으면(EOF) false
	while(rs.next()){ 
		// 데이터가 존재하면, 첫 번째 행 활성화
		
		// method 오버로딩: 동일한 이름의 메서드를 여러 개 사용하는 문법,
		//					전달 인자의 데이터 타입이 다르거나, 전달 인자의 개수가 다를 때 사용 가능
		
		// method 시그니처: 1) 이름 2) 전달 인자의 데이터 타입 3) 전달 인자의 개수
		
		// rs.get[데이터타입]("필드명(칼럼명)");
		// rs.get[데이터타입](컬럼 인덱스 번호);
	%>
	idx: <%=rs.getInt("idx") %><br>
	<%-- idx: <%=rs.getInt(1) %> --%>
	name: <%=rs.getString("name") %><br>
	<%-- name: <%=rs.getString(2) %> --%>
	gender: <%=rs.getString("gender") %><br>
	<%-- gender: <%=rs.getString(3) %> --%>
	age: <%=rs.getInt("age") %><br>
	<%-- age: <%=rs.getInt(4) %> --%>
	jumin: <%=rs.getString("jumin") %><hr>
	<%-- jumin: <%=rs.getString(5) %> --%>
	
	<%
	}
	%>
</body>
</html>