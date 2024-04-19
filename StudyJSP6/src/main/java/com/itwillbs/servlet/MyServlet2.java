package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.BoardBean;

@WebServlet(value = "/myservlet2") // web.xml에 서블릿 매핑하는 동작(서블릿 3.0 이후 사용가능)
public class MyServlet2 extends HttpServlet {

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

		// BoardBean 객체 생성
		BoardBean bb = new BoardBean();

		// 객체 정보 저장
		bb.setBno(100);
		bb.setSubject("테스트 제목");
		bb.setContent("테스트 내용");

		// request 영역에 저장
		request.setAttribute("bb", bb);

		// BoardBean 객체 배열 생성 -> 전달 후 출력
		BoardBean[] bbList = new BoardBean[5];
		bbList[0] = bb;
		bbList[1] = bb;
		bbList[2] = bb;
		bbList[3] = bb;
		bbList[4] = bb;

		// request 영역에 저장
		request.setAttribute("bbList", bbList);

		// ArrayList 객체 정보 전다
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();

		boardList.add(bb);
		request.setAttribute("boardList", boardList);

		// 페이지 이동(forward) -> object_array.jsp에서 정보 출력
		RequestDispatcher dis = request.getRequestDispatcher("./jstl_el/object_array.jsp");

		dis.forward(request, response);
	}

}
