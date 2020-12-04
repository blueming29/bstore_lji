package book.board.vo;

import java.util.Date;

public class BookBoard {
	private int jibno;
	private String jibtitle;
	private String jibwriter;
	private String jibcontent;
	private Date jibdate;
	private int jibhit;
	public int getJibno() {
		return jibno;
	}
	public void setJibno(int jibno) {
		this.jibno = jibno;
	}
	public String getJibtitle() {
		return jibtitle;
	}
	public void setJibtitle(String jibtitle) {
		this.jibtitle = jibtitle;
	}
	public String getJibwriter() {
		return jibwriter;
	}
	public void setJibwriter(String jibwriter) {
		this.jibwriter = jibwriter;
	}
	public String getJibcontent() {
		return jibcontent;
	}
	public void setJibcontent(String jibcontent) {
		this.jibcontent = jibcontent;
	}
	public Date getJibdate() {
		return jibdate;
	}
	public void setJibdate(Date jibdate) {
		this.jibdate = jibdate;
	}
	public int getJibhit() {
		return jibhit;
	}
	public void setJibhit(int jibhit) {
		this.jibhit = jibhit;
	}
	
}
