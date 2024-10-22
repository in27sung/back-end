package com.itwillbs.test;

/**
 * 사용자의 정보를 사용해서 계산기능 
 * 
 */
public class MyCalculator {

	//학생 정보를 전달받아서 학생의 점수의 총합을 출력하는 Method(static)
	public static void studentInfo(String name, int score1, int score2, int score3) {
		int sum = score1 + score2 + score3;
		System.out.println(name + "의 점수 총합: " + sum + "점");
	}
		
	// Method over loading: 동일의 이름의 method를 여러개 정의하는 것 
	// (parameter의 갯수나 타입을 다르게 설정)
	public static void studentInfo(StudentBean sb) {
		int sum = sb.getEnglsihScore() + sb.getKoreanScore() + sb.getMathScore();
		System.out.println(sb.getName() + "의 점수 총합: " + sum + "점");
	}
}
