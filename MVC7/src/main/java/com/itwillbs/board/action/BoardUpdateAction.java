package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Model: BoardUpdateAction_execute() 실행");
		
		// 전달된 정보(파라메터)를 저장 
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		
		// Connection DB
		BoardDAO dao = new BoardDAO();
		
		// 기존에 작성된 글 정보를 가져오기 
		BoardDTO dto = dao.getBoard(bno);
		
		// request 영역에 저장
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);

		// 정보출력 
		// 페이지 이동준비 
		
		ActionForward forward = new ActionForward();
		forward.setPath("./board/updateBoard.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
