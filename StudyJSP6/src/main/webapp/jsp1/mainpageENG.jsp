<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>mainpageENG.jsp</h1>

	<h2>ITWILL Busan</h2>
	<h2>051-803-0909</h2>

	<table border="1" width="700" height="600">
		<tr>
			<td height="100" colspan="2">
				<h1>[header]: 로고, 검색창, 로그인창, 메인메뉴 등</h1>
				<!-- <h2>아이티윌 홈페이지</h2> -->
				<jsp:include page="../inc/header.jsp"/>
			</td>
		</tr>
		<tr>
			<td>
				<h1>[center]: 본문 내용</h1>
			</td>
			<td width="200">
				<h1>[left/right]: 서브 메뉴, 광고창, 추천 상품 등</h1>
			</td>
		</tr>
		<tr>
			<td height="100" colspan="2">
				<h1>[footer]: 회사 정보, 연락처, 저작권 등</h1>
			</td>
		</tr>
	</table>
</body>
</html>