package spring.model.movie;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import spring.mapper.popcorn.MovieMapper;
import spring.model.member.MemberDTO;
import spring.model.member.MemberService;




@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
		})
public class MovieServiceImplTest {

	private static final Logger logger = LoggerFactory.getLogger(MovieServiceImplTest.class);

	
	@Autowired
	private MovieMapper inter;	
	
	@Autowired
	private MemberService memberService;

	
	@Test
	public void testMemberLogin() {
		//MemberDTO 가져올게.
		MemberDTO dto = memberService.read("gptnowo");
		
		String genre = dto.getGenre_str();
		String genre_arr[] = genre.split(",");
		List list = new ArrayList();
		for(int i=0; i<genre_arr.length; i++) {
			list.add(genre_arr[i]);
		}
		
//		List<MovieDTO> movies = inter.favorite_movies(list);
//		System.out.println("=======================여기서 부터===");
//		System.out.println(movies);
//		System.out.println("====여기까지===");
	}
	
	
	//@Test
	@Ignore
	public void test() {
		MovieDTO dto = new MovieDTO();
		dto.setMovie_name("gg");
		dto.setMovie_content("내용입니다.");
		dto.setMovie_cast("출연진");
		dto.setMovie_grade("12세 관람");
		dto.setMovie_date("2010-8-10");
		dto.setMovie_genre_str("액션");
		dto.setMovie_img1("img1.jpg");
		dto.setMovie_img2("img2.jpg");
		dto.setMovie_img3("img3.jpg");
		dto.setMovie_num(4);
		dto.setMovie_price(1000);
		int a = inter.create(dto);
		System.out.println("=========================================");
		System.out.println(a);
	}

}
