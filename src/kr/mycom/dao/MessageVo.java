package kr.mycom.dao;

public class MessageVo {
	private int msgid;
	private String pw;
	private String writer;
	private String content;

	public int getMsgid() {
		return msgid;
	}

	public void setMsgid(int msgid) {
		this.msgid = msgid;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "MessageVo [msgid=" + msgid + ", pw=" + pw + ", writer=" + writer + ", content=" + content + "]";
	}

}
