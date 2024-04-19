package com.itwillbs.Test;

public class Test2 {
	public static void main(String[] args) {
		// 에러: 컴파일 오류
		// 예외: 실행 후 오류
		
		System.out.println("시작");

		int a = 10;
		int b = 0;
		
//		if (b != 0) {
//			int c = a / b;
//			System.out.println(c);
//		}
		
		
		// * 프로그램의 정상 종료를 위해서 사용
		try {							// 예외가 발생할지도 모르는 코드를 작성
			int c = a / b;
			System.out.println(c);
		}catch (Exception e) {			// 예외 처리를 수행하는 코드를 작성
			e.printStackTrace();
		}finally {						// 예외 발생 여부와 관계없이 한 번 실행하는 코드
			
		}

		System.out.println("끝");
	}
}
