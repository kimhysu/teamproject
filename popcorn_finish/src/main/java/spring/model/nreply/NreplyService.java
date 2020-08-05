package spring.model.nreply;


import java.util.List;
import java.util.Map;

public interface NreplyService {

   int create(NreplyDTO dto) throws Exception;
   List<NreplyDTO> list(Map map) throws Exception;
   int total(int notice_num) throws Exception;
   NreplyDTO read(int nreply_num) throws Exception;
   int update(NreplyDTO dto) throws Exception;
   int delete(int nreply_num) throws Exception;
 
   int rcount(int notice_num) throws Exception;
   int bdelete(int notice_num) throws Exception;	//댓글 달린 게시글을 삭제하기 위해 추가로 선언한 것
}