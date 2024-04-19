<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>sessionSet.jsp</h1>
	<h2>서버(카페)</h2>
	
	<%
	// 클라이언트의 요청을 처리(커피만드는 중)
	
	System.out.println("요청 처리 중 ... (커피 만드는 중...)");
	
	// 요청 처리 완료
	
	// 클라이언트-서버 상태 정보를 생성(저장) (적립번호 등록)
	session.setAttribute("userName", "ITWILL");
	session.setAttribute("coupon", "10");
	System.out.println("사용자 상태 정보 생성 + 응답 정보에 담아서 보내기");
	
	// 클라이언트에게 다시 이동
	%>
	<script type="text/javascript">
		alert("요청 처리 완료! (커피)");
		location.href="sessionTest.jsp";
	</script>
</body>
</html>