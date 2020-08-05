package spring.model.rreply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.popcorn.RreplyMapper;

@Service
public class RreplyServiceImpl implements RreplyService {
	
	@Autowired
	RreplyMapper rMapper;

	@Override
	public int rcount(int review_num) {
		
		return rMapper.rcount(review_num);
	}

	@Override
	public int update(RreplyDTO dto) {
		
		return rMapper.update(dto);
	}

	@Override
	public int delete(int rreply_num) {
		// TODO Auto-generated method stub
		return rMapper.delete(rreply_num);
	}

	@Override
	public RreplyDTO read(int rreply_num) {
		// TODO Auto-generated method stub
		return rMapper.read(rreply_num);
	}

	@Override
	public int total(int review_num) {
		// TODO Auto-generated method stub
		return rMapper.total(review_num);
	}

	@Override
	public List<RreplyDTO> list(Map map) {
		// TODO Auto-generated method stub
		return rMapper.list(map);
	}

	@Override
	public int create(RreplyDTO dto) {
		// TODO Auto-generated method stub
		return rMapper.create(dto);
	}
	

}
