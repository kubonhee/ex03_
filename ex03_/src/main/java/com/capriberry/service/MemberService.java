package com.capriberry.service;

import org.springframework.stereotype.Service;

import com.capriberry.domain.AuthVO;
import com.capriberry.domain.MemberVO;

@Service
public interface MemberService {

	public void register(MemberVO memberVO) throws Exception; // 회원 가입
	
	public void authorization(AuthVO authVO) throws Exception; // 권한 부여

}
