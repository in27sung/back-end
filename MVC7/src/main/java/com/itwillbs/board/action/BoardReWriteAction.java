package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardReWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: BoardReWriteAction_execute() 실행");
		
		// encoding (web.xml에 필터 설정(자동처리)
		// 전달된 정보(parameter) 저장 BoardDTO 객체 저장 
		BoardDTO dto = new BoardDTO();
		dto.setBno(Integer.parseInt(request.getParameter("bno")));
		dto.setName(request.getParameter("name"));
		dto.setPass(request.getParameter("pass"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setRe_ref(Integer.parseInt(request.getParameter("re_ref")));
		dto.setRe_lev(Integer.parseInt(request.getParameter("re_lev")));
		dto.setRe_seq(Integer.parseInt(request.getParameter("re_seq")));
		dto.setIp(request.getRemoteAddr());
		String pageNum = request.getParameter("pageNum");
		
		//BoardDAO 객체 생성
		BoardDAO dao = new BoardDAO();
		
		// 답글쓰기 메서드 호출 
		dao.reInsertBoard(dto);
		
		// 페이지 이동 
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo?pageNum" + pageNum);
		forward.setRedirect(true);
		
		return forward;
	}

}
