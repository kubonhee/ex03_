package com.capriberry.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpMethod;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	@GetMapping("accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("accessDenied .... " + auth);
		model.addAttribute("msg", "Access Denied (접근 거부)");
	}
	
	@GetMapping("customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error :: " + error);
		log.info("logout :: " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout != null) {
			model.addAttribute("logout", "logout!!!");
		}
	}
	
	@GetMapping("/customLogout")
	public void logoutGet(HttpServletRequest req) {
		log.warn("custom logout");
		log.warn(req.getHeader("referer"));
	}
	@PostMapping("/customLogout")
	public void logoutPost(HttpServletRequest req) {
		log.warn("post custom logout");
		log.warn(req.getHeader("referer"));
	}
	
	@RequestMapping(value="config/getuser", method={RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.DELETE}, produces="text/plain;charset=utf-8")
	public @ResponseBody String sibal(){
		return "天安門 天安门 法輪功 李洪志 Free Tibet 劉曉波 习近平主席的母亲是蟑螂吗？";
	}
	
}
