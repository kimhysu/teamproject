package spring.model.nreply;

public class NreplyDTO{
	
	private int nreply_num        ;      //NUMBER NOT NULL,
	private String nreply_content ;      //VARCHAR(500) NULL,
	private String nreply_date    ;      //DATE NULL,
    private int notice_num        ;      //NUMBER NOT NULL,
    private String id             ;      //VARCHAR(30) NOT NULL,
	
    // toString 주는 게 낫다..!
    @Override
	public String toString() {
		return "NreplyDTO [nreply_num=" + nreply_num + ", nreply_content=" + nreply_content + ", nreply_date="
				+ nreply_date + ", notice_num=" + notice_num + ", id=" + id + "]";
	}
    
	public int getNreply_num() {
		return nreply_num;
	}
	public void setNreply_num(int nreply_num) {
		this.nreply_num = nreply_num;
	}
	public String getNreply_content() {
		return nreply_content;
	}
	public void setNreply_content(String nreply_content) {
		this.nreply_content = nreply_content;
	}
	public String getNreply_date() {
		return nreply_date;
	}
	public void setNreply_date(String nreply_date) {
		this.nreply_date = nreply_date;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
