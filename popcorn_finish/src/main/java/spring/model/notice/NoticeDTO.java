package spring.model.notice;

public class NoticeDTO {
	
	private int notice_num        ;      //NUMBER NOT NULL,
	private String notice_title   ;      //VARCHAR(50) NULL,
	private String notice_content ;      //VARCHAR(500) NULL,
	private String notice_type    ;      //VARCHAR(50) NULL,
	private String notice_pw      ;      //VARCHAR(30) NULL,
	private String notice_date    ;      //DATE NULL,
	private String id             ;      //VARCHAR(30) NOT NULL,
	
	@Override
	public String toString() {
		return "NoticeDTO [notice_num=" + notice_num + ", notice_title=" + notice_title + ", notice_content="
				+ notice_content + ", notice_type=" + notice_type + ", notice_pw=" + notice_pw + ", notice_date="
				+ notice_date + ", id=" + id + "]";
	}
	
	public int getNotice_num() {
		return notice_num;
	}	
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
	}
	public String getNotice_pw() {
		return notice_pw;
	}
	public void setNotice_pw(String notice_pw) {
		this.notice_pw = notice_pw;
	}
	public String getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(String notice_date) {
		this.notice_date = notice_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
}
