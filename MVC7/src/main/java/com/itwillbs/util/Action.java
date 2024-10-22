package com.itwillbs.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	
	// 추상메서드 구현 => 상속을 통해 해당 메서드를 사용하게 하기위해서 (강제성)
	
	//public /*abstract*/ ActionForward execute();
	/**
	 * 	실행 결과로 ActionForward객체(티켓) 를 리턴
	 */
	public ActionForward execute(HttpServletRequest request,
			                    HttpServletResponse response) throws Exception; 
	
	
}
