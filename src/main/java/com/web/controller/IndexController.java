package com.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.web.domain.Board;
import com.web.domain.Page;
import com.web.domain.Reply;
import com.web.service.BoardService;

@Controller
public class IndexController {

	@Autowired
	private BoardService s;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root() {
		return "index";
	}

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Model model ,@RequestParam("num") int num  ,  @RequestParam(value = "searchType" ,required = false , defaultValue ="title") String searchType,
			@RequestParam(value = "keyword" ,required = false, defaultValue = "") String keyword  //,@RequestParam("image") String image
			//@RequestParam("image") String 
			) throws Exception {     
		
		  List list = null; //리스트 초기화 
		  list = s.boardlist(); 
		//  System.out.println("로그 확인" + list.toString() ); //오류 체크 
		 // model.addAttribute("list", list);
		//  model.addAttribute("pageNum", pageNum);   //end="${pageNum}" 의 값을 받아오는 부분
		 
		  // 게시물 총 갯수
			 int count = s.count();
			  
			 // 한 페이지에 출력할 게시물 갯수
			 int postNum = 10;
			  
			 // 하단 페이징 번호 ([ 게시물 총 갯수 ÷ 한 페이지에 출력할 갯수 ]의 올림)
			 int pageNum = (int)Math.ceil((double)count/postNum); //정밀도 측면에서 float보다 double을 더 사용한다
			  
			 // 출력할 게시물
			 int displayPost = Math.max(0, num -1) * postNum; //0보다 클때만 작동 하게끔
			  
			 //한번에 표시할 페이징 번호
			 int pageNum_cnt =10;
			   
				
			 //표시되는 페이지 번호중 마지막 번호 
			 int endPageNum =(int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
				  
			//표시되는 페이지 번호중 첫번째 번호 
			 int startPageNum = endPageNum - (pageNum_cnt -1);
				  
				  
			//표시되는 페이지 번호중 마지막 번호 
			 int endPageNum_tmp = (int)(Math.ceil((double)count/(double)pageNum_cnt));
				  
				  //마지막 번호 재계산 ** 이유:마지막페이지에서 조건이 false가 되어 조건문이 돌지 않음 
			 if(endPageNum >endPageNum_tmp) {
				 endPageNum = endPageNum_tmp; 
				 }
			
			 
			 
			 
			 Page page = new Page();
			  
			  page.setNum(num); 
			  //page.setCount(s.count());
			  
			  page.setSearchTypeKeyword(searchType, keyword);
			  
			//  List list = null; 
			  //list = s.listPage(page.getDisplayPost(),page.getPostNum());
			 list = s.listPageSearch(page.getDisplayPost(),page.getPostNum(), searchType,keyword); //쿼리에서 받아오는 부분 (검색된 리스트)
			  
			//  model.addAttribute("list", list);
			  model.addAttribute("page", page);
			  model.addAttribute("select", num);
			  
			  model.addAttribute("searchType", searchType);
			  model.addAttribute("keyword",keyword);
			  //검색 부분 조건
			  if(!searchType.isEmpty()&& !keyword.isEmpty()) {
					 list = s.listPageSearch(page.getDisplayPost(),page.getPostNum(), searchType,keyword);
				 }
			  else {
				  list=s.listPage(displayPost, postNum);
			  }
			  model.addAttribute("list", list);
			  //검색 상세 조건
			  
				/*
				 * if((int)count<10) { 
				 * pageNum_cnt= 1; 
				 * } else 
				 * { 
				 * pageNum_cnt=2; 
				 * }
				 */
			  
			  
			  
			  
			// List list = null; 
		//	 list = s.listPage(displayPost, postNum); //페이징에서 받아오는 부분 단순히 리스트만 출력 (검색X)
		//	 model.addAttribute("list", list);   ///데이터 삽입 부분
			 model.addAttribute("pageNum", pageNum);
			 
			 boolean prev = startPageNum == 1  ?false :true;
			 boolean next = endPageNum * pageNum_cnt  >= count ? false: true;
			 
			 // 현재페이지
			// model.addAttribute("currentPage", num);
			 
			// 시작 및 끝 번호
			 model.addAttribute("startPageNum", startPageNum);
			 model.addAttribute("endPageNum", endPageNum);

			 // 이전 및 다음 
			 model.addAttribute("prev", prev);
			 model.addAttribute("next", next);
			 
			 model.addAttribute("select"  ,num);

			// model.addAttribute("image", image);
		  
		
		return "listPage";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write() throws Exception{
		return "write";
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(@RequestParam("idx") int idx, Model model ) throws Exception{
		model.addAttribute("idx", idx);
		// String contents = request.getparameter(contents);
		// String title = request.getparameter(title);
	//	model.addAttribute("image", image);
		return "view";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete() {
		return "delete";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(@RequestParam("idx") int idx, Model model ,@RequestParam("num") int num ) {

		Board board = s.getBoardOne(idx);
		
		// Board board = s.getContents(contents);
		model.addAttribute("view", board);
		// System.out.println("board : " + board.getIdx() + " " + board.getTitle() + " "
		// + board.getContents());
		model.addAttribute("idx", idx);
		model.addAttribute("num" ,num);
		return "modify";
	}
	
	//페이지 부분
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage( @RequestParam("num") int num, Model model) throws Exception {
	 
		
		Page page = new Page();
		page.setNum(num);
		page.setCount(s.count());  

		List list = null; 
		list = s.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   
		/*
		 * model.addAttribute("pageNum", page.getPageNum());
		 * 
		 * model.addAttribute("startPageNum", page.getStartPageNum());
		 * model.addAttribute("endPageNum", page.getEndPageNum());
		 * 
		 * model.addAttribute("prev", page.getPrev()); model.addAttribute("next",
		 * page.getNext());
		 */

		model.addAttribute("select", num);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	@RequestMapping(value = "/writeAction", method = RequestMethod.POST)
	public String writeAction(HttpServletRequest req, @RequestParam("file") MultipartFile file,
			@RequestParam("title") String title, @RequestParam("contents") String contents)
			throws IllegalStateException, IOException {
		String PATH = req.getSession().getServletContext().getRealPath("/") + "resources/";
		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(PATH + file.getOriginalFilename()));
		}
		s.addBoard(new Board(0, title, contents, file.getOriginalFilename()));
		//Integer.valueOf(getParameter("num"));
		return "redirect:board?num=1";
	}

	@RequestMapping(value = "/boardList", method = RequestMethod.GET)
	@ResponseBody
	public void boardlist(Model model) throws Exception {
		  
		 // List list = null; //리스트 초기화
		//  list = s.boardlist(); 
	//	  System.out.println("로그 확인" + list.toString() ); //오류 체크 
		//  model.addAttribute("list", list);
		  
		 }
	@RequestMapping(value = "/boardView", method = RequestMethod.GET)
	@ResponseBody
	public Board boardList(@RequestParam("idx") int idx) {
		return s.getBoardOne(idx);
	}

	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	@ResponseBody
	public List<Reply> replyList(@RequestParam("idx") int boardIdx) {
		return s.getReply(boardIdx);
	}

	@RequestMapping(value = "/writeReply", method = RequestMethod.POST)
	public String writeReply(@RequestParam("idx") int idx, @RequestParam("replyIdx") int replyIdx,
			@RequestParam("contents") String contents) {
		s.addReply(new Reply(0, idx, replyIdx, contents));
		
		return "redirect:view?idx=" + idx;
	}

	@RequestMapping(value = "/deleteAction", method = RequestMethod.GET)
	public String deleteAction(@RequestParam("idx") String idx) throws Exception {
		s.deleteBoard(Integer.valueOf(idx));
		// sql.delete(namespace + ".delete", idx);
		return "board";
	}

	@RequestMapping(value = "/modifyAction", method = RequestMethod.POST)
	public String modifyAction(HttpServletRequest httpServletRequest )throws IllegalStateException, IOException {
		
//		System.out.print(req.getParameter("title").toString());
	
		String title  = httpServletRequest.getParameter("title");
		String contents  = httpServletRequest.getParameter("contents");  //폼으로 받기 위함
		int idx = Integer.valueOf(httpServletRequest.getParameter("idx"));
		int num = Integer.valueOf(httpServletRequest.getParameter("num"));
		s.modifyBoard(idx, title, contents ,num);
		
		return "redirect:board?num=" + num;
		/*
		 * public int modifyAction(@RequestParam ("idx")int idx, @RequestParam Model
		 * model, @RequestParam String title, @RequestParam String contents) throws
		 * Exception {
		 * 
		 * model.addAttribute("idx" , idx); model.addAttribute("title", title);
		 * model.addAttribute("contents", contents); return idx;
		 */
		// return "redirect;

	}
	// @ResponseBody
	// public Board modifyAction(@RequestParam("idx")int idx){
	// return s.getBoardOne(idx);
	// }
	/*
	 * @RequestMapping("/modifyAction") public String modifyAction(int idx, Model
	 * model) { Board board = s.addBoard(idx); model.addAttribute("board",board);
	 * return "board/modifyAction"; }
	 */
	
	
	
	/* 검색 구현 부분*/
	
	
	
	
	  @RequestMapping(value = "/listPageSearch", method = RequestMethod.GET) 
	  public void getListPageSearch(Model model, @RequestParam("num") int num ,
	  
	  @RequestParam(value = "searchType" ,required = false , defaultValue ="title") String searchType, @RequestParam(value = "keyword" ,required = false, defaultValue = "title") String keyword ) throws Exception{
	 
	  
	
	  
	  Page page = new Page();
	  
	  page.setNum(num); 
	  //page.setCount(s.count());
	  
	  page.setSearchTypeKeyword(searchType, keyword);
	  
	  List list = null; 
	  //list = s.listPage(page.getDisplayPost(),page.getPostNum());
	 list = s.listPageSearch(page.getDisplayPost(),page.getPostNum(), searchType,keyword);
	  
	  model.addAttribute("list", list);
	  model.addAttribute("page", page);
	  model.addAttribute("select", num);
	  
	  model.addAttribute("searchType", searchType);
	  model.addAttribute("keyword",keyword);
	  
	  }
	 
	
	
	
	
	
	
	
	
	

}    
