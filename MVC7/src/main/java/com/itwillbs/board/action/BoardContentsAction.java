package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardContentsAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Model: BoardContentsAction_execute() 실행");
		
		
		// 글 내용을 읽음
		
		// 전달된 파라메터 정보 저장
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		// BoardDAO 객체
		BoardDAO dao = new BoardDAO();
		HttpSession session = request.getSession();
		boolean updateCheck = (boolean)session.getAttribute("updateCheck");

		// 조회수를 증가했는지 안했는지 체크 
		
		// + 컨텐츠 F5로 조회수 증가x
		// 리스트에서 컨텐츠 올때만 조회수 증가 
		if(updateCheck) { //updateCheck가 true일 때
			// 1) 글 조회수 1 증가 
			dao.increaseReadCount(bno);
			System.out.println("M: 조회수 1증가 완료!");
		}

		session.setAttribute("updateCheck", false);
		
		// 2) DB에서 해당 글정보를 가져와서 출력 
		BoardDTO dto = dao.getBoard(bno);
		
		//request 영역에 저장
		request.setAttribute("dto", dto);
		
		// 연결된 뷰페이지(jsp)에 전달해서 출력
		ActionForward forward = new ActionForward();
		forward.setPath("./board/boardContents.jsp");
		forward.setRedirect(false);
		
		
		return forward;
	}

}
