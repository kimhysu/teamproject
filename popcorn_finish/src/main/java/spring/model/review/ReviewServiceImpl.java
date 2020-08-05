package spring.model.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.popcorn.ReviewMapper;
import spring.mapper.popcorn.RreplyMapper;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewMapper rMapper;
	@Autowired
	RreplyMapper aMapper;

	@Override
	public boolean create(ReviewDTO dto) {
		// TODO Auto-generated method stub
		boolean flag = false;
		flag = rMapper.create(dto)>0;
		return flag;		
	}

	@Override
	public List<ReviewDTO> list(Map map) {
		List<ReviewDTO> list = rMapper.list(map);
		return list;
	}

	@Override
	public boolean update(ReviewDTO dto) {
		boolean flag = false;
		flag = rMapper.update(dto)>0;
		return flag;
	}

	@Override
	public int total(int movie_num) {
		int cnt = rMapper.total(movie_num);
		return cnt;
	}

	@Override
	public ReviewDTO read(int review_num) {
		ReviewDTO dto = rMapper.read(review_num);
		return dto;
	}

	@Override
	public boolean delete(int review_num) {
		boolean flag = false;
		aMapper.rdelete(review_num);
		flag = rMapper.delete(review_num)>0;
		return flag;
	}

	@Override
	public void upViewcnt(int review_num) {
		rMapper.upViewcnt(review_num);
		
	}
	
	@Override
	public int upThumb(int review_num) {
		int cnt = rMapper.upThumb(review_num);
		return cnt;
		
	}

	@Override
	public String movie_name(int movie_num) {
		String movie_name = rMapper.movie_name(movie_num);
		return movie_name;
	}

	@Override
	public int review_star_avg(int movie_num) {
		int star = rMapper.review_star_avg(movie_num);
		return star;
	}

	
}
