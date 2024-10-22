package com.itwillbs.member.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Model: MemberListAction_execute() 실행");
		
		// 사용자 로그인정보 체크(+ 관리자인지 아닌지 체크)
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		
		if(id == null || !id.equals("admin")) {
			System.out.println("M: 로그인 정보 없음! 로그인페이지로 이동");
			//response.sendRedirect("./MemberLogin.me");
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// 디비에 접근해서 저장되어 있는 모든 회원정보를 가져오기 
		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		ArrayList memberList = dao.getMemberList();
		
		// 전달받으 정보 출력 -> request영역에 저장 & forward 이동 
		request.setAttribute("memberList", memberList);
		
		// 페이지 이동 
		forward.setPath("./member/list.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
