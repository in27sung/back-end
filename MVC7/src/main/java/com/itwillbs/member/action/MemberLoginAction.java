package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;
import com.itwillbs.util.Action;
import com.itwillbs.util.ActionForward;

public class MemberLoginAction implements Action{
	
	// option + shift + v
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("M: MemebrLoginction_execute() 실행");
		
		// 한글처리 인코딩 
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 사용자정보(id,pass)를 DTO객체에 저장 
		MemberDTO dto = new MemberDTO();
		
		dto.setId(request.getParameter("id"));
		dto.setPass(request.getParameter("pass"));

		// 결과 출력 
		System.out.println("M: " + dto.toString());
		//System.out.println("M: " + dto);
		
		// 디비 연결해서 사용자 정보를 가지고 로그인 여부 판단 
		
		// MemberDAO 객체 생성
		MemberDAO dao = new MemberDAO();
		
		// 로그인 여부 체크 메서드 
		int result = dao.loginMember(dto);
		System.out.println("M: result(" + result + ")");
		
		// Controller에서 처리하게 되면 여기서 회원정보 체크 후 페이지 이동만 forword로 controller에서 처리 
		// 로그인체크 결과에 따른 페이지 이동(Java Script)
		if(result == -1) {
			// 회원정보 없음 - js 사용, 페이지 이동 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			/*out.println(" <h1> 아이디 없음 </h1>");*/
			out.println("<script>");
			out.println("alert('아이디 정보가 없음!');");
			out.println("history.back();");
			System.out.println("M: 컨트롤러 없이 페이지 이동(JS)");
			out.println("</script>");
			out.close();
			return null; // 함수 종료 
		}
		
		if(result == 0) {
			// 비밀번호 오류 - jsp사용, 페이지 이동 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); //응답 페이지 
			/*out.println(" <h1> 아이디 없음 </h1>");*/
			out.println("<script>");
			out.println("alert('비밀번호 오류!');");
			out.println("history.back();");
			System.out.println("M: 컨트롤러 없이 페이지 이동(JS)");
			out.println("</script>");
			out.close();
			return null; // 함수 종료 
		}
		
		// result == 1 일때 js사용해서 페이지 이동 
		// 사용자의 아이디 정보를 세션에 저장 
		// 세션객체 생성 
		HttpSession session = request.getSession();
		
		session.setAttribute("id", dto.getId());
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter(); //응답 페이지 
		/*out.println(" <h1> 아이디 없음 </h1>");*/
		out.println("<script>");
		out.println("alert('로그인 성공');");
		out.println("location.href='./Main.me';");
		System.out.println("M: 컨트롤러 없이 페이지 이동(JS)");
		out.println("</script>");
		out.close();
		return null; // 함수 종료 
		
		
	} // execute()
	
	

}
