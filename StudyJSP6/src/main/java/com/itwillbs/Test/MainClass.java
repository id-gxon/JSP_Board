// 일반적으로 package는 회사의 도메인 주소를 사용
// http://www.itwillbs.com > com.itwillbs.페키지명
package com.itwillbs.Test;

class Test {
	// variable - 1) 선언 2)초기화 3)사용
	private String name;
	private int age;

	// 생성자 - 객체 초기화(변수의 기본값)
	public Test() {

	}

	// ALT + SHIFT + s + r >> lombok 라이브러리
	// 변수값 수정
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	// method
	public void sayHello() {
		System.out.println("Hello!");
	}

}

class Student {
	private String name;
	private int kor;
	private int eng;
	private int math;

	// 오버로딩된 생성자가 없을 경우 컴파일러가 기본 생성자를 자동으로 생성
	public Student() {}

	public Student(String name, int kor, int eng, int math) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

}

//public class: top level 클래스, 메인 메서드를 포함하는 클래스
public class MainClass {

	public static void method(String name) {
		System.out.println(name + "1");
		System.out.println(name + "2");
		System.out.println(name + "3");
	}

	// 총점 - sum / 전달인자 3개 / 결과 리턴 / static
	public static int sum(int kor, int eng, int math) {
		return kor + eng + math;
	}
	
	public static int sum(Student s) {
		return s.getKor() + s.getEng() + s.getMath();
	}

	// 평균 - avg / 전달인자 3개 / 결과 리턴 x 출력 o / non-static
	public void avg(int kor, int eng, int math) {
		Double avg = sum(kor, eng, math) / 3.0;
		System.out.println("method avg: " + avg);
	}
	
	public void avg(Student s) {
		System.out.println(sum(s.getKor(), s.getEng(), s.getMath()) / 3.0);
	}

	public static void main(String[] args) {
		// 직접 데이터 출력 > 다양한 활용이 어려움
		System.out.println("itwill");

		// variable: 데이터를 저장해서 사용
		String name = "itwill";
		System.out.println(name);

		// method: 여러 개의 명령어를 저장해서 사용
		System.out.println(name + "1");
		System.out.println(name + "2");
		System.out.println(name + "3");

		method(name);

		int kor = 90;
		int eng = 77;
		int math = 88;

		// 점수의 총합 / 평균 계산 출력
		int sum = kor + eng + math;
		Double mean = sum / 3.0;

		System.out.println("총점: " + sum + "점\n평균: " + mean + "점");

		// 총점, 평균 계산 method
		System.out.println("method sum: " + MainClass.sum(kor, eng, math));

		MainClass mc = new MainClass();
		mc.avg(kor, eng, math);
		
		Student s = new Student();
		s.setKor(kor);
		s.setEng(eng);
		s.setMath(math);
		
		System.out.println(sum(s));
		mc.avg(s);
		
		System.out.println("Calc 총점: " + Calc.sum(s));
		Calc c = new Calc();
		c.avg(s);
	}

}
