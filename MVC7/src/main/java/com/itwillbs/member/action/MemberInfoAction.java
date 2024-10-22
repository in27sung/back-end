package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M: MemberInfoAction_execute() 실행");
		
		// 사용자의 로그인 여부 체크 
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
		
		// 로그인O -> 다음동작 진행
		
		// 디비에서 접근해서 특정 사용자의 모든 정보를 가져오는 기능
		
		//MemberDAO 객체 생성 
		MemberDAO dao = new MemberDAO();
		
		//특정 사용자의 모든 정보를 가져오는 기능 
		MemberDTO dto = dao.getMember(id);
		System.out.println("M: " + dto);
		
		// request 영역객체에 정보 저장(공유)
		request.setAttribute("dto", dto);
		
		forward.setPath("./member/info.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	


}
