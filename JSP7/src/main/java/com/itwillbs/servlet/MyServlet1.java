package com.itwillbs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1. HttpServlet inherenct 
public class MyServlet1 extends HttpServlet{
	
	// control + space 
	// 선언할때 
	public MyServlet1() {
		System.out.println("default constructor: 객체가 생성될때 실행");
	}
	
	// option + shift + v (override)
	// init: initialise 
	// superclass 객체를 받아서 저장 
	@Override
	public void init() throws ServletException {
		System.out.println("서블릿 객체를 초기화 할때 실행!");
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("사용자가 GET방식으로 실행할때 호출!");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("사용자가 POST방식으로 실행할때 호출");
	}
	
	@Override
	public void destroy() {
		System.out.println("서블릿 객체를 삭제(소멸)");
	}
	
	
}
