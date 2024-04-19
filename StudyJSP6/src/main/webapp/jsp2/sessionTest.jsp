<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionTest.jsp</h1>
	<h2>세션(session): 서버와 클라이언트 간의 상태를 유지하기 위해서 사용</h2>
	* HTTP 프로토콜을 사용한 통신은 요청/응답 처리가 완료되면 서로의 상태를 유지 X
	<br> * 서버 컨테이너 측에서 관리되는 데이터, 접속(브라우저)이 종료될 때까지 사용가능
	<br> * 별도의 사용 시간을 설정해서 사용 가능(default = 30minute)
	<br> * 서버의 응답 정보를 전달받을 때 sessionID 값을 같이 전달받음(클라이언트의 쿠키에 저장)
	<hr>

	<h2>클라이언트(나)</h2>

	<%
	// 서버와의 상태 정보를 생성(저장) (적립번호 등록)
	String name = (String) session.getAttribute("userName");
	String coupon = (String) session.getAttribute("coupon");

	// 세션의 정보가 없다면 "세션 정보 없음!"
	if (name == null) {
		name = "세션 정보 없음!";
	}
	%>

	<h3>
		session 정보:
		<%=name%>
	</h3>
	<h3>
		session 정보:
		<%=coupon%>
	</h3>

	<input type="button" value="session 생성"
		onclick="location.href='sessionSet.jsp';">
	<input type="button" value="session 삭제"
		onclick="location.href='sessionDel.jsp';">
	<input type="button" value="session 초기화"
		onclick="location.href='sessionInv.jsp';">

</body>
</html>




















