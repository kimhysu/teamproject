package spring.sts.popcorn;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.member.MemberDTO;
import spring.model.member.MemberService;
import spring.model.movie.MovieDTO;
import spring.model.movie.MovieService;
import spring.model.review.ReviewService;
import spring.utility.popcorn.Utility;

@Controller
public class MovieController {

	@Autowired
	MovieService movieService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ReviewService reviewService;
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@GetMapping("/movie/update")
	public String update(int movie_num,Model model) {
		
		MovieDTO dto = movieService.read(movie_num);
		
		model.addAttribute("dto", dto);
		return "/movie/update";
	}
	
	@PostMapping("/movie/update")
	public String update(MovieDTO dto, int movie_num, RedirectAttributes redi,
			Model model) {
			String url ="";
			boolean flag = movieService.update(dto);
			
			if(flag) {
				redi.addFlashAttribute("movie_num", movie_num);
				redi.addAttribute("movie_num", movie_num);
				redi.addFlashAttribute("msg", "영화정보가 수정되었습니다.");
				url = "redirect:/movie/admin_read";
			}else {
				model.addAttribute("flag", flag);
				url = "error/error";
			}	
		
		return url;
	}

	@GetMapping("/movie/update_movie_img")
	public String updateFile(Model model, int movie_num) {
		MovieDTO dto = movieService.read(movie_num);
		model.addAttribute("dto", dto);
		return "/movie/update_movie_img";
	}

	@PostMapping("/movie/update_movie_img")
	public String updateFile(int movie_num, MultipartFile movie_img1MF, MultipartFile movie_img2MF,
			MultipartFile movie_img3MF, HttpServletRequest request, RedirectAttributes redi) {

		String basePath = request.getRealPath("/movie/storage");
		String oldfile1 = request.getParameter("oldfile1");
		String oldfile2 = request.getParameter("oldfile2");
		String oldfile3 = request.getParameter("oldfile3");

		boolean flag = movieService.update_movie_img(movie_num, basePath, oldfile1, oldfile2, oldfile3, movie_img1MF,
				movie_img2MF, movie_img3MF);

		if (flag) {
			redi.addFlashAttribute("movie_num", movie_num);
			redi.addAttribute("movie_num", movie_num);
			redi.addFlashAttribute("msg", "이미지가 변경되었습니다.");
			return "redirect:/movie/admin_read";
		} else {
			request.setAttribute("flag", flag);
			return "error/error";
		}
	}

	@PostMapping("/movie/delete")
	public String delete(@RequestParam Map<String, String> map, HttpServletRequest request, RedirectAttributes redi,
			int movie_num, Model model) {

		String basePath = request.getRealPath("/movie/storage");
		String oldfile1 = request.getParameter("oldfile1");
		String oldfile2 = request.getParameter("oldfile2");
		String oldfile3 = request.getParameter("oldfile3");
		
		boolean flag = movieService.delete(movie_num, basePath, oldfile1, oldfile2, oldfile3);
		
		if (flag) {
			redi.addFlashAttribute("msg", "게시물을 삭제하였습니다.");
			return "redirect:/movie/admin_list";
		} else {
			request.setAttribute("flag", flag);
			return "error/error";
		}
	}

	@GetMapping("/movie/delete")
	public String delete() {

		return "/movie/delete";
	}

	@GetMapping("/movie/admin_read")
	public String read(int movie_num, Model model, HttpServletRequest request) {

		MovieDTO dto = movieService.read(movie_num);

		model.addAttribute("dto", dto);

		return "/movie/admin_read";
	}
	
	@RequestMapping("/movie/read")
	public String read() {
		return "/movie/read";
	}

	@PostMapping("/movie/create")
	public String create(MovieDTO dto, Model model, RedirectAttributes redi, HttpServletRequest request) {

		String basePath = request.getRealPath("/movie/storage");

		log.info("movieservice" + movieService);

		boolean flag = movieService.create(dto, basePath);
		String url = null;

		if (flag) {
			redi.addFlashAttribute("msg", "게시글을 올렸습니다.");
			url = "redirect:/movie/admin_list";
		} else {
			model.addAttribute("flag", flag);
			url = "error/error";
		}
		return url;

	}

	@GetMapping("/movie/create")
	public String create() {

		return "/movie/create";
	}
	
	@ResponseBody
	@PostMapping("/movie/movie_img_click")
	public Map movie_img_click(@RequestParam int movie_num) {
		log.info("-------------------------------------------");
		log.info("movie_num" + movie_num);
		MovieDTO movieDto = movieService.read(movie_num);
		int star_avg = reviewService.review_star_avg(movie_num);
		
		Map map = new HashMap();
		map.put("movieDto", movieDto);
		map.put("star_avg", star_avg);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/index/col")
	public List<MovieDTO> index_col(@RequestParam Map<String, Object> param){
		// 검색관련--------
		System.out.println("map-------------"+param.get("col"));
		System.out.println("map-------------"+param.get("word"));
		
		String col = Utility.checkNull((String)param.get("col"));
		String word = Utility.checkNull((String)param.get("word"));
		
		List<MovieDTO> col_word_list = movieService.col_word_list(col, word);
		
		return col_word_list;
	}
	
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		
		//id값을 세선해서 가져오기.
		String id = (String) request.getSession().getAttribute("id");
		
		//영화 추천(장르)
		List<MovieDTO> list = movieService.favorite_movies(id);
		request.setAttribute("list", list);
		MemberDTO memberDto = memberService.read(id);
		request.setAttribute("memberDto", memberDto);
		
		//최신개봉작
		List<MovieDTO> list2 = movieService.index_list();
		request.setAttribute("list2", list2);
		
		//리뷰가 많은 순
		List<MovieDTO> list3 = movieService.review_list();
		request.setAttribute("list3", list3);
		
		//별점이 높은 순
		List<MovieDTO> list4 = movieService.review_avg_list();
		request.setAttribute("list4", list4);
		
		return "/index";
	}

	@RequestMapping("/movie/admin_list")
	public String list(HttpServletRequest request) {

		// 검색관련--------
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		// 페이지 관련-----------
		int nowPage = 1; // 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 5; // 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번 ----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1; // 현재 보고있는 페이지
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		int total = movieService.total(map);

		List<MovieDTO> list = movieService.list(map);

		String url = "admin_list";
		String m_paging = Utility.m_paging(total, nowPage, recordPerPage, col, word, url);

		request.setAttribute("list", list);
		request.setAttribute("m_paging", m_paging);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);

		return "/movie/admin_list";
	}

}
