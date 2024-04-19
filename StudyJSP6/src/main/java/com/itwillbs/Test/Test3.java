package com.itwillbs.Test;

// 객체(Object): 모든 대상 

// Class: 객체 생성을 위한 도구
class Person {
	// Variable - attribute
	private String name;
	private int birth;

	// Constructor(생성자)
	public Person() {

	}

	// Method Overloading: 동일한 이름의 method를 사용
	public Person(String name, int birth) {
		this.name = name;
		this.birth = birth;
	}

	public String getName() {
		return name;
	}

	public int getBirth() {
		return birth;
	}

	// Method
	public void study() {

	}

}

// 상속(Inheritance): 부모 객체의 정보를 사용할 수 있게 되는 것(부모 자식 관계 생성)
class Parent {
	public void pprn() {
		System.out.println("P - pprn() 호출");
	}
}

class Child extends Parent {
	public void cprn() {
		System.out.println("C - cprn() 호출");
	}
}

public class Test3 {

	public static void main(String[] args) {

		// Java는 기본적으로 다른 타입의 데이터를 저장할 수 없음.

		// 자동 형변환: 메모리 공간이 작은 곳에서 큰 곳으로 이동할 때 발생하는 형변환
		// 컴파일러가 자동으로 변환
		int intNum1 = 100; // 4byte
		long longNum1; // 8byte
		longNum1 = intNum1; // 자동 형변환

		// 강제 형변환: 메모리 공간이 큰 곳에서 작은 곳으로 이동할 때 발생하는 형변환
		int intNum2; // 4byte
		long longNum2 = 100; // 8byte
		intNum2 = (int) longNum2; // 강제 형변환: 개발자가 문제 상황을 인지했지만, 진행

		Parent p1 = new Parent();
		p1.pprn();
		// p1.cprn();

		System.out.println("===============");

		Child c1 = new Child();
		c1.cprn();
		c1.pprn();

		// 참조형 타입 형변환(필수 조건: 상속 관계)

		// 업 캐스팅: 부모 클래스 타입으로 형변환
		// = 슈퍼 클래스 타입의 레퍼런스에 서브 클래스의 인스턴스를 저장하는 것
		Parent p2 = new Child();
		p2 = new Parent();

		Parent p3 = c1;
		p3.pprn();
		// p3.cprn(); 업캐스팅을 진행하면 상속 받은 부분만 사용 가능 > 참조 영역이 축소

		// Object 클래스는 모든 클래스의 최상위 객체(모든 클래스는 Object를 상속)

		System.out.println("===============");

		// 다운 캐스팅: 자식 클래스 타입으로 형변환
		// = 서브 클래스 타입의 레퍼런스에 슈퍼 클래스의 인스턴스를 저장하는 것

		// Child c2 = (Child) p1;
		// c2.cprn(); 없는 영역의 데이터에 접근해서 에러 발생 > 강제 형변환으로 책임이 넘어가서 실행 시 에러 발생
		// c2.pprn();

		// 안전한 다운 캐스팅
		Parent p4 = new Child(); // 업 캐스팅
		Child c3 = (Child) p3; // 다운 캐스팅
		c3.cprn();
		c3.pprn();
		// 은닉되어 있던 cprn() 정보를 모두 사용 가능(참조 영역의 확대)

	}

}
