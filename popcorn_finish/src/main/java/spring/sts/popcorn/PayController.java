package spring.sts.popcorn;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.model.cart.CartDTO;
import spring.model.cart.CartService;
import spring.model.movie.MovieDTO;
import spring.model.movie.MovieService;
import spring.model.pay.PayDTO;
import spring.model.pay.PayService;

@Controller
public class PayController {
	
	@Autowired
	private PayService Pservice;
	@Autowired
	private CartService Cservice;

	@ResponseBody
	@RequestMapping(value="/pay/list", method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView list(HttpSession session,ModelAndView mav) {
		String id = (String)session.getAttribute("id");
		
		List<PayDTO> list = Pservice.list(id);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("count", list.size());
		mav.addObject("map", map);
		mav.setViewName("/pay/list");
		return mav;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/pay/create", method={RequestMethod.GET,RequestMethod.POST})
	public String create(@RequestBody CartDTO param,HttpServletRequest request,
	PayDTO dto, HttpSession session, RedirectAttributes redi, Model model) {
		List list = param.getList();
		String pay_way = param.getPay_way();
		String id = (String)session.getAttribute("id");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pay_way", pay_way);
		map.put("id", id);
		map.put("list", list);
		
		int pay_sum = 0;
		for(int i=0;i<list.size();i++) {
			int price = ((CartDTO) list.get(i)).getMovie_price();
			pay_sum += price;
		}
		map.put("pay_sum", pay_sum);
	
			boolean flag = false;
			try {
				flag = Pservice.payCreate(map);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			if(flag) {
				return "1";
			}else {
				return "0";
			}
				
	}
	
}
	
	

