package com.itwillbs.test;

/**
 * javaDocument 주석  
 * 학생의 정보를 저장하는 Class(object)
 * 이름, 국어, 영어, 수학 점수 저장
 */
public class StudentBean {//Bean: 객체 
	// private: 클래스 안에서만 사용가능 함 
	private String name;
	private int koreanScore;
	private int englsihScore;
	private int mathScore;

	public StudentBean() { 
		// (기본)생성자: 클래스와 이름이 같고, return타입이 없는 method
		// 객체의 정보를 초기화 할 때 
//		this.name = null;
//		this.koreanScore = 0;
//		this.englsihScore = 0;
//		this.mathScore = 0;
	}
	//** 객체 생성시 오버로딩된 생성자가 없는 경우 컴파일러가 자동으로 기본생성자를 만들어줌 
	
	// get/set method
	public String getName() { //private과 get/set 다시 공부
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKoreanScore() {
		return koreanScore;
	}
	public void setKoreanScore(int koreanScore) {
		this.koreanScore = koreanScore;
	}
	public int getEnglsihScore() {
		return englsihScore;
	}
	public void setEnglsihScore(int englsihScore) {
		this.englsihScore = englsihScore;
	}
	public int getMathScore() {
		return mathScore;
	}
	public void setMathScore(int mathScore) {
		this.mathScore = mathScore;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

// StudentBean sBean = new StudentBean();
// sBean.name = "ITWILL"; (X)