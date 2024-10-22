package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.itwillbs.util.JSMoveFunction;

public class BoardUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: BoardUpdateProAction_execute() 실행");
		
		// 한글 처리 -> 생략(web.xml필터 설정)
		// 전달된 정보(파라메터) 저장 		
		BoardDTO dto = new BoardDTO();
		
		String pageNum = request.getParameter("pageNum");
		dto.setBno(Integer.parseInt(request.getParameter("bno")));
		dto.setName(request.getParameter("name"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		dto.setPass(request.getParameter("pass"));
		
		System.out.println("M: 전달받은 정보(" + dto + ")");	

		// 디비 연결 -> 전달된 정보 사용해서 정보 수정 
		BoardDAO dao = new BoardDAO();

		int result = dao.updateBoard(dto);

		// 수정 처리 결과에 따른 페이지 이동(JS)		
		if (result == -1) {
			System.out.println("M: 공통기능 JSMoveFunction객체 사용");
			JSMoveFunction.alertAndBack(response, "게시판 글 정보 없음");
			return null;
		}
		if (result == 0) {
			System.out.println("M: 공통기능 JSMoveFunction객체 사용");
			JSMoveFunction.alertAndBack(response, "비밀번호 오류");
			return null;
		}
		
		System.out.println("M: 공통기능 JSMoveFunction객체 사용");
		JSMoveFunction.alertAndLocation(response, "요청글 수정 완료", "./BoardList.bo?pageNum="+ pageNum);
		return null;
		
	}

}
