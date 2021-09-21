package com.web.mapper;

import java.util.List;

import javax.swing.text.AbstractDocument.Content;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.web.domain.Member;


@Repository("MemberMapper")
public interface MemberMapper {
 
	 public int registerBoard( @Param("userid")String userid, 
			 @Param("userpwd")String userpwd,
			 @Param("username") String username);

}
