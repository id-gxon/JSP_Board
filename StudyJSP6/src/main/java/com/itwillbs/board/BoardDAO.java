package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * BoardDAO - Data Access Object(데이터 처리 객체) > DB 처리
 * 
 * 모든 BD 관련 동작을 수행, 항상 DB 처리를 하기 위해서는 DAO 객체가 필요함.
 */

public class BoardDAO {

	// 공통 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	// 공통 기능 선언
	private Connection getCon() throws Exception {
		// DB 연결 정보
		final String DRIVER = "com.mysql.cj.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";

		// 1. DRIVER Load
		Class.forName(DRIVER);
		System.out.println("드라이버 로드 성공");

		// 2. DB 연결
		con = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB 연결 성공");

		return con;
	}

	// 자원 해제 method - 공통기능 사용 역순으로 종료
	public void closeDB() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();

			System.out.println("DAO: 자원 해제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 글쓰기 동작 - insertBoard(BoardBean)
	public void insertBoard(BoardBean bb) /* ClassNotFoundException, SQLException */ {
		try {
			getCon();
			// 3. SQL 작성 & pstmt 객체

			// 3-1. 글 번호 계산(bno): 가장 마지막에 작성된 글번호 + 1;
			String sql = "SELECT max(bno) FROM itwill_board";
			pstmt = con.prepareStatement(sql);

			// 4. SQL 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			int bno = 0; // 글 번호

			if (rs.next()) {
				bno = rs.getInt("max(bno)") + 1;
				// getInt()의 리턴 값이 SQL null일 때 0을 리턴
				System.out.println("true");
				bno = rs.getInt(1) + 1;
			} else {
				bno = 1;
				System.out.println("false");
			}
			System.out.println("DAO: bno = " + bno);

			// 글 쓰기(INSERT)
			// 3. SQL 구문 & pstmt 객체
			sql = "INSERT INTO itwill_board(bno, name, pass, subject, content,"
					+ " readcount, re_ref, re_lev, re_seq, date, ip, file)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bno);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0); // 모든 글의 조회수는 0으로 초기화
			pstmt.setInt(7, bno); // re_ref (그룹번호) 일반 글은 항상 글 번호와 동일
			pstmt.setInt(8, 0); // re_lev (들여쓰기) 일반 글은 항상 0
			pstmt.setInt(9, 0); // re_seq (순서) 일반 글은 항상 0
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());

			// 4. SQL 실행
			pstmt.executeUpdate();
			System.out.println("DAO: 글쓰기 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// 글쓰기 동작 - insertBoard(BoardBean)

	// 전체 글 개수 조회 - getBoardCount()
	public int getBoardCount() {
		int count = 0;

		try {
			con = getCon();

			// 3. SQL 구문 & pstmt 객체
			sql = "SELECT count(bno) FROM itwill_board";
			pstmt = con.prepareStatement(sql);

			// 4. SQL 실행
			rs = pstmt.executeQuery();

			// 5. 데이터 처리
			if (rs.next()) {
				count = rs.getInt(1);
			}
			System.out.println("DAO: 전체 글 개수: " + count + "개");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return count;
	}
	// 전체 글 개수 조회 - getBoardCount()

	// 전체 글 정보를 조회 - getBoardList()
	public ArrayList getBoardList() {
		// int[] arr = new int[10]; - 고정길이 배열
		// ArrayList arr = new ArrayList(); - 가변길이 배열

		ArrayList boardList = new ArrayList();

		try {
			con = getCon();

			sql = "SELECT * FROM itwill_board ORDER BY bno desc";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();

			// 데이터 처리(ArrayList에 저장)
			// rs > BoardBean > ArrayList

			while (rs.next()) {
				BoardBean bb = new BoardBean();

				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));

				boardList.add(bb);
			}
			System.out.println("DAO: 글 목록 조회 성공");
			System.out.println("DAO: 저장된 글의 수: " + boardList.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return boardList;
	}

	public ArrayList getBoardList(int startRow, int pageSize) {
		ArrayList boardList = new ArrayList();

		try {
			con = getCon();

			sql = "SELECT * FROM itwill_board ORDER BY re_ref desc, re_seq asc limit ?, ?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, startRow - 1); // 시작행 -1
			pstmt.setInt(2, pageSize); //

			rs = pstmt.executeQuery();

			// 데이터 처리(ArrayList에 저장)
			// rs > BoardBean > ArrayList

			while (rs.next()) {
				BoardBean bb = new BoardBean();

				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));

				boardList.add(bb);
			}
			System.out.println("DAO: 글 목록 조회 성공");
			System.out.println("DAO: 저장된 글의 수: " + boardList.size());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// DB 연결 자원(리소스) 해제
			closeDB();
		}
		return boardList;
	}
	// 전체 글 정보를 조회 - getBoardList()

	// 글 정보 조회 - getBoard(bno)
	public BoardBean getBoard(int bno) {
		BoardBean bb = null;
		try {
			con = getCon();

			sql = "SELECT * FROM itwill_board WHERE bno=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				// rs > BoarddBean
				bb = new BoardBean();

				bb.setBno(rs.getInt("bno"));
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return bb;
	}
	// 글 정보 조회 - getBoard(bno)

	// 게시판 조회수 1 증가 - updateReadcount(bno)
	public void updateReadcount(int bno) {
		try {
			con = getCon();

			sql = "UPDATE itwill_board SET readcount=readcount+1 WHERE bno=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bno);

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// 게시판 조회수 1 증가 - updateReadcount(bno)

	// 게시판 내용 수정 - updateBoard(BoardBean bb)
	public int updateBoard(BoardBean bb) {
		int result = -1;
		try {
			con = getCon();

			sql = "SELECT pass FROM itwill_board WHERE bno=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bb.getBno());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (bb.getPass().equals(rs.getString("pass"))) {
					sql = "UPDATE itwill_board SET name=?, subject=?, content=? WHERE bno=?";
					pstmt = con.prepareStatement(sql);

					pstmt.setString(1, bb.getName());
					pstmt.setString(2, bb.getSubject());
					pstmt.setString(3, bb.getContent());
					pstmt.setInt(4, bb.getBno());

					result = pstmt.executeUpdate();
				} else {
					result = 0; // 비밀번호 오류
				}
			} else {
				result = -1; // 글 없음
			}
			System.out.println("DAO: 정보 수정 완료 (" + result + ")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return result;
	}
	// 게시판 내용 수정 - updateBoard(bno)

	// 게시판 내용 삭제 - deleteBoard(BoardBean bb)
	public int deleteBoard(BoardBean bb) {
		int result = -1;
		try {
			con = getCon();

			sql = "SELECT pass FROM itwill_board WHERE bno=?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bb.getBno());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (bb.getPass().equals(rs.getString("pass"))) {
					sql = "DELETE FROM itwill_board WHERE bno=?";
					pstmt = con.prepareStatement(sql);

					pstmt.setInt(1, bb.getBno());

					result = pstmt.executeUpdate();
				} else {
					result = 0; // 비밀번호 오류
				}
			} else {
				result = -1; // 글 없음
			}
			System.out.println("DAO: 정보 삭제 완료 (" + result + ")");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return result;
	}
	// 게시판 내용 삭제 - deleteBoard(BoardBean bb)

	// 게시판 답글 작성 - reInsertBoard(BoardBean bb)
	public void reInsertBoard(BoardBean bb) {
		int bno = 0;
		try {
			con = getCon();
			/* 1. 답글 번호 계산 */
			// SQL 구문 & pstmt 객체
			sql = "SELECT max(bno) FROM itwill_board";
			pstmt = con.prepareStatement(sql);

			// SQL 실행
			rs = pstmt.executeQuery();

			// data 처리
			if (rs.next()) {
				bno = rs.getInt(1) + 1;
				// bno = rs.getInt("max(bno)") + 1;
			}
			System.out.println("bno(답글): " + bno);
			/* 1. 답글 번호 계산 */

			/* 2. 답글 순서(re_seq) 수정(UPDATE) */
			// SQL 작성(UPDATE) & pstmt 객체
			// re_ref에서 원글의 re_seq보다 큰 값이 있을 때, re_seq + 1 변경하는 쿼리 작성
			sql = "UPDATE itwill_board SET re_seq=re_seq+1 WHERE re_ref=? AND re_seq>?";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());

			// SQL 실행
			int result = pstmt.executeUpdate();
			if (result >= 1) {
				System.out.println("DAO: 답글 순서 재배치 성공");
			}
			/* 2. 답글 순서(re_seq) 수정(UPDATE) */

			/* 3. 답글 작성(INSERT) */
			sql = "INSERT INTO itwill_board(bno, name, pass, subject, content, readcount, re_ref, re_lev, re_seq, date, ip, file) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, now(), ?, ?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, bno);
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, 0); // 모든 글의 조회수는 0으로 초기화
			pstmt.setInt(7, bb.getRe_ref()); // re_ref: 원글의 re_ref 값을 저장
			pstmt.setInt(8, bb.getRe_lev() + 1); // re_lev: 원글 + 1
			pstmt.setInt(9, bb.getRe_seq() + 1); // re_seq: 원글 + 1
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());

			pstmt.executeUpdate();
			/* 3. 답글 작성(INSERT) */

			System.out.println("DAO: 답글 작성 완료");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
	}
	// 게시판 답글 작성 - reInsertBoard(BoardBean bb)
}
// DAO