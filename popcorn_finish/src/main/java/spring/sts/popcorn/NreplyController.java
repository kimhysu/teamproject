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

import spring.model.nreply.NreplyDTO;
import spring.model.nreply.NreplyService;
import spring.utility.popcorn.Utility;

@RestController
public class NreplyController {

	private static final Logger log = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private NreplyService NrService;

	
	@PutMapping("/notice/reply/{nreply_num}")
	public ResponseEntity<String> modify(
			@RequestBody NreplyDTO vo, 
			@PathVariable("nreply_num") int nreply_num) throws Exception {
		
		log.info("nreply_num: " + nreply_num);	//syso대신에 console창에 띄우기 위해 쓰는 것!
		log.info("modify: " + vo);
	 
		return NrService.update(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	 
	@DeleteMapping("/notice/reply/{nreply_num}")
	public ResponseEntity<String> remove(@PathVariable("nreply_num") int nreply_num) throws Exception {
	 
		log.info("remove: " + nreply_num);
	 
		return NrService.delete(nreply_num) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	@GetMapping("/notice/reply/{nreply_num}")
	public ResponseEntity<NreplyDTO> get(@PathVariable("nreply_num") int nreply_num) throws Exception {
		
		log.info("get: " + nreply_num);
	 
		return new ResponseEntity<>(NrService.read(nreply_num), HttpStatus.OK);
	}
	
	
	
	@GetMapping("/notice/reply/page")
	public ResponseEntity<String> getPage(
			@RequestParam("nPage") int nPage,
			@RequestParam("nowPage") int nowPage,
			@RequestParam("notice_num") int notice_num,
		    @RequestParam("col") String col,
		    @RequestParam("word") String word) throws Exception{
	 
		int total = NrService.total(notice_num);
		String url = "read";
	 
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		
		String fk = "&notice_num=";
	 
		String paging = Utility.rpaging(total, nowPage, recordPerPage, col, word, url, nPage, fk, notice_num);
	 
		return new ResponseEntity<>(paging, HttpStatus.OK);
		//이 결과값을 breply.js에서 받는다고..?
	}
	
	
	
	@GetMapping("/notice/reply/list/{notice_num}/{sno}/{eno}")
	public ResponseEntity<List<NreplyDTO>> getList(
			@PathVariable("notice_num") int notice_num,
			@PathVariable("sno") int sno,
			@PathVariable("eno") int eno
			) throws Exception {
	
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("notice_num", notice_num);
	 
		return new ResponseEntity<List<NreplyDTO>>(NrService.list(map), HttpStatus.OK);
	}
	
	
	
	@PostMapping("/notice/reply/create")
	public ResponseEntity<String> create(@RequestBody NreplyDTO vo) throws Exception {


		log.info("ReplyDTO1: " + vo.getNreply_content());
		log.info("ReplyDTO1: " + vo.getId());
		log.info("ReplyDTO1: " + vo.getNotice_num());

		vo.setNreply_content(vo.getNreply_content().replaceAll("/n/r", "<br>"));
		
		System.out.println("========================");
		System.out.println("========================");
		System.out.println("========================");
		System.out.println("========================");
		System.out.println("========================");
		System.out.println("========================");
System.out.println(vo);
		int flag = NrService.create(vo);

		log.info("Reply INSERT flag: " + flag);

		return flag == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
