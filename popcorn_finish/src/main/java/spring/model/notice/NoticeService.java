package spring.model.notice;

import java.util.List;
import java.util.Map;

public interface NoticeService {

   int create(NoticeDTO dto) throws Exception;
   List<NoticeDTO> list(Map map) throws Exception;
   int total(Map map) throws Exception;
   NoticeDTO read(int notice_num) throws Exception;
   int update(NoticeDTO dto) throws Exception;
   int delete(int notice_num) throws Exception;
   
   int passCheck(Map map) throws Exception;
}