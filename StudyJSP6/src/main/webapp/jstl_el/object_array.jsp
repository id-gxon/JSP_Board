<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>object_array</title>
</head>
<body>
	Bno: ${bb.bno }<br>
	Subject: ${bb.subject }<br>
	Content: ${bb.content }<br>
	
	* EL 표현식은 객체의 정보를 출력할 때 각각의 get/set method 호출 X
		-> 변수명 호출 O<br>
	
	<hr>
		
	bbList: ${bbList }<br>
	bbList[0]: ${bbList[0] }<br>
	bbList[0].subject: ${bbList[0].subject }<br>
	
	<hr>
	
	${requestScope.boardList }<br>
	${requestScope.boardList[0].bno }<br>
</body>
</html>