package spring.mapper.popcorn;

import java.util.List;
import java.util.Map;

import spring.model.review.ReviewDTO;

public interface ReviewMapper {
	int create(ReviewDTO dto);
	ReviewDTO read(int review_num);
	int update(ReviewDTO dto);
	int delete(int review_num);
	List<ReviewDTO> list(Map map);
	int total(int movie_num);
	void upViewcnt(int review_num);
	int upThumb(int review_num);
	String movie_name(int movie_num);
	int review_star_avg(int movie_num);
}
