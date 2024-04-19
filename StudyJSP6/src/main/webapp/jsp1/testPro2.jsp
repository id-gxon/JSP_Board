<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>testPro2.jsp</h1>
	<%
	// form 태그에 post 방식으로 정보 전달 시 한글 데이터의 인코딩 오류가 발생
	// 한글 인코딩 처리
	request.setCharacterEncoding("UTF-8");
	%>
	이름:
	<%=request.getParameter("name")%><br>
	나이:
	<%=request.getParameter("age")%><br>

	<h3>사용자의 성인 여부를 판단</h3>
	<!-- 19세 미만인 경우: 미성년자, 19세 이상인 경우: 성인 -->
	<!--  안녕하세요. name 님은 '성인/미성년자'입니다. -->

	<%
	int age = Integer.parseInt(request.getParameter("age"));
	String name = request.getParameter("name");
	
	if (age < 19) {
		out.print("안녕하세요. '" + name + "' 님은 '미성년자'입니다."); 
	%>
		<h2>안녕하세요. + <%=name %> + 님은 미성년자입니다.(HTML)</h2>
	<%
	} else {
		out.print("안녕하세요. '" + request.getParameter("name") + "' 님은 '성인'입니다.");
	%>
		<h2>안녕하세요. + <%=name %> + 님은 성인입니다.(HTML)</h2>
	<%
	}
	%>
		
	<%
	
	/*
		변수: 데이터를 저장하는 공간
		변수를 사용하는 방법
			1. 변수 선언
				int a;
			2. 변수 초기화
				a = 0;
			변수 선언과 초기화는 동시에 가능 > int a = 0;
			3. 변수 사용
				System.out.println(a);
	*/
	
	%>
	



</body>
</html>