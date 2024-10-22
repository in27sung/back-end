package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberLogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: MemberLogoutAction_execute() 실행");
		
		// 로그아웃 동작 처리 -> 세션정보 초기화
		
		// 세션객체를 생성 
		HttpSession session = request.getSession();
		session.invalidate();
		
		System.out.println("M: 세션정보 초기화(로그아웃 성공)");
		
		// 메인페이지로 이동(JS)
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); 
			out.println("<script>");
			out.println("alert('로그아웃 완료');");
			out.println("location.href='./Main.me';");
			System.out.println("M: 컨트롤러 없이 페이지 이동(JS)");
			out.println("</script>");
			out.close();
			
			return null;
		
	}

}
