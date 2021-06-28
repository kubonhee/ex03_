package com.capriberry.service;

import java.util.List;

import com.capriberry.domain.Criteria;
import com.capriberry.domain.ReplyPageDTO;
import com.capriberry.domain.ReplyVO;

public interface ReplyService {
	int register(ReplyVO vo);
	
	ReplyVO get(Long rno);
	
	int modify(ReplyVO vo);
	
	int remove(Long rno);
	
	List<ReplyVO> getList(Criteria cri, Long bno);
	
	ReplyPageDTO getListPage(Criteria cri, Long bno);
	
	List<ReplyVO> getListMore(Long rno, Long bno);
}
