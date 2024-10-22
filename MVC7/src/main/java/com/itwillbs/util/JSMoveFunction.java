package com.itwillbs.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/**
 * _Action 페이지에서 자바스크립트로 페이지 이동하는 동작을 
 * 처리 해놓은 클래스 
 */
public class JSMoveFunction {
	
	public static void alertAndBack(HttpServletResponse response, String msg) {
		try {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('"+ msg +"');");
		out.println("history.back();");
		System.out.println("M: 컨트롤러 없이 페이지 이동(JS)");
		out.println("</script>");
		out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void alertAndLocation(HttpServletResponse response, String msg, String url) {
		try {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('"+ msg +"');");
			out.println("location.href='"+ url +"';");
			System.out.println("M: 컨트롤러 없이 페이지 이동(JS)");
			out.println("</script>");
			out.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}