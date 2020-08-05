package spring.model.movie;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface MovieService {
	boolean create(MovieDTO dto, String basePath);
	List<MovieDTO> list(Map map);
	List<MovieDTO> index_list();
	int total(Map map);
	MovieDTO read(int movie_num);
	boolean delete(int movie_num, String basePath, String oldfile1, String oldfile2, String oldfile3);
	boolean update_movie_img(int movie_num, String basePath, 
			String oldfile1, String oldfile2, String oldfile3,
			MultipartFile movie_img1MF, MultipartFile movie_img2MF, MultipartFile movie_img3MF);
	boolean update(MovieDTO dto);
	boolean passCheck(Map map);
	List<MovieDTO> favorite_movies(String id);
	List<MovieDTO> review_list();
	List<MovieDTO> review_avg_list();
	List<MovieDTO> col_word_list(String col, String word);
}
