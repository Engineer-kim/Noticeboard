package com.web.mapper;

import java.util.HashMap;
import java.util.List;

import javax.swing.text.AbstractDocument.Content;


import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


import com.web.domain.Board;
import com.web.domain.Reply;

@Repository("BoardMapper")
public interface BoardMapper {
	public boolean addBoard(Board b);
	public List<Board> getBoard();
	public Board getBoardOne(int idx);
	public boolean addReply(Reply r);
	public List<Reply> getReply(int boardIdx);
	public Board getContents(Content content);
	
	
	
	
	public int deleteBoard(int idx);
	
	
	/*
	 * public static void modifyBoard(int idx, String title) {
	 * 
	 * }
	 */
	public int modifyBoard(@Param("idx")int idx,@Param("title") String title,@Param("contents") String contents,@Param("num") int num );  // 여러 파라미터 값 가져오기
	public List list(int idx, String title, String contents,String image);
	
	
	
	//페이징
	public int count() throws Exception;
	
	public List listPage( @Param("displayPost") int displayPost,  @Param("postNum")int postNum) throws Exception; // 여러 파라미터 값 가져오기
	
	
	
	
	// 검색
	
	public List listPageSearch(@Param("displayPost") int displayPost, @Param("postNum") int postNum,@Param("searchType") String searchType,@Param("keyword") String keyword)throws Exception;
	public int searchCount(String searchType, String keyword);
	public List selectList(String string, HashMap<String, Object> data);
	 

	
}
