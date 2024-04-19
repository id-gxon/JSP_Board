package com.itwillbs.servlet;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(value = "/servlet4")
public class MyServlet4 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Phone phone = new Phone();

		phone.setModelName("galaxy");
		phone.setTelNum("010-1234-5678");

		Person person = new Person();
		person.setName("Kim");
		person.setPhone(phone);

		req.setAttribute("person", person);
		
		Vector personList = new Vector();
		personList.add(person);
		
		req.setAttribute("personList", personList);
		

		// RequestDispatcher dis = req.getRequestDispatcher("./jstl_el/core_set2.jsp");
		RequestDispatcher dis = req.getRequestDispatcher("./jstl_el/core_foreach.jsp");

		dis.forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}

}
