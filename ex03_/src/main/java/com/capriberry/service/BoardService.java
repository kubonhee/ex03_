package com.capriberry.service;

import java.util.List;

import com.capriberry.domain.BoardAttachVO;
import com.capriberry.domain.BoardVO;
import com.capriberry.domain.Criteria;

public interface BoardService {
	void register(BoardVO boardVO); // 글 등록
	
	BoardVO get(Long bno); // 상세 조회
	
	boolean modify(BoardVO boardVO); // 글 수정
	
	boolean remove(Long bno); // 글 삭제
	
//	List<BoardVO> getList(); // 목록 조회
	List<BoardVO> getList(Criteria cri); // 페이징 처리가 된 목록 조회
	
	int getTotal(Criteria cri);
	
	List<BoardAttachVO> getAttachList(Long bno);
}
