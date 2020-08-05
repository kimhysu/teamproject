package spring.model.pay;

import java.util.List;
import java.util.Map;

public interface PayService {

	boolean payCreate(Map map) throws Exception;
	List<PayDTO> list(String id);
	

}
