package org.zerock.message.service;

import java.util.List;

import org.zerock.message.vo.MessageVO;

import com.webjjang.util.page.PageObject;

public interface MessageService {

	public List<MessageVO> getNewMessageList(PageObject pageObject);

	public List<MessageVO> list(PageObject pageObject);

	public MessageVO view(Long no);

	public int write(MessageVO vo);

	public int update(MessageVO vo);

	public int delete(MessageVO vo);
	
}
