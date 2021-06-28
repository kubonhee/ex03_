package com.capriberry.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.capriberry.domain.BoardAttachVO;
import com.capriberry.domain.BoardVO;
import com.capriberry.domain.Criteria;
import com.capriberry.mapper.BoardAttachMapper;
import com.capriberry.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	private BoardMapper boardMapper; 
	private BoardAttachMapper boardAttachMapper; 
	
	@Override
	@Transactional
	public void register(BoardVO boardVO) {
		log.info("register..." + boardVO);
		boardMapper.insertSelectKey(boardVO);
		boardVO.getAttachList().forEach(a -> {
			a.setBno(boardVO.getBno());
			boardAttachMapper.insert(a);
		});
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		return boardMapper.read(bno);
	}

	@Override
	@Transactional
	public boolean modify(BoardVO boardVO) {
		// TODO Auto-generated method stub
		log.info("modify .... " + boardVO);
		boardAttachMapper.deleteAll(boardVO.getBno());
		boardVO.getAttachList().forEach(a -> {
			a.setBno(boardVO.getBno());
			boardAttachMapper.insert(a);
		});
		return boardMapper.update(boardVO) > 0;
	}

	@Override
	@Transactional
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		boardAttachMapper.deleteAll(bno);
		return boardMapper.delete(bno) > 0;
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("getList...");
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		list.forEach(vo->  {
			vo.setAttachList(boardAttachMapper.findBy(vo.getBno()));
			List<BoardAttachVO> attachs = boardAttachMapper.findBy(vo.getBno());
			for(BoardAttachVO att : attachs) {
				if(att.isImage()) {
					log.warn(att);
					attachs.set(0, att);
					vo.setAttachList(attachs.subList(0, 1));
					log.warn(attachs);
					break;
				}
			}
			if(attachs.size() == 0) {
				vo.setAttachList(null);
			}
		});
		return list;
	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("getTotal...");
		return boardMapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("getAttachList..." + bno);
		return boardAttachMapper.findBy(bno);
	}
	
	
		
}
