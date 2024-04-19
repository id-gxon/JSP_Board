<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>scopeForm.jsp(p209)</h1>

	<table border="1">
		<tr>
			<td>영역</td>
			<td>영역객체</td>
			<td>설명</td>
		</tr>
		<tr>
			<td>page</td>
			<td>pageContext</td>
			<td>jsp 페이지의 정보를 저장하는 객체(페이지에서만 데이터 유효)</td>
		</tr>
		<tr>
			<td>request</td>
			<td>request</td>
			<td>클라이언트 요청이 처리되는 동안 공유(포워딩 방식)</td>
		</tr>
		<tr>
			<td>session</td>
			<td>session</td>
			<td>하나의 웹브라우저에서 정보를 공유</td>
		</tr>
		<tr>
			<td>application</td>
			<td>application</td>
			<td>웹 애플리케이션에 정보를 공유(tomcat이 꺼지기 전까지)</td>
		</tr>
	</table>

	<h3>영역객체.setAttribute("이름", "값") : 공유 데이터 설정</h3>
	<h3>영역객체.getAttribute("이름") : 공유 데이터 사용</h3>
	<h3>영역객체.removeAttribute("이름") : 공유 데이터 삭제</h3>

	<hr>

	<h2>파라메터 데이터 전달하기</h2>
	<fieldset>
		<legend>파라메터 전달(정보 전달)</legend>
		<form action="scopePro.jsp" method="get">
			아이디: <input type="text" name="id">
			<input type="submit" value="전송">
		</form>
	</fieldset>





</body>
</html>