<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- JSP 지시어 -->
<%@ include file="../inc/mycolor.jsp" %>

<%
/*
@ include: 해당 소스 코드를 가져와서 병합 후에 코드를 컴파일해서 실행
			(공통 속성 사용)	
*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor=<%=color1 %>>
	<h1>mainpage.jsp</h1>

	<h2>아이티윌 부산</h2>
	<h2>051-803-0909</h2>

	<table border="1">
		<!-- 행을 생성하는 태그 tr -->
		<tr>
			<!-- 열을 생성하는 태그 td -->
			<td>hello</td>
			<td>world</td>
			<td>!</td>
		</tr>
		<tr>
			<td>hello</td>
			<td>world</td>
			<td>!</td>
		</tr>
	</table>

	<!-- 테이블 생성 -->
	<table border="1" width="700" height="600">
		<tr>
			<td height="100" colspan="2">
				<h1>[header]: 로고, 검색창, 로그인창, 메인메뉴 등</h1>
				<!-- <h2>아이티윌 홈페이지(ITWILLBS)</h2> -->
				
				<!-- 
				jsp 액션 태그: 태그 형태로 자바 코드를 실행
				해당 코드를 각각 컴파일 후에 병합
				(주로 페이지 공통 부분을 구성)
				 -->
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