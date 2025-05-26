package org.zerock.main.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.zerock.main.vo.MainSearchVO;

import com.webjjang.util.page.PageObject;

@Repository
public interface MainMapper {

	public Long getTotalRow(PageObject pageObject);
	
	public List<MainSearchVO> list(PageObject pageObject);
	
}
