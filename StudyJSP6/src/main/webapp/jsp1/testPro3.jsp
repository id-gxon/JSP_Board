<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro3.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	// String age = request.getParameter("age");
	// int age2 =Integer.parseInt(age);
	String gender = request.getParameter("gender");
	// 배열: 데이터를 연속된 공간에 저장한다. 
	//		- 데이터를 저장할 때 번호를 지정(index = 항상 0번부터 시작)
	//		- 배열에 저장된 데이터를 '요소'라고 부른다.
	//		- 해당 요소는 변수처럼 사용가능
	
	
	// "hobby" 이름을 가진 파라메터 정보 모두를 배열에 저장
	String[] hobbys = request.getParameterValues("hobby");
	String roomNo = request.getParameter("roomNo");
	%>
	이름: <%=name%><br>
	나이: <%=age%><br>
	성별: <%=gender%><br>
	취미: <% for(int i=0;i<hobbys.length;i++){%><%=hobbys[i] %>&nbsp;
			<%
			} 
			%><br>
	강의장 번호: <%=roomNo %><br>


	
</body>
</html>