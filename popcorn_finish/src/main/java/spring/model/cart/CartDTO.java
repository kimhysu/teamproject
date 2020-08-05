package spring.model.cart;

import java.util.List;

public class CartDTO {
	private int cart_num  ;
    private String id     ;
    private int movie_num ;
    private String movie_name;
    private int movie_price;
    
    private List<CartDTO> list;
    private String pay_way;
    
    
	@Override
	public String toString() {
		return "CartDTO [cart_num=" + cart_num + ", id=" + id + ", movie_num=" + movie_num + ", movie_name="
				+ movie_name + ", movie_price=" + movie_price + ", list=" + list + ", pay_way=" + pay_way + "]";
	}
	
	
	public String getPay_way() {
		return pay_way;
	}


	public void setPay_way(String pay_way) {
		this.pay_way = pay_way;
	}


	public List<CartDTO> getList() {
		return list;
	}
	public void setList(List<CartDTO> list) {
		this.list = list;
	}
	public CartDTO(int cart_num, String id, int movie_num, String movie_name, int movie_price) {
		super();
		this.cart_num = cart_num;
		this.id = id;
		this.movie_num = movie_num;
		this.movie_name = movie_name;
		this.movie_price = movie_price;
	}
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
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
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public int getMovie_price() {
		return movie_price;
	}
	public void setMovie_price(int movie_price) {
		this.movie_price = movie_price;
	}
    
    
}
