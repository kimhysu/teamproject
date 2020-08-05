package spring.model.movie;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import spring.mapper.popcorn.MemberMapper;
import spring.mapper.popcorn.MovieMapper;
import spring.model.member.MemberDTO;
import spring.model.member.MemberService;
import spring.utility.popcorn.Utility;



@Service
public class MovieServiceImpl implements MovieService {
	
	@Autowired
	MovieMapper mMapper;
	@Autowired
	MemberMapper memberMapper;

	@Override
	public boolean create(MovieDTO dto, String basePath) {
		String movie_img1=null;
		String movie_img2=null;
		String movie_img3=null;
		
		int size1 = (int)dto.getMovie_img1MF().getSize();
		int size2 = (int)dto.getMovie_img2MF().getSize();
		int size3 = (int)dto.getMovie_img3MF().getSize();
		
		if(size1>0 && size2>0 && size3>0) {
			movie_img1 = Utility.saveFileSpring(dto.getMovie_img1MF(), basePath);
			movie_img2 = Utility.saveFileSpring(dto.getMovie_img2MF(), basePath);
			movie_img3 = Utility.saveFileSpring(dto.getMovie_img3MF(), basePath);
			
		}else {
			movie_img1= "member.jpg";			
			movie_img2= "member.jpg";			
			movie_img3= "member.jpg";			
		}
		     
		dto.setMovie_img1(movie_img1);
		dto.setMovie_img2(movie_img2);
		dto.setMovie_img3(movie_img3);
		
		boolean flag = mMapper.create(dto) > 0;
		return flag;
	}

	@Override
	public List<MovieDTO> list(Map map) {
		List<MovieDTO> list = mMapper.list(map);
		return list;
	}
	@Override
	public List<MovieDTO> index_list() {
		List<MovieDTO> list = mMapper.index_list();
		return list;
	}

	@Override
	public int total(Map map) {
		int total = mMapper.total(map);
		return total;
	}

	@Override
	public MovieDTO read(int movie_num) {
		MovieDTO dto =mMapper.read(movie_num);
		
		dto.setMovie_content(dto.getMovie_content().replaceAll("\r\n", "<br>"));
		return dto;
	}

	@Override
	public boolean delete(int movie_num, String basePath, String oldfile1, String oldfile2, String oldfile3) {
		
		int delete = mMapper.delete(movie_num);
		boolean flag = false;
		if(delete ==1) {
		  if(!oldfile1.equals("member.jpg")){
				Utility.deleteFile(basePath, oldfile1);
		  }else if(!oldfile2.equals("member.jpg")){
			  Utility.deleteFile(basePath, oldfile2);
		  }else if(!oldfile3.equals("member.jpg")){
			  Utility.deleteFile(basePath, oldfile3);
		  }
		  
		  flag = true;
		}
		
		System.out.println(flag);
		return flag;
	}

	@Override
	public boolean update_movie_img(int movie_num, String basePath, String oldfile1, String oldfile2, String oldfile3,
			MultipartFile movie_img1MF, MultipartFile movie_img2MF, MultipartFile movie_img3MF) {
		
		String movie_img1 = null;
		String movie_img2 = null;
		String movie_img3 = null;
		
		if(movie_img1MF.getSize()>0) {
			if(oldfile1!=null && !oldfile1.equals("member.jpg"))
				Utility.deleteFile(basePath, oldfile1);
			movie_img1 = Utility.saveFileSpring(movie_img1MF, basePath);
		}if(movie_img2MF.getSize()>0) {
			if(oldfile2!=null && !oldfile2.equals("member.jpg"))
				Utility.deleteFile(basePath, oldfile2);
			movie_img2 = Utility.saveFileSpring(movie_img2MF, basePath);
		}if(movie_img3MF.getSize()>0) {
			if(oldfile3!=null && !oldfile3.equals("member.jpg"))
				Utility.deleteFile(basePath, oldfile3);
			movie_img3 = Utility.saveFileSpring(movie_img3MF, basePath);
		}
		Map map = new HashMap();
		
		map.put("movie_num", movie_num);
		map.put("movie_img1", movie_img1);
		map.put("movie_img2", movie_img2);
		map.put("movie_img3", movie_img3);
		
		boolean flag = mMapper.update_movie_img(map)>0;
		
		return flag;
	}

	@Override
	public boolean passCheck(Map map) {
		boolean passCheck = mMapper.passCheck(map)>0;
		return passCheck;
	}

	@Override
	public boolean update(MovieDTO dto) {
		boolean flag = mMapper.update(dto)>0;
		return flag;
	}

	public List<MovieDTO> favorite_movies(String id) {
		MemberDTO dto = memberMapper.read(id);
		String genre = dto.getGenre_str();
		String genre_arr[] = genre.split(",");
		List list = new ArrayList();
		for(int i=0; i<genre_arr.length; i++) {
			list.add(genre_arr[i]);
		}
		Map map = new HashMap();
		map.put("list", list);

		List<MovieDTO> movies = mMapper.favorite_movies(map);
		return movies;
	}

	@Override
	public List<MovieDTO> review_list() {
		List<MovieDTO> review_list = mMapper.review_list();
		return review_list;
	}

	@Override
	public List<MovieDTO> review_avg_list() {
		List<MovieDTO> review_avg_list = mMapper.review_avg_list();
		return review_avg_list;
	}

	@Override
	public List<MovieDTO> col_word_list(String col, String word) {
		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		return mMapper.col_word_list(map);
	}
	

}
