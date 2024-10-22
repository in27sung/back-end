package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test3")
public class TestServlet3 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet3_doGet() 실행");
		
		doPost(request, response);
			
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet3_ddPost() 실행");
		
		// "아이티윌", "S24", "010-1234-1234" 정보를 생성해서
		// bean.jsp 페이지에 전달해서 출력
		Phone s1 = new Phone();
		s1.setModel("S24");
		s1.setTel("010-1234-1234");

		Person p1 = new Person();
		p1.setName("아이티윌");
		p1.setPhone(s1);
		
		// 영역객체에 저장
		request.setAttribute("personInfo", p1);
		// 페이지 이동(bean.jsp)
		RequestDispatcher dis =
				request.getRequestDispatcher("./jstl_el/bean.jsp");
		dis.forward(request, response);
		
		
		
	}

}
