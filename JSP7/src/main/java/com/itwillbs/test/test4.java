package com.itwillbs.test;

public class test4 {
	
	// 지금 당장 예외처리를 안하고, 나(메서드)를 실행시키는 곳에서 
	// 예외처리를 하게하는 처리방법 -> throws 
	public static void method() throws Exception{
		int c = 10 / 0; // 실행시 에러 -> 예외 
		System.out.println("c: " + c);
	}
	public static void main(String[] args) {
		// 예외 처리: 예상하지 못한 에러를 처리하는 방법 
		//			-> 자바에서는 예외를 '객체'로 표현 
		
		System.out.println("시작");
		
		int a = 10;
		int b = 0;
//		int b = 2; // 에러 확인후 업데이트 
//		int b = "A"; // 컴파일 에러 
		
//		int c = a / b; // 실행시 에러: 예외 
		if (b == 0) {
			System.out.println("if: 예외 발생!! 0으로 나눌수 없음");
		}
		else {
			int c = a / b; // 실행시 에러 -> 예외 
			System.out.println("c: " + c);
		}
		
		// try-catch 블럭: 예외처리 방법
		try {
			//예외가 발생할지도 모르는 코드 
		} catch (Exception e) { // click + f4
			// 예외 객체 정보를 출력 
		}
		finally {
			// 예외 발생여부와 상관없이 무조건 한번 실행하는 코드 
		}
		
		try {
			int c = a / b; // 실행시 에러: 예외 
			System.out.println("c: " + c);
		} catch (Exception e) {
			System.out.println("try-catch: 예외발생!");
			e.printStackTrace();
		}
		try {
			method();			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
//		int c = a / b; // 실행시 에러: 예외 
		
		System.out.println("끝");
		
		
	}

}
