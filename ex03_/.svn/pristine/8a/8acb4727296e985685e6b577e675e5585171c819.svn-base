package com.capriberry.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.capriberry.domain.Criteria;
import com.capriberry.domain.ReplyPageDTO;
import com.capriberry.domain.ReplyVO;
import com.capriberry.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyServiceTests {
	@Autowired
	private ReplyService service;

	@Test
	public void testService() {
		log.info(service);
	}

	@Test
	public void testRegister() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(163865L);
		vo.setReply("서비스 작성글");
		vo.setReplyer("작성자");
		log.info("register :: " + service.register(vo));
	}

	@Test
	public void testGet() {
		Long rno = 8L;
		log.info("get :: " + service.get(rno));
	}

	@Test
	public void testModify() {
		ReplyVO vo = new ReplyVO();
		vo.setRno(8L);
		vo.setReply("서비스 작성글");
		log.info("modify :: " + service.modify(vo));
	}

	@Test
	public void testRemove() {
		Long rno = 9L;
		log.info("remove :: " + service.remove(rno));
	}

	@Test
	public void testGetList() {
		service.getList(new Criteria(), 163865L).forEach(log::info);
	}

	@Test
	public void testGetListPage() {
		ReplyPageDTO dto = service.getListPage(new Criteria(11,10), 163865L);
		log.info(dto);
		log.info(dto.getCri());
		log.info(dto.getStartPage());
		log.info(dto.getEndPage());
		log.info(dto.getTotal());
		log.info(dto.isPrev());
		log.info(dto.isNext());
		dto.getList().forEach(log::info);
	}
}
