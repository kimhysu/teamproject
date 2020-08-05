package spring.model.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {

	boolean create(ReviewDTO dto);
	List<ReviewDTO> list(Map map);
	boolean update(ReviewDTO dto);
	int total(int movie_num);
	ReviewDTO read(int review_num);
	boolean delete(int review_num);
	void upViewcnt(int review_num);
	int upThumb(int review_num);
	String movie_name(int movie_num);
	int review_star_avg(int movie_num);
}
