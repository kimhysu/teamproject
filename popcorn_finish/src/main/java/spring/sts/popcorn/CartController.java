package spring.sts.popcorn;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.cart.CartDTO;
import spring.model.cart.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService Cservice;
	
	@RequestMapping("/cart/create")
	public String create(CartDTO dto, HttpSession session,
			RedirectAttributes redi, HttpServletRequest request,
			Model model, int movie_num) {
		String id = (String) session.getAttribute("id");
		dto.setId(id);
		dto.setMovie_num(movie_num);
		//장바구니에 기존 상품 있는지 검사
		int count = Cservice.dupCheck(dto.getMovie_num(),id);
		
		if(count==0) {
			boolean flag = Cservice.create(dto);
			if(flag) {
				redi.addFlashAttribute("msg", "장바구니에 추가했습니다.");
				return "redirect:/cart/list";
			}else {
				model.addAttribute("flag", flag);
				return "error/error";
			}
		}else {
			redi.addFlashAttribute("msg", "이미 장바구니에 존재합니다.");
			return "redirect:/cart/list";
		}
	}
	
   @RequestMapping("/cart/list")
   public ModelAndView list(HttpSession session,ModelAndView mav) {
	   String id = (String)session.getAttribute("id");
	  
	   Map<String,Object> map = new HashMap<String,Object>();
	   List<CartDTO> list = Cservice.list(id);
	   int totalprice = Cservice.totalprice(id);
	   
	   map.put("list", list);
	   map.put("count", list.size());
	   map.put("totalprice", totalprice);
	   
	   mav.setViewName("/cart/list");
	   mav.addObject("map", map);
	   return mav;
   }
   
   @RequestMapping("/cart/delete")
   public String delete(@RequestParam(required=false) int cart_num, RedirectAttributes redi,
		   Model model) {

	   boolean flag = Cservice.delete(cart_num);
	   
	   if(flag) {
			redi.addFlashAttribute("msg", "삭제했습니다.");
			return "redirect:/cart/list";
		}else {
			model.addAttribute("flag", flag);
			return "error/error";
		}
	   
   }
   
//   @ResponseBody
//   @RequestMapping("/cart/order")
//   public String order(@RequestBody CartDTO dto, HttpSession session) {
//	   System.out.println(dto.getList());
//	   return "0";
//   }
  	
	
}
