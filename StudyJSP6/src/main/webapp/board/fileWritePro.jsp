<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>fileWritePro.jsp</h1>
	<%
	// 라이브러리 cos.jar - http://www.servlets.com/
	// cos.jar 설치 > /WEB_INF/lib/cos.jar 이동
	// /webapp/upload 폴더 생성
	String realPath = request.getRealPath("/upload");
	// C:\Users\ITWILL\eclipse_jsp6\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\StudyJSP6\\upload
	// 프로젝트를 서버에 올렸을 때 주소

	// C:\Users\ITWILL\eclipse_jsp6\StudyJSP6\src\main\webapp\\upload
	// 프로젝트 코드를 저장하는 주소
	System.out.println(realPath);

	// 첨부파일 크기 10MB 제한
	int maxSize = 10 * 1024 * 1024;

	// 첨부파일 업로드
	// MultipartRequest 객체 생성 == 파일 업로드
	// request: jsp 내장 객체를 전달 / 폼 태그 정보(파라메터)
	// realPath: 업로드되는 파일이 저장되는 경로(서버)
	// maxSize: 업로드되는 첨부파일의 크기 제한
	// UTF-8: 업로드되는 파일의 이름 인코딩 처리(한글명)
	// new DefaultFileRenamePolicy(): 중복된 첨부파일의 이름을 변경하는 객체
	MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new DefaultFileRenamePolicy()); // 기본 생성자가 없기에 오버로딩 생성자 호출

	System.out.println("첨부파일 업로드 성공");

	// 전달 정보 저장 - 일반적인 폼 태그 데이터가 아니기에(enctype="multipart/form-data") 기존 방식으로 처리 불가능
	String name = multi.getParameter("name");
	String pass = multi.getParameter("pass");
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");

	// String file = multi.getParameter("file"); 첨부파일의 이름만 저장(첨부파일 저장 x)
	String file = multi.getFilesystemName("file");
	String originalFile = multi.getOriginalFileName("file");
	// 첨부파일의 이름을 가져옴(공통점)
	// getFilesystemName("file") - 이름 변경(동일한 파일이 있을 경우)
	// getOriginalFileName("file") - 이름 유지

	// 첨부파일의 이름 > DB에 저장, 첨부파일의 내용 > server에 저장

	// DB에 저장
	BoardBean bb = new BoardBean();
	bb.setName(name);
	bb.setPass(pass);
	bb.setSubject(subject);
	bb.setContent(content);
	bb.setIp(request.getRemoteAddr());
	bb.setFile(file);

	BoardDAO bdao = new BoardDAO();

	bdao.insertBoard(bb);

	// list.jsp로 이동
	response.sendRedirect("list.jsp");
	%>
</body>
</html>