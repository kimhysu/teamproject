package spring.model.rreply;

public class RreplyDTO {
	private int rreply_num        ;
    private String rreply_content ;
    private String rreply_date    ;
    private String id             ;
    private int review_num        ;
	
    
    public RreplyDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public RreplyDTO(int rreply_num, String rreply_content, String rreply_date, String id, int review_num) {
		super();
		this.rreply_num = rreply_num;
		this.rreply_content = rreply_content;
		this.rreply_date = rreply_date;
		this.id = id;
		this.review_num = review_num;
	}


	@Override
	public String toString() {
		return "RreplyDTO [rreply_num=" + rreply_num + ", rreply_content=" + rreply_content + ", rreply_date="
				+ rreply_date + ", id=" + id + ", review_num=" + review_num + "]";
	}


	public int getRreply_num() {
		return rreply_num;
	}


	public void setRreply_num(int rreply_num) {
		this.rreply_num = rreply_num;
	}


	public String getRreply_content() {
		return rreply_content;
	}


	public void setRreply_content(String rreply_content) {
		this.rreply_content = rreply_content;
	}


	public String getRreply_date() {
		return rreply_date;
	}


	public void setRreply_date(String rreply_date) {
		this.rreply_date = rreply_date;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getReview_num() {
		return review_num;
	}


	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
    
    
}
