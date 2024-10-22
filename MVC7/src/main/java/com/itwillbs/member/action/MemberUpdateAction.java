package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: MemberUpdateAction_execute() 실행");
		
		// 사용자의 로그인 여부를 체크(세션정보 제어)
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		// 로그인X -> 로그인 페이지로 이동 
		if(id == null) {
			System.out.println("M: 로그인 정보 없음! 로그인페이지로 이동");
			//response.sendRedirect("./MemberLogin.me");
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}

		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// DB에서 특정 사용자의 정보를 조회 
		MemberDTO dto = dao.getMember(id);
		
		// request 영역에 저장 
		request.setAttribute("dto", dto);
		
		// 연결된 페이지(./member/updateForm.jsp)로 이동
		forward.setPath("./member/updateForm.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
