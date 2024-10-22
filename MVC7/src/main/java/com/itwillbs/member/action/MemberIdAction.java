package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Model: MemberIdAction_execute() 실행");

		// 전달된 사용자 ID를 DTO객체에 저장
		MemberDTO dto = new MemberDTO();

		dto.setId(request.getParameter("id"));

		// 결과 출력
		System.out.println("M: " + dto.toString());

		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();

		// 아이디 여부 체크 method
		int result = dao.idCheck(dto);
		System.out.println("M: result(" + result + ")");

		ActionForward forward = new ActionForward();
		
		// request 영역객체에 정보 저장(공유)
		request.setAttribute("dto", dto);

		if (result == -1) {
			// 회원정보 없음 - js 사용, 페이지 이동
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			/* out.println(" <h1> 아이디 없음 </h1>"); */
			out.println("<script>");
			out.println("alert('아이디 정보 없음');");
			out.println("history.back();");
			System.out.println("M: 컨트롤러 없이 페이지 이동(JS)");
			out.println("</script>");
			out.close();
			return null; // 함수 종료
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("id", dto.getId());
		forward.setPath("./member/passwordForm.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
