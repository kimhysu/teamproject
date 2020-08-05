package spring.model.pay;

public class PayDTO {
	private int pay_num    ;
    private String id      ;
    private int pay_sum    ;
    private String pay_way ;
    private String pay_date;
    private int pay_item_price;
    private String movie_name;
    
    
	@Override
	public String toString() {
		return "PayDTO [pay_num=" + pay_num + ", id=" + id + ", pay_sum=" + pay_sum + ", pay_way=" + pay_way
				+ ", pay_date=" + pay_date + ", pay_item_price=" + pay_item_price + ", movie_name=" + movie_name + "]";
	}
	public PayDTO(int pay_num, String id, int pay_sum, String pay_way, String pay_date, int pay_item_price,
			String movie_name) {
		super();
		this.pay_num = pay_num;
		this.id = id;
		this.pay_sum = pay_sum;
		this.pay_way = pay_way;
		this.pay_date = pay_date;
		this.pay_item_price = pay_item_price;
		this.movie_name = movie_name;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public int getPay_item_price() {
		return pay_item_price;
	}
	public void setPay_item_price(int pay_item_price) {
		this.pay_item_price = pay_item_price;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPay_sum() {
		return pay_sum;
	}
	public void setPay_sum(int pay_sum) {
		this.pay_sum = pay_sum;
	}
	public String getPay_way() {
		return pay_way;
	}
	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	
	public PayDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
    
}
