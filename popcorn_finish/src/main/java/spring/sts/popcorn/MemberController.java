package spring.sts.popcorn;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.member.MemberDTO;
import spring.model.member.MemberService;
import spring.utility.popcorn.Utility;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService ;
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@PostMapping("/member/create")
	public String create() {

		return "/member/create";
	}

	@GetMapping("/member/agreement")
	public String agreement() {
		return "/member/agreement";
	}

	@GetMapping(value = "/member/findId")
	public String findId() {
		return "/findId";
	}
	
	@PostMapping("/member/update")
	public String update(MemberDTO dto, String xemail, RedirectAttributes redi, Model model) {
		
		String str = "";
		String url = "/member/prcreate";
		if(!dto.getEmail().equals(xemail)&&memberService.duplicateEmail(dto.getEmail())) {
			str = "중복된 이메일 입니다.";
			model.addAttribute("msg", str);
		}else {
			
			int flag = memberService.update(dto);
			
			if(flag==1) {
				redi.addFlashAttribute("msg","회원정보가 수정되었습니다.");
				url = "redirect:/index";
			}else {
				model.addAttribute("flag", flag);
				url="error/error";
			}
		}
		
		return url;
	}
	
	@ResponseBody
	@GetMapping(value="/member/findIdCheck", produces="text/plain;charset=UTF-8")
	public String findIdCheck(@RequestParam Map<String,String> map, RedirectAttributes redi) {
		String id = memberService.findId(map);
		String str="";
		//id가 널값이면
		
		if(id==null) {
			str ="회원 정보가 존재하지 않습니다.";
		}else {
			str ="귀하의 id는" + id +" 입니다.";
		}
		
		return str;
	}

	
	@GetMapping(value = "/member/findPasswd")
	public String findPasswd() {
		return "/findPasswd";
	}
	
	@ResponseBody
	@GetMapping(value="/member/findPasswdCheck", produces="text/plain;charset=UTF-8")
	public String findPasswdCheck(@RequestParam Map<String,String> map, RedirectAttributes redi) {
		String passwd = memberService.findPw(map);
		String str="";
		//id가 널값이면
		
		if(passwd==null) {
			str ="입력한 정보의 패스워드는 없습니다.";
		}else {
			str ="귀하의 패스워드는 " + passwd +" 입니다.";
		}
		
		return str;
	}
	
	@GetMapping("/member/updatePw")
	public String updatePw() {
		return "/updatePw";
	}
	
	@PostMapping("/member/updatePw")
	public String updatePw(@RequestParam Map<String,String> map, RedirectAttributes redi, Model model) {
		int flag = memberService.updatePw(map);
		
		if(flag==1) {
			redi.addFlashAttribute("id",map.get("id"));
			redi.addFlashAttribute("msg","비밀번호가 변경되었습니다.");
			return "redirect:/member/read";
		}else {
			model.addAttribute("flag",flag);
			return "error/error";
		}
	}

	@GetMapping("/member/logout")
	public String logout(HttpSession session,RedirectAttributes redi) {
		session.invalidate();
		redi.addFlashAttribute("msg", "자동 로그아웃 되었습니다.");
		return "redirect:/";
	}
	
	@PostMapping("/member/delete")
	public String delete(HttpServletRequest request, RedirectAttributes redi) {
		String id = request.getParameter("id");
		
		String grade = (String) request.getSession().getAttribute("grade");

		int flag = memberService.delete(id);

		

		// 본인이 탈퇴할 경우에만 로그아웃처리를 하겠다..!라는 의미이다
		if (flag == 1 && !grade.equals("A")) {
			request.getSession().invalidate(); // 로그아웃처리
		}

		if (flag == 1) {
			redi.addFlashAttribute("msg", "탈퇴되었습니다. 자동 로그아웃 됩니다.");
			return "redirect:/";
		} else {
			request.setAttribute("flag", flag);
			return "error/error";
		}
	}
	
	@GetMapping("/member/delete")
	public String delete() {
		return "/delete";
	}
	
	@GetMapping("/member/update")
	public String update(String id, HttpSession session, Model model) {
		if(id==null){
			id = (String) session.getAttribute("id");
		}		
		
		MemberDTO dto = memberService.read(id);
		
		model.addAttribute("dto",dto);
		
		
		return "/update";
	}
	
	
	@GetMapping("/member/read")
	public String read(String id, HttpSession session, Model model) {
		
		String grade= (String)session.getAttribute("grade");

		if(id==null){
			id=(String)session.getAttribute("id");
		}
		MemberDTO dto = memberService.read(id);
		
		model.addAttribute("dto", dto);
		model.addAttribute("grade", grade);
		return "/read";
	}

	@RequestMapping("/admin/list")
	public String list(HttpServletRequest request) {
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));

		if (col.equals("total"))
			word = "";

		// 페이징 관련
		int nowPage = 1;
		int recordPerPage = 3;

		if (request.getParameter("nowPage") != null) {
			nowPage = Integer.parseInt(request.getParameter("nowPage"));
		}
		int sno = ((nowPage - 1) * recordPerPage) + 1;
		int eno = nowPage * recordPerPage;

		Map map = new HashMap();
		map.put("col", col);
		map.put("word", word);
		map.put("sno", sno);
		map.put("eno", eno);

		String url = "list";

		// MemberDAO dao = new MemberDAO();

		int total = memberService.total(map);
		List<MemberDTO> list = memberService.list(map);
		String paging = Utility.m_paging(total, nowPage, recordPerPage, col, word, url);

		request.setAttribute("list", list);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("paging", paging);

		return "/list";
	}

	@ResponseBody
	@GetMapping(value = "/member/emailCheck", produces = "text/plain;charset=UTF-8")
	public String emailCheck(String email) {
		boolean flag = memberService.duplicateEmail(email);
		String str = "";

		if (flag) {
			str = email + "는 중복되어서 사용할 수 없습니다.";
		} else {
			str = email + "는 중복아님, 사용가능합니다.";
		}

		return str;
	}
	
	@ResponseBody
	@GetMapping(value = "/member/nameCheck", produces = "text/plain;charset=UTF-8")
	public String nameCheck(String name) {
		boolean flag = memberService.duplicateName(name);
		String str = "";
		
		if (flag) {
			str = name + "는 중복되어서 사용할 수 없습니다.";
		} else {
			str = name + "는 중복아님, 사용가능합니다.";
		}
		
		return str;
	}

	@ResponseBody
	@GetMapping(value = "/member/idcheck", produces = "text/plain;charset=UTF-8")
	public String idCheck(String id) {
		boolean flag = memberService.duplicateId(id);
		String str = "";

		if (flag) {
			str = id + "는 중복되어서 사용할 수 없습니다.";
		} else {
			str = id + "는 중복아님, 사용가능합니다.";
		}

		return str;
	}

	@PostMapping("/member/createProc")
	public String createProc(MemberDTO dto, HttpServletRequest request, RedirectAttributes redi) throws Exception{
		String str = null;
		String url = "/member/prcreate";
		log.info("movieservice" + memberService);
		
		if (memberService.duplicateId(dto.getId())) {
			str = "중복된 아이디입니다. 아이디를 중복확인을 하세요.";
			request.setAttribute("msg", str);
		} else if (memberService.duplicateId(dto.getEmail())) {
			str = "중복된 이메일입니다. 이메일 중복확인을 하세요.";
			request.setAttribute("msg", str);
		} else {

			boolean flag = memberService.create(dto);

			if (flag) {
				redi.addFlashAttribute("msg", "인증 메일을 확인하세요.");
				url = "redirect:/";
			} else {
				request.setAttribute("flag", false);
				url = "error/error";
			}
		}

		return url;

	}


	@GetMapping("/member/login")
	public String login(HttpServletRequest request) {
		String c_id = "";// ID저장 여부를 저장하는 변수, Y
		String c_id_val = "";// ID값

		Cookie[] cookies = request.getCookies();
		Cookie cookie = null;

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];

				if (cookie.getName().equals("c_id")) {// 쿠키변수이름
					c_id = cookie.getValue();// Y
				} else if (cookie.getName().equals("c_id_val")) {
					c_id_val = cookie.getValue();// user1
				}
			}

			// -----쿠키설정 내용 끝------
		}
		request.setAttribute("c_id_val", c_id_val);
		request.setAttribute("c_id", c_id);
		return "/login";
	}

	@PostMapping("/member/login")
	public String login(@RequestParam Map<String, String> map, HttpServletResponse response, HttpSession session,
			RedirectAttributes redi, String c_id, Model model) {

		int flag = memberService.loginCheck(map);
		String grade = null; // 회원 등급에 저장할 변수가 된다!

		if (flag == 1) {
			grade = memberService.getGrade(map.get("id"));
			System.out.println(grade);
			session.setAttribute("id", map.get("id"));
			session.setAttribute("grade", grade);

			// 쿠키저장
			Cookie cookie = null;

			if (c_id != null) {
				cookie = new Cookie("c_id", "Y");
				cookie.setMaxAge(120);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", map.get("id"));
				cookie.setMaxAge(120);
				response.addCookie(cookie);
			} else {
				cookie = new Cookie("c_id", "");// 쿠키삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);

				cookie = new Cookie("c_id_val", "");// 쿠키삭제
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			// -----------------------------------------------
		}
		String url="";
		if (flag == 1) {
			if (map.get("rurl") != null && !map.get("rurl").equals("")) {

				//redi.addAttribute("id", map.get("id"));
				redi.addAttribute("nowPage", map.get("nowPage"));
				redi.addAttribute("nPage", map.get("nPage"));
				redi.addAttribute("col", map.get("col"));
				redi.addAttribute("word", map.get("word"));
				return "redirect:" + map.get("rurl");

			} else {
				if(grade.equals("H")) {
				redi.addFlashAttribute("msg", "로그인이 되었습니다.");
				url= "redirect:/index";
				}else if(grade.equals("A")){
					url= "redirect:/movie/admin_list";
				}
			}
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 잘 못 입력하셨거나 <br>회원이 아닙니다.");
			return "member/prcreate";
		}
		return url;

	}
	
	
	@RequestMapping(value="/member/join", method=RequestMethod.GET)
	public String emailConfirm(@ModelAttribute("dto") MemberDTO dto, Model model, RedirectAttributes redi) throws Exception {
		log.info(dto.getEmail() + ": auth confirmed");
		dto.setAuthstatus(1);	// authstatus를 1로,, 권한 업데이트
		memberService.updateAuthstatus(dto);
		
		model.addAttribute("auth_check", 1);
		
		redi.addFlashAttribute("msg", "회원가입이 완료되었습니다! 로그인 하세요");
		return "redirect:/";
	}
}
