package com.itwillbs.util;

/**
 * ActionForward
 *  - MVC 패턴에서 페이지를 이동할때 필요한 정보를 저장하는 객체
 *  - 이동할 주소, 이동방식
 *  => 비행기 티켓(탑승권) 
 */
public class ActionForward {
	
	private String path;	// 이동할 페이지 주소(목적지)
	private boolean isRedirect;		//이동방식 (탑승방식,직항/환승)
					//  true - sendRedirect() 방식으로 이동
					//  false - forward() 방식으로 이동
	
	public ActionForward() {
		System.out.println(" 페이지 이동정보를 저장하는 객체 ");
		System.out.println(" 목적지,탑승방식이 작성되는 티켓 생성 (초기화) ");
	}
	
	// alt shift s + r  => get/set 메서드 생성
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() { // get()동작
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	// alt shift s + s
	
	@Override
	public String toString() {
		return "ActionForward(티켓) [path(목적지)=" + path 
				             + ", isRedirect(탑승방법)=" + isRedirect + "]";
	}
	

}// class
