package spring.model.notice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.popcorn.NoticeMapper;
import spring.mapper.popcorn.NreplyMapper;

@Service
public class NoticeServiceImpl implements NoticeService{

   @Autowired
   private NoticeMapper NoMapper;
   @Autowired
   private NreplyMapper NrMapper;
   
   @Override
   public int create(NoticeDTO dto) throws Exception {
      
      return NoMapper.create(dto);
   }
   
   @Override
   public List<NoticeDTO> list(Map map) throws Exception{
	   
	   return NoMapper.list(map);
   }
   
   @Override
   public int total(Map map) throws Exception{
	   
	   return NoMapper.total(map);
   }
   
   @Override
   public NoticeDTO read(int notice_num) throws Exception{
	   
	   return NoMapper.read(notice_num);
   }
   
   @Override
   public int update(NoticeDTO dto) throws Exception{
	   
	   return NoMapper.update(dto);
   }
   
   @Override
   public int delete(int notice_num) throws Exception{
	   NrMapper.bdelete(notice_num);
	   return NoMapper.delete(notice_num);
   }

   @Override
   public int passCheck(Map map) throws Exception {
	  
	   return NoMapper.passCheck(map);
   }
   
}