package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

///myservlet3 주소가 호출되면 해당 서블릿을 실행
@WebServlet(value = "/myservlet3")
public class MyServlet3 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet()");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost()");

		// Person 객체 생성(Phone 객체 생성)
		Phone phone = new Phone();
		Person person = new Person();

		phone.setTelNum("010-0000-0000");
		phone.setModelName("galaxy");

		person.setName("Kim");
		person.setPhone(phone);

		// 생성된 정보를 object.jsp로 정보 전달 후 출력
		request.setAttribute("person", person);

		RequestDispatcher dis = request.getRequestDispatcher("./jstl_el/object.jsp");

		dis.forward(request, response);
	}

}
