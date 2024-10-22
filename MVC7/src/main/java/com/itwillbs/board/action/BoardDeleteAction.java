package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.itwillbs.util.JSMoveFunction;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: BoardDeleteAction_execute() 실행");
		
		// 게시판 요청글 본인확인 체크 (세션제어)
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		// Get parameter(pass, bno, pageNum)
		BoardDTO dto = new BoardDTO();
		
		dto.setPass(request.getParameter("pass"));
		dto.setBno(Integer.parseInt(request.getParameter("bno")));
		String pageNum = request.getParameter("pageNum");

		// Connect DB and delete board
		BoardDAO dao = new BoardDAO();
		
		int result = dao.deleteBoard(dto);
		
		// 삭제 결과에 따른 페이지 이동(JS) 
		if (result == -1) {
			System.out.println("M: 공통기능 JSMoveFunction객체 사용");
			JSMoveFunction.alertAndBack(response, "요청글 정보 없음!");
			return null;
		}
		if (result == 0) {
			System.out.println("M: 공통기능 JSMoveFunction객체 사용");
			JSMoveFunction.alertAndBack(response, "비밀번호 오류!");
			return null;
		}
		
		System.out.println("M: 공통기능 JSMoveFunction객체 사용");
		JSMoveFunction.alertAndLocation(response, "게시판글 삭제 완료", "./BoardList.bo?pageNum=" + pageNum);
		
		
		return null;
	}

}
