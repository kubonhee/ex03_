package com.capriberry.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.capriberry.domain.MemberVO;
import com.capriberry.mapper.MemberMapper;
import com.capriberry.security.domain.CustomUser;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Log4j
@Data
public class CustomUserDetailsService implements UserDetailsService{
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String useremail) throws UsernameNotFoundException {
		log.warn(useremail);
		
		MemberVO vo = memberMapper.read(useremail);
		
		log.warn("member mapper's vo :: " + vo);

		return vo == null ? null : new CustomUser(vo);
	}
	
}
