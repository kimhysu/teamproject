package spring.sts.popcorn;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import spring.model.rreply.RreplyDTO;
import spring.model.rreply.RreplyService;
import spring.utility.popcorn.Utility;




@RestController
public class RreplyController {
	private static final Logger log = LoggerFactory.getLogger(RreplyController.class);
	
	@Autowired
	private RreplyService rService;
	
	@PutMapping("/review/rreply/{rreply_num}")
	public ResponseEntity<String> modify(
						@RequestBody RreplyDTO vo,  //JSON으로 보낸 PARAMETER를 DTO로 한번에 받는다 
						@PathVariable("rreply_num") int rreply_num) {
	 
		
		log.info("rreply_num: " + rreply_num);
		log.info("modify: " + vo);
	 
	return rService.update(vo) == 1
	? new ResponseEntity<>("success", HttpStatus.OK)
	: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	 
	}
	 
	@DeleteMapping("/review/rreply/{rreply_num}")
	public ResponseEntity<String> remove(@PathVariable("rreply_num") int rreply_num) {
	 
	log.info("remove: " + rreply_num);
	 
	return rService.delete(rreply_num) == 1
	? new ResponseEntity<>("success", HttpStatus.OK)
	: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	 
	}
	
	@GetMapping("/review/rreply/{rreply_num}")
	public ResponseEntity<RreplyDTO> get(@PathVariable("rreply_num") int rreply_num) {
	 
	log.info("get: " + rreply_num);
	 
	return new ResponseEntity<>(rService.read(rreply_num), HttpStatus.OK);
	}
	
	@GetMapping("/review/rreply/page")
	public ResponseEntity<String> getPage(
	@RequestParam("nPage") int nPage,
	@RequestParam("nowPage") int nowPage,
	@RequestParam("review_num") int review_num)
//	,@RequestParam("col") String col,
//	@RequestParam("word") String word
	{
	 
	 int total = rService.total(review_num);
	 String url = "read";
	 
	 int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
	 
	 String fk = "&review_num=";
	 
	 String paging = Utility.rpaging(total, nowPage, recordPerPage, url, nPage, fk, review_num);
	 
	 return new ResponseEntity<>(paging, HttpStatus.OK);
	 
	}
	
	@GetMapping("/review/rreply/list/{review_num}/{sno}/{eno}")
	public ResponseEntity<List<RreplyDTO>> getList(
	@PathVariable("review_num") int review_num,
	@PathVariable("sno") int sno,
	@PathVariable("eno") int eno){
	 
	Map map = new HashMap();
	map.put("sno", sno);
	map.put("eno", eno);
	map.put("review_num", review_num);
	 
	return new ResponseEntity<List<RreplyDTO>>(rService.list(map), HttpStatus.OK);
	}
	
	@PostMapping("/review/rreply/create")
	public ResponseEntity<String> create(@RequestBody RreplyDTO vo) {
	//responsebody는 데이터만을 가져가지만 entity는 상태값도 가져감
	//요청과 다른 형식의 파라미터를 받아올때 - @RequestBody
	//ex) json으로 받아온 파라미터를 dto로 받아옴	
	log.info("ReplyDTO1: " + vo.getRreply_content());
	log.info("ReplyDTO1: " + vo.getId());
	log.info("ReplyDTO1: " + vo.getRreply_num());
	 
    vo.setRreply_content(vo.getRreply_content().replaceAll("/n/r", "<br>"));  
	 
	int flag = rService.create(vo);
	 
	log.info("Reply INSERT flag: " + flag);
	 
	return flag == 1   //삼항연산자 조건과 맞다면 전식 아니면 후식을 리턴
	? new ResponseEntity<>("success", HttpStatus.OK)
	: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}

	
	
