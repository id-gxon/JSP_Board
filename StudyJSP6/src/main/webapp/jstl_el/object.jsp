<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>object</title>
</head>
<body>
	${person }
	
	<hr>
	
	NAME: ${person.name }<br>
	MODELNAME: ${person.phone.modelName }<br>
	TELNUMBER: ${person.phone.telNum }
	
	<hr>
</body>
</html>