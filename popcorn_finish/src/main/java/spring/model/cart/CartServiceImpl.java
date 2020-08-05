package spring.model.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.popcorn.CartMapper;
import spring.model.review.ReviewDTO;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	CartMapper cMapper;

	@Override
	public int dupCheck(int movie_num, String id) {
		
		Map map = new HashMap();
		map.put("movie_num", movie_num);
		map.put("id", id);
		
		int cnt = cMapper.dupCheck(map);
		return cnt;
	}

	@Override
	public boolean create(CartDTO dto) {
		boolean flag = cMapper.create(dto);
		return flag;
	}

	@Override
	public int totalprice(String id) {
		int sum = cMapper.totalprice(id);
		return sum;
	}

	@Override
	public boolean delete(int cart_num) {
		boolean flag = cMapper.delete(cart_num);
		return flag;
	}

	@Override
	public List list(String id) {
		List<CartDTO> list = cMapper.list(id);
		return list;
	}

	@Override
	public void deleteAll(Map map) {
		cMapper.deleteAll(map);
		
	}
	
	
}
