package spring.sts.popcorn;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.movie.MovieService;
import spring.model.review.ReviewDTO;
import spring.model.review.ReviewService;
import spring.model.rreply.RreplyService;
import spring.utility.popcorn.Utility;




@Controller
public class ReviewController {
	
	
    
	@Autowired
	private ReviewService service;
	@Autowired
	private RreplyService rService;
	
	
	@GetMapping("/review/create")
	public String create(HttpServletRequest request,int movie_num) {
		request.setAttribute("movie_name", service.movie_name(movie_num));
		return "/review/create";
	}

	@GetMapping("/review/update")
	public String update(int review_num,Model model) {
		model.addAttribute("dto", service.read(review_num));
		return "/review/update";
	}

	@RequestMapping("/review/list")
	public String list(HttpServletRequest request) {
		
		String col = Utility.checkNull(request.getParameter("col"));
		
		// 페이지 관련-----------
		int nowPage = 1; // 현재 보고있는 페이지
		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}

		int recordPerPage = 5; // 한페이지당 보여줄 레코드갯수

		// DB에서 가져올 순번 ----------------
		int sno = ((nowPage - 1) * recordPerPage) + 1; // 현재 보고있는 페이지
		int eno = nowPage * recordPerPage;
		int movie_num = Integer.parseInt(request.getParameter("movie_num"));
		
		Map map = new HashMap();
		map.put("col", col);
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("movie_num",movie_num);

		int total = service.total(movie_num);

		List<ReviewDTO> list = service.list(map);

		String url = "list";
		String paging = Utility.paging(movie_num,total, nowPage, recordPerPage,col, url);
		
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("col", col);
		request.setAttribute("rService", rService);
		
		return "/review/list";
	}
	
	@GetMapping("/review/read")
	public String read(int review_num, Model model,
			HttpServletRequest request, String col,
			int nowPage) {
		
		service.upViewcnt(review_num);
		ReviewDTO dto = service.read(review_num);
		
		dto.setReview_content(dto.getReview_content().replaceAll("\r\n", "<br>")) ;
		
		model.addAttribute("dto", dto);
		
		 /* 댓글 관련  시작 */
		int nPage= 1; //시작 페이지 번호는 1부터 
		 
		if (request.getParameter("nPage") != null) { 
		nPage= Integer.parseInt(request.getParameter("nPage"));  
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		 
		int sno = ((nPage-1) * recordPerPage) + 1; // 
		int eno = nPage * recordPerPage;
		 
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("review_num", review_num);
		map.put("nPage", nPage);
		map.put("nowPage", nowPage);
		map.put("col", col);
		
		 
		model.addAllAttributes(map);
		/* 댓글 관련 끝 */  
		
		return "/review/read";
	}
	
	@PostMapping("/review/create")
	public String create(HttpServletRequest request, ReviewDTO dto, Model model, RedirectAttributes redi) {
		System.out.println("=======================================");
		
		int movie_num = Integer.parseInt(request.getParameter("movie_num"));
		
		boolean flag = service.create(dto);
		
		if(flag) {
			redi.addFlashAttribute("msg", "게시글을 올렸습니다.");
			redi.addAttribute("movie_num", movie_num);
			return "redirect:/review/list";
		}else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
	
	}
	
	@PostMapping("/review/update")
	public String update(int movie_num,ReviewDTO dto, Model model, RedirectAttributes redi) {
		boolean flag = service.update(dto);
		
		if(flag) {
			redi.addFlashAttribute("msg", "게시글을 수정했습니다.");
			redi.addAttribute("movie_num", movie_num);
			return "redirect:/review/list";
		}else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
		
	}
	
	@RequestMapping("/review/delete")
	public String delete(int review_num, Model model, 
			RedirectAttributes redi, String col,int movie_num) {
		boolean flag = service.delete(review_num);
		
		if(flag) {
			redi.addFlashAttribute("msg", "게시글을 삭제했습니다.");
			redi.addFlashAttribute("col", col);
			redi.addAttribute("movie_num", movie_num);
			return "redirect:/review/list";
		}else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
		
	}
	
	@ResponseBody // jsp 페이지가 아닌 데이터를 리턴할때 추가!
	@GetMapping(value = "/review/thumb", produces = "text/plain;charset=UTF-8")
	public String thumb(int review_num) {

		int flag = service.upThumb(review_num);
		String str = "";

		if (flag == 1) {
			str = "추천완료!";
		} else {
			str = "다시 시도하세요";
		}

		return str;
	}
	
	@ResponseBody // jsp 페이지가 아닌 데이터를 리턴할때 추가!
	@GetMapping(value = "/review/total", produces = "text/plain;charset=UTF-8")
	public String total(int movie_num) {
		int cnt = service.total(movie_num);
		
		String total = Integer.toString(cnt);
		System.out.println(total);
		return total;		 
	}
	
}
