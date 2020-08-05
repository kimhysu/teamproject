package spring.model.pay_item;

public class pay_itemDTO {
	private int pay_item_num   ;
	private int cart_num       ;
	private int pay_num        ;
	private int pay_item_price ;
	private int movie_num      ;
	public int getPay_item_num() {
		return pay_item_num;
	}
	public void setPay_item_num(int pay_item_num) {
		this.pay_item_num = pay_item_num;
	}
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public int getPay_item_price() {
		return pay_item_price;
	}
	public void setPay_item_price(int pay_item_price) {
		this.pay_item_price = pay_item_price;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public pay_itemDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public pay_itemDTO(int pay_item_num, int cart_num, int pay_num, int pay_item_price, int movie_num) {
		super();
		this.pay_item_num = pay_item_num;
		this.cart_num = cart_num;
		this.pay_num = pay_num;
		this.pay_item_price = pay_item_price;
		this.movie_num = movie_num;
	}
	
	
}
