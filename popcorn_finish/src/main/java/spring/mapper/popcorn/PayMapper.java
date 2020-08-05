package spring.mapper.popcorn;

import java.util.List;
import java.util.Map;

import spring.model.pay.PayDTO;

public interface PayMapper {

	boolean create(Map map);
	int updatePaysum(Map map);
	int createAll(Map<String, Object> map);
	List<PayDTO> list(String id);
	int dupcheck(Map<String, Object> map);
}
