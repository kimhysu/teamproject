package spring.model.rreply;

import java.util.List;
import java.util.Map;

public interface RreplyService {

	int rcount(int review_num);
	int update(RreplyDTO dto);
	int delete(int rreply_num);
	RreplyDTO read(int rreply_num);
	int total(int review_num);
	List<RreplyDTO> list(Map map);
	int create(RreplyDTO vo);

}
