package org.zerock.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.zerock.message.mapper.MessageMapper;
import org.zerock.message.vo.MessageVO;

import com.webjjang.util.page.PageObject;

import lombok.Setter;

@Service
@Qualifier("messageServiceImpl")
public class MessageServiceImpl implements MessageService {

	@Setter(onMethod_ = @Autowired)
	private MessageMapper mapper;
	
	@Override
	public List<MessageVO> getNewMessageList(PageObject pageObject) {
		// TODO Auto-generated method stub
		return mapper.getNewMessageList(pageObject);
	}

	@Override
	public Object list(PageObject pageObject) {
		// TODO Auto-generated method stub
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}

	@Override
	public Object view(Long no) {
		// TODO Auto-generated method stub
		return mapper.view(no);
	}

	@Override
	public int write(MessageVO vo) {
		// TODO Auto-generated method stub
		return mapper.write(vo);
	}

	@Override
	public int update(MessageVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(MessageVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
