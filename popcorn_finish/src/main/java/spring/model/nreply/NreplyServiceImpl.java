package spring.model.nreply;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mapper.popcorn.NreplyMapper;

@Service
public class NreplyServiceImpl implements NreplyService{

   @Autowired
   private NreplyMapper NrMapper;
   
   @Override
   public int create(NreplyDTO dto) throws Exception {
      
      return NrMapper.create(dto);
   }
   
   @Override
   public List<NreplyDTO> list(Map map) throws Exception{
	   
	   return NrMapper.list(map);
   }
   
   @Override
   public int total(int notice_num) throws Exception{
	   
	   return NrMapper.total(notice_num);
   }
   
   @Override
   public NreplyDTO read(int notice_num) throws Exception{
	   
	   return NrMapper.read(notice_num);
   }
   
   @Override
   public int update(NreplyDTO dto) throws Exception{
	   
	   return NrMapper.update(dto);
   }
   
   @Override
   public int delete(int notice_num) throws Exception{
	   
	   return NrMapper.delete(notice_num);
   }

   @Override
   public int rcount(int notice_num) throws Exception{
	   
	   return NrMapper.rcount(notice_num);
   }

   @Override
	public int bdelete(int notice_num) throws Exception{
	   
		return NrMapper.bdelete(notice_num);
	}
   
}