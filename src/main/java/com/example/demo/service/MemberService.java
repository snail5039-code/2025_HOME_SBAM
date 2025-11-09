package com.example.demo.service;


import org.springframework.stereotype.Service;

import com.example.demo.dao.MemberDao;
import com.example.demo.dto.Member;

@Service
public class MemberService {
	
	private MemberDao memberDao;
	
	public MemberService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public Member getMemberByLoigId(String loginId) {
		return this.memberDao.getMemberByLoigId(loginId);
	}

	public void joinMember(String loginId, String loginPw, String name) {
		this.memberDao.joinMember(loginId, loginPw, name);
	}

	public Member getLoginMember(String loginId, String loginPw) {
		return this.memberDao.getLoginMember(loginId, loginPw);
	}

}
