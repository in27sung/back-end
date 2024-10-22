package com.itwillbs.board.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class BoardFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Controller: BoardFrontController_doProcess() 실행");
		System.out.println("C: Get/Post방식 모두 처리");

		System.out.println("Controller: ----------------1. 가상주소 계산 - 시작---------------------");
		// URI /MVC7/itwillbs.bo
		// URL http://localhost:8088/MVC7/itwillbs.bo

		// 실행중인 가상주소를 가져오기
		String requestURI = request.getRequestURI();
		System.out.println("C: reqeustURI: " + requestURI);

		// 실행중인 프로젝트명 가져오기
		String CTXPath = request.getContextPath();
		System.out.println("C: CTXPath: " + CTXPath);
		// 최종 계산(프로젝트명을 제거한 주소)주소
		String command = requestURI.substring(CTXPath.length());
		System.out.println("Controller: command: " + command);
		System.out.println("C: ----------------1. 가상주소 계산 - 끝----------------------");

		System.out.println("C: ----------------2. 가상주소 매핑 - 시작---------------------");
		Action action = null;
		ActionForward forward = null;

		if (command.equals("/BoardWrite.bo")) {
			System.out.println("Controller: /BoardWrite.bo 매핑");
			System.out.println("C: pattern1 - 데이터처리(DB) - X, 페이지 이동 - O");

			// ActionForward객체 생성
			forward = new ActionForward();
			forward.setPath("./board/insertBoard.jsp");
			forward.setRedirect(false);

		} else if (command.equals("/BoardWriteAction.bo")) {
			System.out.println("Controller: /BoardWriteAction.bo mapping");
			System.out.println("C: Pattern2 - 데이터처리(DB) - X, PageMove - O");

			// BoardWriteAction() 객체 생성
			action = new BoardWriteAction();
			
			// execute() 호출
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/BoardList.bo")) {
			System.out.println("Controller: /BoardList.bo mapping");
			System.out.println("C: Pattern3 - 데이터처리(DB) - O, PageForward");
			
			// BoardListAction() 객체 생성 
			action = new BoardListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/BoardContents.bo")) {
			System.out.println("Controller: /BoardContents.bo mapping");
			System.out.println("C: Pattern3: 데이터처리(DB) - O, PageForward");
			
			// BoardContentsAction() 객체 생성 
			action = new BoardContentsAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/BoardUpdate.bo")) {
			System.out.println("Controller: /BoardUpdate.bo mapping");
			System.out.println("C: Pattern3: DataLogic - O, pageForward");
			
			// BoardUpdateAction() 객체 생성
			action = new BoardUpdateAction();
			
			// execute() 메서드 호출
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/BoardUpdatePro.bo")) {
			System.out.println("C: /BoardUpdatePro.bo mapping");
			System.out.println("C: Pattern2 - DataPro - O, pageMapping - O");
			
			// Declare BoardUpdatePro object
			action = new BoardUpdateProAction();
			
			// execute() method 호출
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/BoardDelete.bo")) {
			System.out.println("C: /BoardDelete.bo mapping");
			System.out.println("C: Pattern1 - DataPro - X, pageMapping - O");
			
			forward = new ActionForward();
			forward.setPath("./board/deleteBoard.jsp");
			forward.setRedirect(false);
			
		} else if(command.equals("/BoardDeleteAction.bo")) {
			System.out.println("C: /BoardDeleteAction.bo mapping");
			System.out.println("C: 패턴2 - 데이터처리(DB) - O, 페이지 이동 O");	
			
			// Declare BoardDeleteAction object
			action = new BoardDeleteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/BoardReWrite.bo")) {
			System.out.println("C: /BoardReWrite.bo mapping");
			System.out.println("C: Pattern1: DataLogic - X, 페이지 이동 O");
			
			forward = new ActionForward();
			forward.setPath("./board/reInsertBoard.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/BoardReWriteAction.bo")) {
			System.out.println("C: /BoardReWriteAction.bo mapping");
			System.out.println("C: Pattern2: DataLogic - O, 페이지 이동 O");
			
			action = new BoardReWriteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/BoardFileWrite.bo")) {
			System.out.println("C: /BoardFileWrite.bo Mapping");
			System.out.println("C: Pattern1: DataLogic - X, Page move - O");
			
			forward = new ActionForward();
			forward.setPath("./board/insertFileBoard.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/BoardFileWriteAction.bo")) {
			System.out.println("C: /BoardFileWriteAction.bo Mapping");
			System.out.println("C: Pattern2: DataLogic - O, Page move - O");
			
			// BoardFileWriteAction() 객체 생성 
			action = new BoardFileWriteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("C: ----------------2. 가상주소 매핑 - 끝----------------------");

		System.out.println("C: ----------------3. 가상주소 이동 - 시작---------------------");
		if (forward != null) { // 페이지 이동정보가 담겨있음

			if (forward.isRedirect()) { // true
				System.out.println("C: 방식: " + forward.isRedirect() + ", 주소: " + forward.getPath());
				System.out.println("C: 페이지 이동 완료");
				response.sendRedirect(forward.getPath());
			} else { // false
				System.out.println("C: 방식: " + forward.isRedirect() + ", 주소: " + forward.getPath());
				System.out.println("C: 페이지 이동 완료");
				request.getRequestDispatcher(forward.getPath()).forward(request, response);
			}

		}
		System.out.println("C: ----------------3. 가상주소 이동 - 끝----------------------\n\n");

	}

	// option + shift + v
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("C: BoardFrontController_doGet() 호출");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("C: BoardFrontController_doPost() 호출");
		doProcess(request, response);
	}

}
