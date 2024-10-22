package com.itwillbs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestServlet2 extends HttpServlet {
	
	// option + shift + v
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet2_doGet() 실행");
		
		// 배열객체를 하나 생성해서 정보를 jsp 페이지로 전달
		String[] sports = {"축구", "야구", "농구", "배구", "탁구",};
		
		//영역 객체에 저장
		request.setAttribute("sports", sports);
		
		// 리스트 객체(배열) 정보 전달
		// upcasting: 자신의 타입이 부모 타입으로 형변환 (복습하기)
		ArrayList movieList = new ArrayList();
		// object에 있는 메소드를 상속 받아 string 타입이 출력가능
		movieList.add("영화1");
		movieList.add("영화2");
		movieList.add("영화3");
		movieList.add("영화4");
		movieList.add("영화5");
		
		//영역객체에 저장
		request.setAttribute("movieList", movieList);
		
		// 페이지 이동
		RequestDispatcher dis = 
				request.getRequestDispatcher("./jstl_el/array.jsp");
		dis.forward(request, response);
		
	}// doGet

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("TestServlet2_doPost() 실행");
	}// doPost

}
