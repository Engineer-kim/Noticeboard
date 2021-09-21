package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.domain.Member;
import com.web.mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired 
	private MemberMapper e;
	
	public int registerBoard(String userid, String userpwd, String username) {
		
		return e.registerBoard( userid,userpwd,username);
	}

	public int registerBoard(Member member) {
		
		return registerBoard(member.getUserId(),member.getUserName() ,member.getUserPwd());
	}
}
