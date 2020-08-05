package spring.model.review;

public class ReviewDTO {
	private int review_num       ;
    private String review_title  ;
    private String review_content;
    private int review_star      ;
    private int review_viewcnt   ;
    private int review_thumb     ;
    private String review_date   ;
    private String id            ;
    private int movie_num        ;
    private String movie_name    ;
    
    
	@Override
	public String toString() {
		return "ReviewDTO [review_num=" + review_num + ", review_title=" + review_title + ", review_content="
				+ review_content + ", review_star=" + review_star + ", review_viewcnt=" + review_viewcnt
				+ ", review_thumb=" + review_thumb + ", review_date=" + review_date + ", id=" + id + ", movie_num="
				+ movie_num + ", movie_name=" + movie_name + "]";
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public int getReview_viewcnt() {
		return review_viewcnt;
	}
	public void setReview_viewcnt(int review_viewcnt) {
		this.review_viewcnt = review_viewcnt;
	}
	public int getReview_thumb() {
		return review_thumb;
	}
	public void setReview_thumb(int review_thumb) {
		this.review_thumb = review_thumb;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewDTO(int review_num, String review_title, String review_content, int review_star, int review_viewcnt,
			int review_thumb, String review_date, String id, int movie_num, String movie_name) {
		super();
		this.review_num = review_num;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_star = review_star;
		this.review_viewcnt = review_viewcnt;
		this.review_thumb = review_thumb;
		this.review_date = review_date;
		this.id = id;
		this.movie_num = movie_num;
		this.movie_name = movie_name;
		
	}
    
    
}
