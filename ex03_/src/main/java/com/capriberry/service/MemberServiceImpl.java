package com.capriberry.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.capriberry.domain.AuthVO;
import com.capriberry.domain.MemberVO;
import com.capriberry.mapper.AuthMapper;
import com.capriberry.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper memberMapper;
	@Autowired @Qualifier("BCryptPasswordEncoder")
	private PasswordEncoder encoder;
	@Autowired
	AuthMapper authMapper; 
	

	@Override
	@Transactional
	public void register(MemberVO memberVO) throws Exception {
		
		AuthVO authVO = new AuthVO();
		authVO.setUserid(memberVO.getUserid());
		authVO.setAuth("ROLE_USER");
		
		memberVO.setUserpw(encoder.encode(memberVO.getUserpw()));
		memberMapper.register(memberVO);
		authMapper.authorization(authVO);
		
	}

	@Override
	public void authorization(AuthVO authVO) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
