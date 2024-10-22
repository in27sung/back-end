package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//class HttpServlet{ }
/*
 * Servlet: 자바코드로 만들어진 웹 페이지 
 */
//@WebServlet("/myservlet.com")
// -> web.xml에 서블릿을 매핑하는 동작과 같음(서블릿 3.1 이상 사용가능)
@WebServlet("/myservlet.com")
public class MyServlet extends HttpServlet{
	//Source -> override 
	
	// http://localhost:8088/JSP7/myservlet.com
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {

//		super.doGet(req, resp); 은닉된 부모의 메서드 호출가능 
		System.out.println("사용자가 GET방식으로 호출할 때 실행하는 메서드");
		// 1.기존의 코드를 직접 구현 
//		response.setContentType("text/html; charset=UTF-8");
//		response.getWriter().append("<h1>안녕하세요!<h1>");

		// 2. 코드를 별도의 JSP파일(webapp/jsp/test.jsp)을 사용해서 구현
		RequestDispatcher dis
			= request.getRequestDispatcher("./Jsp/test/test.jsp");
		
		//페이지 이동
		dis.forward(request, response);
//		<jsp:forward url="">
		// 포워딩(forwarding)시 특징 
		// 1) 영역객체 (request)를 전달가능 
		// 2) 주소줄(URL)의 변화x, 화면만 변화
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("사용자가 POST방식으로 호출할 때 실행하는 메서드");
		
	}
	
}
