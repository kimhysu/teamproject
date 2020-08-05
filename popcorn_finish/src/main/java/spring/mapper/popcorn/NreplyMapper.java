package spring.mapper.popcorn;

import java.util.List;
import java.util.Map;

import spring.model.nreply.NreplyDTO;

public interface NreplyMapper {

	int create(NreplyDTO dto);
	NreplyDTO read(int nreply_num);
	int update(NreplyDTO dto);
	int delete(int nreply_num);
	List<NreplyDTO> list(Map map);
	int total(int notice_num); // 중요! 부모테이블의 pk 값 받기!
	
	int rcount(int notice_num);
	int bdelete(int notice_num);
}
