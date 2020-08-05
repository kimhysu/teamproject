package spring.model.cart;

import java.util.List;
import java.util.Map;

public interface CartService {

	int dupCheck(int movie_num, String id);
	boolean create(CartDTO dto);
	List<CartDTO> list(String id);
	int totalprice(String id);
	boolean delete(int cart_num);
	void deleteAll(Map map);
	

}
