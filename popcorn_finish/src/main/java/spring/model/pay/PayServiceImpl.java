package spring.model.pay;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.popcorn.CartMapper;
import spring.mapper.popcorn.PayMapper;
import spring.model.cart.CartDTO;

@Service
public class PayServiceImpl implements PayService {
	
	@Autowired
	PayMapper pMapper;
	@Autowired
	CartMapper cMapper;
	
	@Override
	public boolean payCreate(Map map) throws Exception {
		
		
		
		//header 생성
		boolean flag = pMapper.create(map);
		//item 생성
		pMapper.createAll(map);
		//header update
		pMapper.updatePaysum(map);
		//장바구니 삭제
		cMapper.deleteAll(map);
		
		
		
		return flag;
	}

	@Override
	public List<PayDTO> list(String id) {
		List<PayDTO> list = pMapper.list(id);
		return list;
	}


}
