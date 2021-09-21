package com.web.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.domain.Board;
import com.web.domain.Reply;
import com.web.mapper.BoardMapper;

@Service
public class BoardService {
	@Autowired private BoardMapper m;
	public boolean addBoard(Board b) {
		return m.addBoard(b);
	}

	
	public Board getBoardOne(int idx) {
		return m.getBoardOne(idx);
	}
	public boolean addReply(Reply r) {
		return m.addReply(r);
	}
	public List<Reply> getReply(int boardIdx) {
		return m.getReply(boardIdx);
	}
	
	

	public int deleteBoard(int idx) throws Exception{
		return m.deleteBoard(idx);
	}

	
	/*
	 * public boolean modifyBoard(Board b) { 
	 * return m.addBoard(b); 
	 * 
	 * }
	 */
	/*
	 * public int modifyBoard(int idx, String title, String contents) { return
	 * m.modifyBoard (idx , title, contents);
	 * 
	 * 
	 * }
	 */

	public int modifyBoard(int idx  ,String title , String contents,  int num ) {
		return m.modifyBoard(idx ,title, contents ,num);
		
	}

	/*
	 * public List boardlist(int idx ,String title , String contents) {
	 * 
	 * return m.boardlist(idx ,title, contents ); }
	 */
	public List<Board> getBoard(){
		return m.getBoard();
	}


	public List boardlist() {
		
		return m.getBoard();
	}


	public List boardList() {
		
		return m.getBoard();
	}

	
	
	
	
	
	///페이지 부분
	
	public int count() throws Exception {
	 return m.count();
	}


	public List list() {
		
		return null;
	}

	// 게시물 목록 + 페이징
	public List listPage(int displayPost, int postNum) throws Exception {

	 HashMap data = new HashMap();
	  
	 data.put("displayPost", displayPost);
	 data.put("postNum", postNum);
	  
	return m.listPage(displayPost, postNum);
	}
	
	
	//검색
	
	
	 public List listPageSearch( int displayPost, int postNum, String searchType,String keyword) throws Exception { 
		 
		 return m.listPageSearch(displayPost,postNum, searchType, keyword); 
	 }
	


	
	 	public int searchCount(String searchType, String keyword) throws Exception {
	  
		  return m.searchCount(searchType, keyword); 
	} 
	  public List listPageSearch( int displayPost, int postNum, String searchType, String keyword, String namespace) throws Exception {
	  
	  HashMap<String, Object> data = new HashMap<String, Object>();
	  
	  data.put("displayPost", displayPost); data.put("postNum", postNum);
	  
	  data.put("searchType", searchType); data.put("keyword", keyword);
	  
	  return m.selectList(namespace + ".listPageSearch", data); }
	 
	

	

	


	

}
