<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>operatorPro1</title>
</head>
<body>
	<h2>EL 표현식 사용 정보 처리</h2>
	전달정보 num1: ${param.num1 }<br>
	전달정보 num2: ${param.num2 }
	
	<hr>
	
	<h3>산술연산(자동 형변환)</h3>
	num1 + num2 = ${param.num1 } + ${param.num2 } = ${param.num1 + param.num2 }<br>
	num1 - num2 = ${param.num1 } - ${param.num2 } = ${param.num1 - param.num2 }<br>
	num1 * num2 = ${param.num1 } * ${param.num2 } = ${param.num1 * param.num2 }<br>
	num1 / num2 = ${param.num1 } / ${param.num2 } = ${param.num1 / param.num2 }<br>
	num1 % num2 = ${param.num1 } % ${param.num2 } = ${param.num1 % param.num2 }
	
	<hr>
	
	<h3>비교연산, 논리연산</h3>
	num1 = 양수? ${param.num1 > 0 }<br>
	num1, num2 모두 양수? ${param.num1 > 0 && param.num2 > 0 }<br>
	num1, num2 모두 양수? ${param.num1 > 0 and param.num2 > 0 }<br>
	
	<hr>
	
	<!-- 사용자의 아이디를 출력(아이디 정보가 없을 경우 "guest" 출력 -->
	전달정보 아이디: ${param.id == "" ? "guest" : param.id }<br>
	전달정보 아이디: ${param.id != "" ? param.id : "guest" }<br>
	전달정보 아이디: ${empty param.id ? "guest" : param.id }
	
</body>
</html>