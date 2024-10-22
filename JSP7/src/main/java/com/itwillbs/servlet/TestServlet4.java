package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.bean.MemberBean;

@WebServlet("/test4")
public class TestServlet4 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet4_doGet()");
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet4_doPost()");
		
		// MemberBean 객체 생성해서 정보를 저장하고,
		MemberBean member1 = new MemberBean();
		
		member1.setId("itwill");
		member1.setPass("1234");
		member1.setName("홍길동");
		//....
		
		// MemberBean 객체를 배열(ArrayList) 저장 후 전달
		ArrayList memberList = new ArrayList();
		
		memberList.add(member1);
		
		//영역객체에 저장
		request.setAttribute("memberBean", member1);
		
		request.setAttribute("memberList", memberList);
		
		// ./jstl_el/core_set2.jsp 페이지에 전달 후 출력
		RequestDispatcher dis 
			= request.getRequestDispatcher("./jstl_el/core_set2.jsp");
		dis.forward(request, response);
	}

			
}
