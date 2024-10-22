package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M: BoardWriteAction_execute() 실행");
		
		// encoding -> 폼태그를 POST방식으로 전달하면 한글이 깨짐 
		//request.setCharacterEncoding("UTF-8");
		
		// 전달된 정보(파라미터) 저장 BoardDTO 객체 저장
		BoardDTO dto = new BoardDTO();
		dto.setName(request.getParameter("name"));
		dto.setPass(request.getParameter("pass"));
		dto.setSubject(request.getParameter("subject"));
		dto.setContent(request.getParameter("content"));
		// 프로젝트 우클릭> run as > run configurations > tomcat / Arguments 메뉴 / VM arguments
		// -Djava.net.preferIPv4Stack=true
		dto.setIp(request.getRemoteAddr());

		// DTO 정보 출력 
		System.out.println("M: 입력한 글 정보" + dto);
		
		// 디비에 전달받은 정보를 저장
		// BoardDAO 객체
		BoardDAO dao = new BoardDAO(); 
		
		// 글쓰기 메서드 호출
		dao.createBoard(dto);
		
		// 페이지 이동준비
		ActionForward forward = new ActionForward();
		forward.setPath("./BoardList.bo");
		forward.setRedirect(true);
		
		return forward;
	}

}
