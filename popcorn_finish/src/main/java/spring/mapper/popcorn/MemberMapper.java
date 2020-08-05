package spring.mapper.popcorn;

import java.util.List;
import java.util.Map;

import spring.model.member.MemberDTO;

public interface MemberMapper {
	int create(MemberDTO dto);
	int duplicateEmail(String email);
	int duplicateId(String id);
	int update(MemberDTO dto);
	String getGrade(String id);
	int loginCheck(Map<String, String> map);
	MemberDTO read(String id);
	List<MemberDTO> list(Map map);
	int total(Map map);
	int delete(String id);
	int updatePw(Map map);
	String findPw(Map map);
	String findId(Map map);
	int duplicateName(String name);

	int updateAuthkey(MemberDTO dto);
	int updateAuthstatus(MemberDTO dto);
}
