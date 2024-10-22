package com.itwillbs.test;

public class MainTest {
	
	// Method signature (컴파일러가 메서드를 구분하는 요소)
	// 1) 이름 
	// 2) 메서드의 전달인자의 갯수
	// 3) 메서드의 전달인자의 타입
	
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

	public static void main(String[] args) {
		

		System.out.println("자바 코드 실행!");
		
		System.out.println("1. 변수: 데이터를 저장");
		
		String name = "ITWILL";
		int koreanScore = 87;
		int englishScore = 88;
		int mathScore = 92;
		int sum = koreanScore + englishScore + mathScore;
		
		// 학생의 점수 총합 계산 
		System.out.println(name + "의 점수 총합: " + sum + "점");
		
		System.out.println("2. Method: 실행문을 저장(한번에 실행)");
		
		studentInfo(name, koreanScore, englishScore, mathScore);
		
		System.out.println("3. Object(Class): variable + method");
		
		//학생정보를 저장하는 객체 생성 
		StudentBean kim = new StudentBean();
		
		kim.setName("김학생");
		kim.setKoreanScore(99);
		kim.setMathScore(98);
		kim.setEnglsihScore(89);
		
		//학생의 점수의 총합 출력 
		studentInfo(kim.getName(),kim.getEnglsihScore(), kim.getKoreanScore(), kim.getMathScore());
		System.out.println("--------------------------------------------------------------------");
		studentInfo(kim);
		// 메서드 자체를 객체로 분리 
		System.out.println("4. Object(class): method only");
		
		MyCalculator.studentInfo(kim);//(o)
		
		//static: 객체가 필요없이 사용할 수 있는 method 
		MyCalculator cal  = new MyCalculator(); //f3을 통해 원래 위치로 이동 가능 
		cal.studentInfo(kim); //(x)
		
		cal.studentInfo(name, koreanScore, englishScore, mathScore);
	}

}
