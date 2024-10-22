package com.itwillbs.board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Model: BoardListAction_execute() 실행");
		
		// 디비에 접근해서 저장된 게시판 글 정보를 모두 가져오기 
		// BoarDDAO 객체 생성 
		BoardDAO dao = new BoardDAO();
		
		// 1) 디비에 저장된 글이 있는지 없는지 체크 
		int count = dao.getBoardCount();
		System.out.println("M: count = " + count + "개");
		/******************************Paging Process1******************************************/
		// 페이지에 원하만큼의 글을 출력 

		// 한 페이지에 출력할 글의 개수 
		 int pageSize = 10;
		 // 현 페이지가 몇페이지인지를 체크
		 String pageNum = request.getParameter("pageNum");
		 if(pageNum == null) {
			 pageNum = "1";
		 }
		
		 // 시작 행번호 계산하기 1	11	21	31	41 ...
		 int currentPage = Integer.parseInt(pageNum);
		 // Arithmetic sequence: an = a + (n-1)d  
		 int startRow = (currentPage - 1) * pageSize + 1;
		 // 1 + (currentpage - 1)pagesize 
//		 int startRow = ((currentPage - 1) * pageSize) + 1; 
		 
		 // 끝 행번호 계산하기 10	20	30	40	50 ...
		 int endRow = currentPage * pageSize;
		 // 시작 행번호 계산하기 
		 
		/******************************Paging Process1******************************************/
		// 2) 글이 있을 때 저장된 글 정보 모두를 가져오기 
		ArrayList boardList = null;
		if(count != 0) {
//			boardList = dao.getBoardList();
			// getBoardList overloading
			boardList = dao.getBoardList(startRow, pageSize);
			System.out.println("M: 리스트 사이즈: " + boardList.size());// 만약 0이면 예외발생 if문 안에 넣기 
		}
	
		/******************************Paging Process2******************************************/
		// -> 페이지 하단에 페이지정보를 출력(paging block)
		
		// 전체 페이지수 계산 
		int pageCount = count / pageSize + (count % pageSize == 0? 0:1);
		
		// 한 화면에 보여줄 페이지의 개수(블럭의 크기)
		int pageBlock = 5;
		
		// 페이지 블럭의 시작 페이지 번호 계산 1 ~ 10 -> 1, 11~20 -> 11, 21~30 -> 21
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		
		// 페이지 블럭의 마지막 페이지번호 계산 1~10 -> 10, 11~20 -> 20
		int endPage = startPage + pageBlock - 1;

		// 페이지블럭의 사이즈보다 글이 적을 때 
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		
		/******************************Paging Process2******************************************/

		
		// 데이터를 reqeust 영역에 저장 
		request.setAttribute("boardList", boardList);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("count", count);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pageBlock", pageBlock);		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		
		System.out.println("M: request 영역에 정보 저장");
		
		//본문 조회수 증가 가능하도록 상태 변경
		HttpSession session = request.getSession();
		session.setAttribute("updateCheck", true);
		
		// 연결된 뷰페이지(jsp)에 전달해서 출력
		ActionForward forward = new ActionForward();
		forward.setPath("./board/boardList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
