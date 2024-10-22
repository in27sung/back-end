package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TestServlet1 extends HttpServlet{
	
	//http://localhost:8088/JSP7/test1
	// option + shift + v
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet1_doGet() 실행");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet1_doPost() 실행");
		
		//attribute.jsp 페이지로 정보를 전달
		//request 영역에 정보를 저장(공유)
		request.setAttribute("cnt", "request");
		
		// session 영역에 정보를 저장(공유)
//		session.setAttribute(); (x)
		
		// session 객체 생성
		HttpSession session = request.getSession();
		session.setAttribute("cnt", "session");
		
		// 서블릿을 사용해서 화면에 정보를 출력 
		// 1. 태그를 직접 구현
		//response.getWriter().append("<h1>HEllo</h1>");
		// 2. JSP페이지로 이동(연결)
		RequestDispatcher dis
			= request.getRequestDispatcher("./jstl_el/attribute.jsp");
		dis.forward(request, response);
		
		//request.getRequestDispatcher("./jstl_el/attribute.jsp").forward(request, response);
		
	}
	
	
	

}
