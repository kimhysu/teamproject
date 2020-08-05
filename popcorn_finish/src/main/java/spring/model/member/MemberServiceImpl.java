package spring.model.member;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import spring.mapper.popcorn.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberMapper meMapper;

	

	@Override
	public boolean duplicateId(String id) {
		boolean flag = false;
		
		flag = meMapper.duplicateId(id)>0;
		
		return flag;
	}

	@Override
	public int loginCheck(Map<String, String> map) {
		
		int flag = meMapper.loginCheck(map);
		return flag;
	}
	@Override
	public String getGrade(String id) {
		
		String grade = meMapper.getGrade(id);
	
		return grade;
	}

	@Override
	public boolean duplicateEmail(String email) {
		boolean flag = false;
		
		flag = meMapper.duplicateEmail(email)>0;
		
		return flag;
	}

	@Override
	public int total(Map map) {
		return meMapper.total(map);
	}

	@Override
	public List<MemberDTO> list(Map map) {
		return meMapper.list(map);
	}

	@Override
	public MemberDTO read(String id) {
		
		return meMapper.read(id);
	}

	@Override
	public int update(MemberDTO dto) {
		return meMapper.update(dto);
	}

	@Override
	public boolean duplicateName(String name) {
		boolean flag = false;
		
		flag = meMapper.duplicateName(name)>0;
		
		
		return flag;
	}

	@Override
	public String findId(Map<String, String> map) {
		String findid = meMapper.findId(map);
		return findid;
	}

	@Override
	public String findPw(Map<String, String> map) {
		String findpw = meMapper.findPw(map);
		return findpw;
		
	}

	@Override
	public int delete(String id) {
		
		return meMapper.delete(id);
	}

	@Override
	public int updatePw(Map<String, String> map) {
		
		int flag = meMapper.updatePw(map);
		
		
		return flag;
		
		
	}

	@Override
	@Transactional
	public boolean create(MemberDTO dto) throws Exception {
		boolean flag = false;
		// 임의의 authkey 생성
		String authkey = new TempKey().getKey(50, false);
		dto.setAuthkey(authkey);
		meMapper.updateAuthkey(dto);
		System.out.println("authkey"+authkey);
		flag = meMapper.create(dto) > 0;
		

	
		// mail 작성 관련 
				MailUtils sendMail = new MailUtils(mailSender);

				sendMail.setSubject("[popcorn] 회원가입 이메일 인증");
				sendMail.setText(new StringBuffer().append("<h1>[이메일 인증]</h1>")
						.append("<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>")
						.append("<p>인증 후 로그인을 해주세요.</p>")
						.append("<a href='http://localhost:8081/popcorn/member/join?id=")
						.append(dto.getId())
						.append("&email=")
						.append(dto.getEmail())
						.append("&authkey=")
						.append(authkey)
						.append("' target='_blenk'>이메일 인증 확인</a>")
						.toString());
				sendMail.setFrom("solpopcorn510@gmail.com", "popcorn");
				sendMail.setTo(dto.getEmail());
				sendMail.send();
		return flag;
	}

	@Override
	public int updateAuthstatus(MemberDTO dto) {
		int updateAuthstatus = meMapper.updateAuthstatus(dto);
		return updateAuthstatus;
	}	
	
	
}
