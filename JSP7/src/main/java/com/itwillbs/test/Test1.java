package com.itwillbs.test;

// final: 상속 불가 
class Parent /* extends Object */{ //superclass: the class being inherited from 
	public void pprn() {
		System.out.println("P - pprn()");
	}
}// class Parent

class Child extends Parent{ // subclass: the class that inherits from another class 
	public void cprn() {
		System.out.println("C - cprn()");
	}
	// method overRiding : 부모의 메서드를 복수해서 내용을 바꿈(재정의)
	// -> 부모의 메서드를 그대로(파라메터 없이) 재정의(이름, 타입, 개수)
	// -> 부모의 메서드는 은닉됨 
	@Override
	public void pprn() {
		System.out.println("C - pprn()");
	}
}// class Child 

public class Test1 {

	public static void main(String[] args) {
		// Inheritance(상속): parent(superclass)로 부터 물려받아서 사용가능하게 하는것
		//					 extends 키워드를 사용해서 부모 객체를 상속 받는다.
		
		Parent p = new Parent();
		p.pprn();
		System.out.println(p);

//		p.cprn(); The method cprn() is undefined for the type Parent  
		
		System.out.println("-----------------------------------------------");
		
		Child c = new Child();
		System.out.println(c);
		c.cprn();
		c.pprn();
		
		System.out.println("-----------------------------------------------");
		System.out.println("Type Casting(형변환)");
		/*
		 * Primitive Data Types - 기본형(8) 
		 * byte(1) short(2) char(2) int(4) long(8) float(4) double(8) boolean(1)
		 *  
		 * Widening Casting(automatically): 묵시적 형변환
		 * - 메모리공간이 작은곳 -> 큰곳으로 자동 형변
		 */
			long l;
			int i = 100;
			l = i; // 자동형변환 
			
		 /* Narrowing Casting(manually): 명시적 형변환 
		 * - 메모리공간 큰곳 -> 작은 곳으로 강제로 형변환 
		 * 
		 */
			long l2 = 100L;
			int i2;
			i2 = (int)l2; //Type mismatch: cannot convert from long to int
			// (int) 컴파일러에게 메세지를 전달 
			// 지금 문제상황을 개발자가 인지하고 있고, 
			// 그럼에도 불구하고 변환을 하겠다. 
			
			long kd = l2 * i;
			System.out.println(kd);
			
		//reference types - 참조형
		// 반드시 상속관계에서만 사용가능 
		// Up Casting(Automatically): 참조형 묵시적
		// -> 자식 클래스(Sub class)가 부모 클래스(Super Class)형태로 변환 
		Parent p1 = new Child();
		Child c1 = new Child();
		p1 = c1; 
		p1.pprn();
		
		//hidden memory
//		p1.cprn(); // The method cprn() is undefined for the type Parent
		// 업캐스팅을 진행하면 cprn()는 은닉 된다 
		// -> 업캐스팅을 진행하면 상속받은 부분만 사용 가능 
		// -> 참조영역이 축소된다. 
		
		// Down Casting*manually): 참조형 명시적
		// -> 부모 클래스가 자식 클래스형태로 변환 
		
//		Child c2 = new Parent(); Type mismatch: cannot convert from Parent to Child
		// -> cprn()정보가 없으므로 실행시 Compile Error 발생 
		
//		Child c2 = (Child)new Parent();
//		c2.pprn();
//		c2.cprn();
		// -> 실행시 에러(예외)가 발생 
		
		// Type Casting: 1) compile Error 2)예외(실행시 오류)
		
		// Safe Down Casting(안전한 다운캐스팅)
		Parent p3 = new Child(); // Up Casting 
		
//		Child c3 = p3; // Down Casting -> 실행전에 cprn이 있는지 없는지 알 수 없음(컴파일 에러)
		Child c3 = (Child)p3; // Down Casting
		
		c3.pprn();
		c3.cprn();
		
		// * Object클래스는 모든 클래스의 부모객체 
		// -> 모든 클래스는 Object를 상속한다 
		// 클래스에 특정 클래스를 상속하는 코드가 없다면 extends Object 코드를 생략한것과 같다. 
		
		// session.setAttribute(String, Object);
		
		// Object o = new String();
		
		// String id = (String) session.getAttribute("id");
		
		System.out.println("------------------------------------------");
		
		Parent p4 = new Parent();
		p4.pprn();
		
		Child c4 = new Child();
		c4.pprn();
		
		Parent p5 = new Child(); // OverRiding
		p5.pprn();
		// Method overRiding(우선적용) > 업캐스팅,다운캐스팅
		// -> 항상 오버라이딩된 메서드만 실행 
		
		Child c5 = (Child) p5;
		c5.pprn();
	}//main

}// class Test1

