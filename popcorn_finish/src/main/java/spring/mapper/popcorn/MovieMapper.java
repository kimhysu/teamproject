package spring.mapper.popcorn;

import java.util.List;
import java.util.Map;

import spring.model.movie.MovieDTO;

public interface MovieMapper {
	int create(MovieDTO dto);
	List<MovieDTO> list(Map map);
	List<MovieDTO> index_list();
	int total(Map map);
	MovieDTO read(int movie_num);
	int delete(int movie_num);
	int update_movie_img(Map map);
	int passCheck(Map map);
	int update(MovieDTO dto);
	List<MovieDTO> favorite_movies(Map map);
	List<MovieDTO> review_list();
	List<MovieDTO> review_avg_list();
	List<MovieDTO> col_word_list(Map map);
}
