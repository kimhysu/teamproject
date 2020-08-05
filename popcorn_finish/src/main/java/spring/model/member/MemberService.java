package spring.model.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	boolean create(MemberDTO dto) throws Exception;

	boolean duplicateId(String id);

	int loginCheck(Map<String, String> map);

	String getGrade(String id);

	boolean duplicateEmail(String email);

	int total(Map map);

	List<MemberDTO> list(Map map);

	MemberDTO read(String id);

	int update(MemberDTO dto);

	boolean duplicateName(String name);

	String findId(Map<String, String> map);

	String findPw(Map<String, String> map);

	int delete(String id);

	int updatePw(Map<String, String> map);

	int updateAuthstatus(MemberDTO dto);
}
