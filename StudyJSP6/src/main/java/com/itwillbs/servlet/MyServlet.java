package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet extends HttpServlet {

	// ALT SHIFT s + V
	@Override
	public void init() throws ServletException {
		System.out.println("서블릿 생성(처음 한 번만 생성)");
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("GET 방식으로 호출할 때 실행 - doGet()");

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("POST 방식으로 호출할 때 실행 - doPost()");

	}

	@Override
	public void destroy() {
		System.out.println("서블릿 사용 종료");
	}

}