package com.web.domain;

public class Member {
	
	private String userid;
	private String userpwd;
	private String username;
	public Member() {
		
	}
	
	public String getUserId() {
		return userid;
	}
	public void setUserId(String userId) {
		this.userid = userId;
	}
	
	public String getUserName() {
		return username;
	}
	public void setUserName(String userName) {
		this.username = userName;
	}
	public String getUserPwd() {
		return userpwd;
	}

	public void setUserPwd(String userPwd) {
		this.userpwd = userPwd;
	}

	public Member(String userid ,String userpwd ,String  name) {
		super();
		this.userid=userid;
		this.userpwd=userpwd;
		this.username = username;
		
	}
	//@Override
//	public String toString() {
	//	return "MemberVO [userId=" + userid + ", userPass=" + userpwd + ", userName=" + username +"]";
	//}
	
	
}
