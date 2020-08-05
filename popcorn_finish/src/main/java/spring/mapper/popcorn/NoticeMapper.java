package spring.mapper.popcorn;

import java.util.List;

import java.util.Map;

import spring.model.notice.NoticeDTO;

public interface NoticeMapper {
	
	int create(NoticeDTO dto);
	NoticeDTO read(int notice_num);
	int update(NoticeDTO dto);
	int delete(int notice_num);
	List<NoticeDTO> list(Map map);
	int total(Map map);

	int passCheck(Map map);
}