package com.capriberry.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.capriberry.domain.MemberVO;
import com.capriberry.service.MemberService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
public class MemberController{
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	
	// get
	@RequestMapping(value ="/register", method = RequestMethod.GET)
	public void getRegister() throws Exception {
		logger.info("get register");
	}
	//post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO memberVO) throws Exception{
		logger.info("post register");
		
		
		
		memberService.register(memberVO);
		
		
		
		return "redirect:/customLogin";
	}
//	@RequestMapping(value ="/register", method = RequestMethod.GET)
//	public String register(MemberVO vo) {
//		System.out.println("userId::"+ vo.getUserid());
//		System.out.println("userPw::"+ vo.getUserpw());
//		System.out.println("name::"+ vo.getUserName());
//		log.info(vo.getUserid());
//		
//		return "register";
//	}
}
