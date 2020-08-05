package spring.mapper.popcorn;

import java.util.List;
import java.util.Map;

import spring.model.cart.CartDTO;

public interface CartMapper {

	int dupCheck(Map map);
	boolean create(CartDTO dto);
	List<CartDTO> list(String id);
	int totalprice(String id);
	boolean delete(int cart_num);
	void deleteAll(Map map);
}
