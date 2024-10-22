package com.itwillbs.member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

/**
 * MemberFrontController '회원관리'의 모든 동작요청을 처리하는 객체 Servlet의 형태로 구현
 * 
 * http://localhost:8088/MVC7/*.me
 * 
 */
// 빈화면은 mapping이 된 controller 
public class MemberFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("C: Get/Post방식 모두 처리");
		System.out.println("Controller: MemberFrontController_doProcess() 실행");

		System.out.println("C: ----------------1. 가상주소 계산 - 시작---------------------");
		// URI /MVC7/itwillbs.me
		// URL http://localhost:8088/MVC7/itwillbs.me

		// 실행중인 가상주소를 가져오기
		String requestURI = request.getRequestURI();
		System.out.println("C: reqeustURI: " + requestURI);

		// 실행중인 프로젝트명 가져오기
		String CTXPath = request.getContextPath();
		System.out.println("C: CTXPath: " + CTXPath);
		// 최종 계산(프로젝트명을 제거한 주소)주소
		String command = requestURI.substring(CTXPath.length());
		System.out.println("C: command: " + command);
		System.out.println("C: ----------------1. 가상주소 계산 - 끝----------------------");

		System.out.println("C: ----------------2. 가상주소 매핑 - 시작---------------------");

		Action action = null;

		// 페이지 이동정보 저장객체
		ActionForward forward = null;

		if (command.equals("/MemberJoin.me")) {
			System.out.println("C: /MemberJoin.me Mapping");
			// 사용자가 정보를 입력할 수 있는 페이지를 연결
			System.out.println("C: Pattern1 - 데이터처리(DB사용 x), 뷰페이지 이동o");

			// ActionForward 객체 생성
			forward = new ActionForward();
			forward.setPath("./member/insertForm.jsp");
			forward.setRedirect(false); // forward 방식으로 이동

			System.out.println("C: 티켓확인: " + forward.toString());
		} else if (command.equals("/MemberJoinAction.me")) {
			System.out.println("C: /MemberJoinAction.me 매핑");
			System.out.println("C: Pattern2 - 데이터처리(DB사용) - O, 페이지 이동 - O");

			// MemberJoinAction() 객체를 생성
			// MemberJoinAction mja = new MemberJoinAction();
			action = new MemberJoinAction(); // Up Casting
			try {
				// forward = mja.execute(req, resp);
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				}
		} else if (command.equals("/MemberLogin.me")) {
			System.out.println("C: /MemberLogin.me 매핑");
			System.out.println("C: 패턴1 - 데이터처리(DB사용) - x, 뷰페이지 이동 - O");

			// ActinonForward 객체 생성
			forward = new ActionForward();
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false); //forward방식으로 이동 

			System.out.println("C: " + forward);
		} else if (command.equals("/MemberPassword.me")) {
			System.out.println("C: /MemberPassword.me mapping");
			System.out.println("C: Pattern3 - 데이터처리(DB) - O, 페이지 forwading");
			action = new MemberIdAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		} else if (command.equals("/MemberLoginAction.me")) {
			System.out.println("C: /MemberLoginAction.me mapping");
			System.out.println("C: Pattern2 - 데이터처리(DB) - O, 페이지 이동 - O");

			// MemberLoginAction() 객체 생성
			// MemberLoginAction mla = new MemberLoginAction();
			// Action action = new MemberLoginAction(); //Up Casting
			action = new MemberLoginAction();
			try { // 여기 forward의 값은??
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Main.me") || command.equals("/main.me")) {
			System.out.println("C: /Main.me 매핑");
			System.out.println("C: Pattern1 - 데이터처리(DB) - x, 뷰페이지 이동 - O");

			forward = new ActionForward();
			forward.setPath("./member/main.jsp");
			forward.setRedirect(false);
		} else if (command.equals("/MemberLogout.me")) {
			System.out.println("C: /MemberLogout.me 매핑");
			System.out.println("C: 패턴2 - 데이터처리(DB) - O(only data), 페이지 이동 - O");

			// MemberLogoutAction() 객체 생성
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberInfo.me")) {
			System.out.println("C: /MemberInfo.me 매핑");
			System.out.println("C: 패턴3 - 데이터처리(DB) - O(only data), 페이지 출력");

			// MemberInfoAction() 객체 생성
			action = new MemberInfoAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/MemberUpdate.me")) {
			System.out.println("C: /MemberUpdate.me 매핑");
			System.out.println("C: 패턴3 - 데이터처리(DB) - O(only data), 페이지 출력");

			// MemberUpdateAction() 객체 생성
			action = new MemberUpdateAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberUpdatePro.me")) {
			System.out.println("C: /MemberUpdatePro.me 매핑");
			System.out.println("C: 패턴2 - 데이터처리(DB) - O(only data), 페이지 이동 O");

			// MemberUpdateProAction() 객체생성
			action = new MemberUpdateProAction();

			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/MemberDelete.me")) {
			System.out.println("C: /MemberDelete.me 매핑");
			System.out.println("C: 패턴1 - 데이터처리(DB) - X, 페이지 이동 O");
			
			forward = new ActionForward();
			forward.setPath("./member/deleteForm.jsp");
			forward.setRedirect(false);
				
		} else if (command.equals("/MemberDeleteAction.me")) {
			System.out.println("C: /MemberDeleteAction.me 매핑");
			System.out.println("C: 패턴2 - 데이터처리(DB) - O, 페이지 이동 O");
			
			// MemberDeleteAction 객체 생성 
			action = new MemberDeleteAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/MemberList.me")) {
			System.out.println("C: /MemberList.me 매핑");
			System.out.println("C: 패턴3 - 데이터처리(DB) - O, 페이지 출력 - O");
			
			// MemberListAction() 객체 
			action = new MemberListAction();
			
			// execute() 호출
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
	}// doProcess

	// option + shift + v
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Controller: MemberFrontController_doGet() 실행");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Controller: MemberFrontController_doPost() 실행");
		doProcess(request, response);
	}

}
