package com.itwillbs.board;

import java.sql.Date;

/**
 * BoardBean 객체 itwill_board 테이블의 정보를 저장하는 객체 - 가능한 테이블의 컬럼 순서와 동일하게 구현하는 게 좋음
 */

public class BoardBean {
	private int bno; // 글 번호
	private String name; // 작성자 이름
	private String pass; // 글 비밀번호
	private String subject; // 글 제목
	private String content; // 글 내용
	private int readcount; // 글 조회수
	private int re_ref; // 답글 - 그룹번호
	private int re_lev; // 답글 - 레벨(들여쓰기)
	private int re_seq; // 답글 - 순서
	private Date date; // 글 작성일
	private String ip; // 글 작성자 IP주소
	private String file; // 첨부파일

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getRe_ref() {
		return re_ref;
	}

	public void setRe_ref(int re_ref) {
		this.re_ref = re_ref;
	}

	public int getRe_lev() {
		return re_lev;
	}

	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getFile() {
		return file;
	}

	public void setFile(String file) {
		this.file = file;
	}

	// ALT SHIFT S + S
	@Override
	public String toString() {
		return "BoardBean [bno=" + bno + ", name=" + name + ", pass=" + pass + ", subject=" + subject + ", content="
				+ content + ", readcount=" + readcount + ", re_ref=" + re_ref + ", re_lev=" + re_lev + ", re_seq="
				+ re_seq + ", date=" + date + ", ip=" + ip + ", file=" + file + "]";
	}

}
