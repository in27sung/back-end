package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.itwillbs.util.JSMoveFunction;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: MemberDelete_execute() 실행");
		
		// 사용자 로그인여부 체크 (세션제어)
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		// Encoding Korean
		request.setCharacterEncoding("UTF-8");
		// 전달된 데이터(Parameter)를 DTO에 저장
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPass(request.getParameter("pass"));
		
		// Connect DB and delete account 
		MemberDAO dao = new MemberDAO();
		
		int result = dao.deleteMember(dto);
		
		// 삭제 결과에 따른 페이지 이동(JS) 
		if (result == -1) {
			System.out.println("M: 공통기능 JSMoveFunction객체 사용");
			JSMoveFunction.alertAndBack(response, "회원정보 없음!");
			return null;
		}
		if (result == 0) {
			System.out.println("M: 공통기능 JSMoveFunction객체 사용");
			JSMoveFunction.alertAndBack(response, "비밀번호 오류!");
			return null;
		}
		
		// 사용자의 세션정보 초기화 
		session.invalidate();
		
		System.out.println("M: 공통기능 JSMoveFunction객체 사용");
		JSMoveFunction.alertAndLocation(response, "회원정보 삭제 완료", "./Main.me");
		
		return null;
	}

}
