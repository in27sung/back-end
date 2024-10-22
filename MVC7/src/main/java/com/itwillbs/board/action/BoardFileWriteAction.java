package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardFileWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: BoardFileWriteAction_execute() 실행");

		// 파일정보 업로드 (먼저 진행 - 예외상황)
		// 1) /webapp/upload 폴더 생성 
		// 2) 실제 파일이 저장되는 경로 (realPath)
		String realPath = request.getRealPath("/upload");
		System.out.println("M: realPath: " + realPath);
		
		// 3) 저장된 파일의 크기 설정(5MB)
		int maxSize = 5 * 1024 * 1024;
		
		// 4) 파일 업로드 (MultipartRequest 객체 생성)
		MultipartRequest multi
			= new MultipartRequest(
					request, 
					realPath,
					maxSize,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);
		System.out.println("M: 파일 업로드 성공");
		
		// 한글처리 인코딩(생략) form.xml mapping 
		
		// 전달된 정보(파라미터) 저장 
		// BoardDTO 객체 생성
		BoardDTO dto = new BoardDTO();
		
//		dto.setName(request.getParameter("name")); // X 폼태그 형태가 변경
		dto.setName(multi.getParameter("name"));
		dto.setPass(multi.getParameter("pass"));
		dto.setSubject(multi.getParameter("subject"));
		dto.setContent(multi.getParameter("content"));
		dto.setFile(multi.getFilesystemName("file"));
		dto.setIp(request.getRemoteAddr());
		
		// 글정보를 DB에 저장
		BoardDAO dao = new BoardDAO();
		
		// 파일업로드가 포함된 글쓰기 실행 
		dao.createBoard(dto);
		
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		
		return forward;
	}

}
