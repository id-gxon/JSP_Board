package com.itwillbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyServlet1 extends HttpServlet {

	@Override
	public void init() throws ServletException {
		System.out.println("Servlet 생성");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		System.out.println("Get");
//		
//		// 화면에 내용 출력1
//		response.setContentType("text/html; charset=utf-8");
//		
//		response.getWriter().println("Hello");
//		response.getWriter().println("<h2>itwill</h2>");
//		
//		// 화면에 내용 출력2
//		PrintWriter out = response.getWriter();
//		out.println("<h3>부산 교육 센터</h3>");
		
		// request 영역에 정보를 저장해서 전달
		request.setAttribute("cnt", 200);
		
		// 기본형 -> 참조형: 래퍼클래스(8개)
		/*
		 * boolean	->	Boolean
		 * char		->	Character
		 * byte		->	Byte
		 * short	->	Short
		 * int		->	Integer
		 * long		->	Long
		 * float	->	Float
		 * double	->	Double
		 * 
		 * JDK1.6 이후부터 오토박싱 / 오토언박싱을 제공
		 */
		
		// session 영역에 정보를 저장해서 전달 ("scnt", 3000)
		// session 내장 객체 X, 객체 생성
		HttpSession session = request.getSession();
		session.setAttribute("scnt", 3000);
		request.setAttribute("scnt", 2000);
		
		// 이미 생성된 JSP 페이지를 연결(forward)
		
		// forword 이동 시 특징
		// 1) 페이지 주소 변경 X, 화면 변경 O
		// 2) request 영역 정보 전달 가능
		RequestDispatcher dis = request.getRequestDispatcher("./jstl_el/Attribute.jsp");
		
		dis.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Post");
	}

	@Override
	public void destroy() {
		System.out.println("Servlet 종료");
	}

}
