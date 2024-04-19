<!-- page 지시어(페이지에 대한 설명) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test2.jsp</h1>

	<h2>JSP 구성요소</h2>

	<h3>1. JSP 지시어(Directive - p150~): 페이지를 실행할 때 필요한 정보(설정 등)를 나타내는
		코드</h3>
	< %@ page, %@ include, %@ taglib >

	<h3>2. JSP 스크립트 요소 - 선언문(Declaration): 멤버 변수, 멤버 메서드를 선언하는 공간</h3>
	%! 멤버 변수/멤버 메서드 선언 % class Test{ // 멤버 변수(인스턴트 변수) int age; } public
	vboid method(){ // 지역 변수 int tel; }

	<h3>3. JSP 스크립트 요소 - 스크립틀릿(Scriptlet): Java 코드 작성(지역변수)</h3>
	< % % >

	<h3>4. JSP 스크립트 요소 - 표현식(Expression): Java 코드를 화면에 출력하는 방법</h3>
	< %= % >

	<h2>JSP 내장 객체 p177~208</h2>

	<h3>javax.servlet 패키지(8)</h3>
	request: HTTP 요청 정보를 저장하는 객체
	<hr>
	response: HTTP 요청에 대한 응답 정보 객체
	<hr>
	session: 클라이언트의 세션 정보를 저장하는 객체
	<hr>
	pageContext: 페이지 실행에 필요한 프로젝트 정보를 저장하는 객체
	<hr>
	out: 응답 정보를 위한 출력 스트림 객체
	<hr>
	application: 해당 애플리케이션의 프로젝트 정보를 저장하는 객체
	<hr>
	config: 서블릿의 정보설정값
	<hr>
	page: 해당 페이지(서블릿 객체)
	<hr>

	<h3>java.lang 패키지(1)</h3>
	execption: 예외 처리 객체
	<hr>

	<hr>
	<hr>

	서버 이름:
	<%=request.getServerName()%>
	<hr>
	서버 포트번호:
	<%=request.getServerPort()%>
	<hr>
	URL:
	<%=request.getRequestURL()%>
	<hr>
	URI:
	<%=request.getRequestURI()%>
	<hr>
	컨텍스트경로:
	<%=request.getContextPath()%>
	<hr>
	실제 파일이 저장되는 경로:
	<%=request.getRealPath("/")%>
	<hr>

	<%
	// response.sendRedirect("http://www.naver.com");
	// response.addHeader("Refresh", "5");
	// response.addHeader("Refresh", "5; url=http://www.naver.com");
	%>

	세션ID:
	<%=session.getId()%>
	<hr>
	세션 최초 생성 시간:
	<%=session.getCreationTime()%>
	<hr>
	세션 최종 사용 시간:
	<%=session.getLastAccessedTime()%>
	<hr>
	

</body>
</html>