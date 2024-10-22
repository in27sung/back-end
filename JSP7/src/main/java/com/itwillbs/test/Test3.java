
package com.itwillbs.test;

// 인터페이스: 인스턴스 생성 불가
interface InterAbs{
	// 변수 사용 x, 상수만 사용 가능 
	int a = 200;
	final int b = 100;
//	int c; (x)
	/*final*/int c = 50; //(o)
	
	// method body 입력 불가 
	public/*abstract*/void method1(); // abstract method
	
	/*public abstract*/void absMethod1(); // abstract method
	
	// -> 인터페이스 안에 모든 메서드는 추상 메서드이며  
	//	  접근제어자는 public 이다 
}

//class InterClass extends InterAbs{} //The type InterAbs cannot be the superclass of InterClass; a superclass must be a class
/**
 * extends: 클래스간의 상속에서 사용, 확장 개념 
 * implements: 인터페이스와 클래스간의 상속에서 사용, 이행(시행)
 */
class InterClass implements InterAbs{ //중복 상속? implements 가능 

	// 추상메서드를 오버라이딩 해야만 사용가능 
	@Override
	public void method1() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void absMethod1() {
		// TODO Auto-generated method stub
		
	}
	
}

// abstract class(abstract keyword 포함)
abstract class AbsClass{
	int a = 100;
	final int b = 200;
	public void method1() {
		System.out.println("method1");
	}
	//method(body({}) x, abstract keyword 포함) 
	public abstract void absMethod1();
	
}

class AbsClass2 extends AbsClass{
	// 추상클래스를 상속하면 추상클래스의 추상메서드를 구현(오버라이딩)해야함 
	// -> 강제성을 가지고 있음 
	// option + shift + v
	@Override
	public void absMethod1() {
		// TODO Auto-generated method stub
		
	}
	
}
public class Test3 {

	public static void main(String[] args) {
		// 클래스: 객체를 생성하기위한 도구 
		// 추상클래스: 객체를 생성하지 못하는 클래스
		//			why? 인스턴스 생성(new) 실행 x 
		// 			-> 추상메서드 포함하는 클래스 
		// * 추상 메서드: 실행하는 코드가 없는(메서드 바디가 없는) method 
		// interface: 객체를 생성하기위한 도구 
		
		// Cannot instantiate the type AbsClass
//		AbsClass abs = new AbsClass(); // 인스턴스 생성할 수 없음 
		// -> 자생능력 x 
		
		AbsClass2 abs = new AbsClass2(); // (o)
		// 추상클래스를 상속하는 서브클래스는 생성 가능 
		
				
	} // main()

} // class Test3
