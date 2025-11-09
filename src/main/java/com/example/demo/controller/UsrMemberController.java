package com.example.demo.controller;


import java.net.http.HttpRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Member;
import com.example.demo.dto.ResultData;
import com.example.demo.service.MemberService;
import com.example.demo.util.Util;

import jakarta.servlet.http.HttpSession;

@Controller
public class UsrMemberController {

	private MemberService memberService;
	
	public UsrMemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("usr/member/join")
	public String join() {
		return "usr/member/join";
	}
	
	@GetMapping("usr/member/doJoin")
	@ResponseBody
	public String doJoin(String loginId, String loginPw, String loginPwChk, String name) {
		
		this.memberService.joinMember(loginId, loginPw, name);
		return Util.jsReplace(String.format("[%s]님의 가입이 완료되었습니다.", loginId), "/");
	}	
	
	@GetMapping("usr/member/loginIdDupChk")
	@ResponseBody
	public ResultData<String> loginIdDupChk(String loginId) {
		
		Member member = this.memberService.getMemberByLoigId(loginId);
		
		if(member != null) {
			return new ResultData<>("F-1", String.format("[ %s ]는 이미 사용중인 아이디입니다.", loginId), loginId);
		}
		return new ResultData<>("S-1", String.format("[ %s ]는 사용 가능한 아이디입니다.", loginId), loginId);
	}
	
	@GetMapping("usr/member/login")
	public String login() {
		return "usr/member/login";
	}
	
	@GetMapping("usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpSession session ,String loginId, String loginPw) {
		
		Member member = this.memberService.getLoginMember(loginId, loginPw);
		
		if(member == null) {
			return Util.jsReplace("아이디 or 비밀번호가 일치하지 않습니다.", "/usr/member/login");
		}
		
		session.setAttribute("member", member);
		
		return Util.jsReplace(String.format("[%s]님 환영합니다.", loginId), "/");
	}
	
	@GetMapping("usr/member/logout")
	@ResponseBody
	public String logout(HttpSession session) {
		
		session.removeAttribute("member");
		
		return Util.jsReplace("정상적으로 로그아웃 되었습니다." ,"/"); 
	}
	
}
