package com.itwillbs.Test;

/**
 * 계산기 클래스
 * 	기능1: 총점 계산
 *  기능2: 평균 계산
 */
public class Calc {
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
}
