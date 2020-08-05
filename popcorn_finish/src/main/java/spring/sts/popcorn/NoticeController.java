package spring.sts.popcorn;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.notice.NoticeDTO;
import spring.model.notice.NoticeService;
import spring.model.nreply.NreplyService;
import spring.utility.popcorn.Utility;

@Controller
public class NoticeController {
   
   private static final Logger log = LoggerFactory.getLogger(HomeController.class);
   
   @Autowired
   private NoticeService NoService;
   
   //댓글 갯수 구현 후 list에 request.setAttribute("NrService",NrService);하기
   @Autowired
   private NreplyService NrService;
   
   @PostMapping("/notice/create")
   public String create(NoticeDTO dto, Model model,
         RedirectAttributes redi) throws Exception {
      
      boolean flag = NoService.create(dto)>0;
      
      if(flag) {
         redi.addFlashAttribute("msg", "공지글을 등록했습니다.");
         return "redirect:/notice/list";
      } else {
         model.addAttribute("flag", flag);
         return "error/error";
      }
      
   }
   @GetMapping("/notice/create")
   public String create() {
      
      return "/notice/create";
   }
   
   
   
   @RequestMapping("/notice/list")
   public String list(HttpServletRequest request) throws Exception{
	   
	   // search
	   String col = Utility.checkNull(request.getParameter("col"));
	   String word = Utility.checkNull(request.getParameter("word"));
	   if(col.equals("total")) word = "";
	   
	   // page
	   int nowPage = 1;
	   if(request.getParameter("nowPage")!=null) {
		   nowPage = Integer.parseInt(request.getParameter("nowPage"));
	   }
	   
	   int recordPerPage = 4;
	   int sno = ((nowPage-1) * recordPerPage) + 1;
	   int eno = nowPage * recordPerPage;
	   
	   //Map<Key, Value>() 형식 -> Map<String, Object>() 형식
	   Map map = new HashMap();
	   map.put("col", col);
	   map.put("word", word);
	   map.put("sno", sno);
	   map.put("eno", eno);
	   
	   int total = NoService.total(map);	
	   List<NoticeDTO> list = NoService.list(map);
	   String url = "list";
	   String paging = Utility.m_paging(total, nowPage, recordPerPage, col, word, url);
	   
	   request.setAttribute("col", col);
	   request.setAttribute("word", word);
	   request.setAttribute("nowPage", nowPage);
	   request.setAttribute("list", list);
	   request.setAttribute("paging", paging);
	   //댓글 갯수 구현
	   request.setAttribute("NrService", NrService);
	   
	   return "/notice/list";
   }
   // total X -> view에 total이라는게 없잖아.. 생각해봐!
   
   
   
   @GetMapping("/notice/read")
   public String read(int notice_num, String col, String word, int nowPage
		   , Model model, HttpServletRequest request) throws Exception{
	   
	   //=================================================
	   //==================TEST SESSION=================== 
	   //====================병합 후 삭제해야함=================
	   HttpSession session = request.getSession();
	   session.setAttribute("id", "user1");
	   //-------------------------------------------------
	   //-------------------------------------------------
	   
	   NoticeDTO dto = NoService.read(notice_num);
//	   model.addAttribute(String name, Object value)  <-  value객체를 name이름으로 추가한다. view에서는 name으로 지정한 이름을 통해서 컨트롤러의 value를 사용한다.
	   model.addAttribute("dto", dto);
	   
	   //Srping_OJT[2강] - ReplyInter.java 이후 내용!
	   /* 댓글 관련  시작 */	
	   int nPage= 1; //시작 페이지 번호는 1부터 
	   
	   if (request.getParameter("nPage") != null) { 
		   nPage= Integer.parseInt(request.getParameter("nPage"));  
	   }
	   
	   int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
	   int sno = ((nPage-1) * recordPerPage) + 1; // 
	   int eno = nPage * recordPerPage;
	   
	   Map map = new HashMap();
	   map.put("notice_num", notice_num);
	   map.put("col", col);
	   map.put("word", word);
	   map.put("nowPage", nowPage);
	   
	   map.put("sno", sno);
	   map.put("eno", eno);
	   map.put("nPage", nPage);	   
	   
	   model.addAllAttributes(map);
	   
	   return "/notice/read";
   }
   
   
   
   @PostMapping("/notice/update")
   public String update(NoticeDTO dto, Model model,
			RedirectAttributes redi, String notice_pw) throws Exception{
	   
	   Map map = new HashMap();
	   map.put("notice_num", dto.getNotice_num());
	   map.put("notice_pw", notice_pw);
		
	   boolean pflag = NoService.passCheck(map)>0;
		
	   boolean flag = false;
		
	   if(pflag) {	
		   flag = NoService.update(dto)>0;
	   } else {
		   model.addAttribute("pflag", pflag);	//pw Error시 이동!
		   return "error/passwdError";
	   }
		
	   if(flag) {
		   redi.addFlashAttribute("msg", "게시물을 수정했습니다.");
		   return "redirect:/notice/list";
	   } else {
		   model.addAttribute("flag", flag);
		   return "error/error";
	   }
   }
   @GetMapping("/notice/update")
   public String update(int notice_num, Model model) throws Exception{
	   
	   NoticeDTO dto = NoService.read(notice_num); // read메소드 활용하는 이유?
	   
	   model.addAttribute("dto", dto);
	   
	   return "/notice/update";
   }
   
   
   
   @PostMapping("/notice/delete")
   public String delete(@RequestParam Map map, int notice_num
		   , Model model, RedirectAttributes redi) throws Exception {
	   
	   boolean pflag = NoService.passCheck(map)>0;
	   boolean flag = false;
	   
	   if(pflag) {
		   flag = NoService.delete(notice_num)>0;
	   } else {
		   model.addAttribute("pflag", pflag);
		   return "error/passwdError";
	   }
	   
	   if(flag) {
		   redi.addFlashAttribute("msg", "게시물을 삭제했습니다.");
		   return "redirect:/notice/list";
	   } else {
		   model.addAttribute("flag", flag);
		   return "error/error";
	   }	   
   }
   @GetMapping("/notice/delete")
   public String delete(int notice_num, Model model) throws Exception {

//	   int cnt = NrService.rcount(notice_num);
//	   model.addAttribute("cnt", cnt);	
	   
	   model.addAttribute("notice_num", notice_num); // Get방식 update에서는 dto에 넣어서 넘겨주었기 때문에, update.jsp에서 ${dto.notice_num}으로 받은 것이지만, 여기서는 int notice_num 변수 그대로 넘겨주었기 때문에 delete.jsp에서 ${notice_num}으로 받을 수 있는 것이다.
	   
	   return "/notice/delete";
   }
}