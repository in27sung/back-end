package com.itwillbs.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

/**
 * 회원가입에 대한 처리 동작을 수행 insertPro.jsp에서 구현했던 동작을 실행
 * 
 */
public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("Model: MemberJoinAction_execute() 실행");

		// 회원가입에 대한 처리 동작 수행

		// Encoding Korean
		request.setCharacterEncoding("UTF-8");

		// 전달받은 폼태그 정보 저장
		// 객체생성후 정보 저장
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPass(request.getParameter("pass"));
		dto.setName(request.getParameter("name"));
		dto.setAge(Integer.parseInt(request.getParameter("age")));
		dto.setGender(request.getParameter("gender"));
		dto.setEmail(request.getParameter("email"));
		dto.setRegdate(new Timestamp(System.currentTimeMillis()));

		System.out.println("M: " + dto);

		// DB연결 - insert 처리
		// MemberDATO 객체 생성 
		MemberDAO dao = new MemberDAO();

		dao.insertMember(dto);
		System.out.println("M: 회원가입 성공!");
		
		// 로그인페이지로 이동 
		ActionForward forward = new ActionForward();
		forward.setPath("./MemberLogin.me");
		forward.setRedirect(true);
		// true = sendRedirect (가상주소 -> 가상주소)
		// false = forward(주소변경 x) (가상주소 -> 실제주소.jsp)
		
		System.out.println("M: " + forward);
		
		return forward;
	}

}
