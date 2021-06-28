package com.capriberry.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.capriberry.domain.BoardVO;
import com.capriberry.domain.Criteria;
import com.capriberry.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void testGetTotalCount() {
		Criteria criteria = new Criteria();
		criteria.setType("TCW");
		criteria.setKeyword("의");
		log.info(mapper.getTotalCount(criteria));
	}
	@Test
	public void testGetList() {
		mapper.getList().forEach(log::info);
	}
	@Test
	public void testGetListWithPaging() {
		mapper.getListWithPaging(new Criteria(5, 20)).forEach(obj ->log.info(obj));
	}
	
	@Test
	public void testInsert() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("단위 테스트 작성 제목231");
		boardVO.setContent("단위 테스트 작성 내용231");
		boardVO.setWriter("newbie");
		
		mapper.insert(boardVO);
		log.info(boardVO);
	}
	@Test
	public void testUpdate() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("수정된 단위 테스트 작성 제목231");
		boardVO.setContent("수정된 단위 테스트 작성 내용231");
		boardVO.setWriter("newbie");
		boardVO.setBno(5L);
		
		log.info(mapper.update(boardVO));
	}
	@Test
	public void testInsertSelectKey() {
		BoardVO boardVO = new BoardVO();
		boardVO.setTitle("단위 테스트 작성 제목1234");
		boardVO.setContent("단위 테스트 작성 내용1234");
		boardVO.setWriter("newbie");
		
		mapper.insertSelectKey(boardVO);
		log.info(boardVO);
	}
	
	@Test
	public void testRead() {
//		log.info(mapper.read(1L));
		log.info(mapper.read(163924L));
	}
	
	@Test
	public void testDelete() {
		log.info(mapper.delete(3L));
	}
	
	@Test
	public void testSearch() {
		Criteria criteria = new Criteria();
		criteria.setType("TCW");
		criteria.setKeyword("' UNION SELECT NULL, NULL, NULL, NULL, NULL, NULL FROM TBL_BOARD --");
		
		mapper.getListWithPaging(criteria);
	}
	
}
