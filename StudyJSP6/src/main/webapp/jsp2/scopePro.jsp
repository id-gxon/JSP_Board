<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopePro.jsp</h1>

	<h2>이전 페이지에서 전달된 정보 저장(파라메터)</h2>
	<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	%>
	아이디:
	<%=id%><hr>

	<h2>영역객체(Scope) 생성</h2>
	<%
	// 영역객체 생성 > 이미 생성됨(내장객체)
	// 영역객체에 정보 저장

	// page 영역
	pageContext.setAttribute("p", "pageContext Value");
	// request 영역
	request.setAttribute("r", "request Value");
	// session 영역
	session.setAttribute("s", "session value");
	// application 영역
	application.setAttribute("a", "application value");
	%>

	<h2>영역객체(Scope) 사용</h2>
	page 영역 - pageContext 객체의 공유 데이터(Attribute):
	<%=pageContext.getAttribute("p")%><hr>
	request 영역 - request 객체의 공유 데이터(Attribute):
	<%=request.getAttribute("r")%><hr>
	session 영역 - session 객체의 공유 데이터(Attribute):
	<%=session.getAttribute("s")%><hr>
	application 영역 - application 객체의 공유 데이터(Attribute):
	<%=application.getAttribute("a")%><hr>

	<h2>영역객체의 범위</h2>
	pageContext  request  session  application
	
	<hr>
	
	<h2>페이지 이동 방식에 따른 영역객체의 사용</h2>
	
	<h3>1. HTML 코드 a 태그(파라메터, session, application 영역)</h3>	
	<a href="scopeAction.jsp?id=<%=id%>&pw=1234">scopeAction.jsp 이동</a>
	
	<h3>2. JavaScript 코드 - location.href(파라메터, session, application 영역)</h3>
	<script type="text/javascript">
		alert("scopeAction 페이지로 이동!!");
		location.href="scopeAction.jsp?id=<%=id%>&pw=1234";
	</script>
	
	<h3>3. JSP 코드 - response.sendRediret(파라메터, session, application 영역)</h3>
	<%
	// jsp(java) -> HTML -> JavaScript
	// => jsp, js를 사용한 페이지 이동은 둘 중 하나만 사용
	
	// JSP 표현식 %= %은 jsp(java) 코드를 HTML/JS에 출력할 때 사용
// 	response.sendRedirect("scopeAction.jsp?id="+id+"&pw=1234");
	%>
	
	<!-- 
	forward 이동방식(포워딩)
		- 페이지의 이동 주소가 변경 X, 화면은 변경 O
		- request 영역의 정보를 공유 가능
	 -->
	<h3>4. 액션 태그 - forward(파라메터, request, session, application 영역)</h3>
	<jsp:forward page="scopeAction.jsp?pw=1234"/>
</body>
</html>