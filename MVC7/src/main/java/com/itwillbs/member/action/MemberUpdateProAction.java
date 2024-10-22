package com.itwillbs.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.itwillbs.util.JSMoveFunction;

public class MemberUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: MemberUpdateProAction_execute() 실행");
		
		// 사용자 로그인여부 체크 (세션제어)
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		// 한글처리 인코딩 
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 데이터(파라메터)를 DTO에 저장 
		MemberDTO dto = new MemberDTO();
		
		dto.setId(request.getParameter("id"));
		dto.setPass(request.getParameter("pass"));
		dto.setName(request.getParameter("name"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		dto.setGender(request.getParameter("gender"));
		dto.setEmail(request.getParameter("email"));
		
		System.out.println("M: 수정할 정보(" + dto + ")");
		// 디비에 연결해서 정보 수정 
		
		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 정보 수정하는 메서드 호출 
		int result = dao.updateMember(dto);
		System.out.println("M: result(" + result +")");
		
		// 수정 결과에 따른 페이지 이동 
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
		
		System.out.println("M: 공통기능 JSMoveFunction객체 사용");
		JSMoveFunction.alertAndLocation(response, "회원정보 수정 완료", "./main.me");
		return null;
		
	}

}
