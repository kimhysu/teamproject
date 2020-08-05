package spring.mapper.popcorn;

import java.util.List;
import java.util.Map;

import spring.model.rreply.RreplyDTO;

public interface RreplyMapper {

	int update(RreplyDTO dto);
	int delete(int rreply_num);
	int rdelete(int review_num);
	RreplyDTO read(int rreply_num);
	int total(int review_num);
	List<RreplyDTO> list(Map map);
	int create(RreplyDTO dto);
	int rcount(int review_num);
	

}
