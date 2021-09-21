package com.web.controller;
    
import java.io.File;
	import java.io.IOException;
	import java.util.List;

	import javax.servlet.ServletRequest;
	import javax.servlet.http.HttpServletRequest;
	import javax.swing.text.AbstractDocument.Content;

	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Controller;
	import org.springframework.ui.Model;
	import org.springframework.web.bind.annotation.RequestBody;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.bind.annotation.RequestMethod;
	import org.springframework.web.bind.annotation.RequestParam;
	import org.springframework.web.bind.annotation.ResponseBody;
	import org.springframework.web.multipart.MultipartFile;
	import org.springframework.web.multipart.MultipartHttpServletRequest;

	import com.google.gson.Gson;
import com.web.domain.Board;
import com.web.domain.Member;

import com.web.service.MemberService;

@Controller 
	 public class MemberController {
@Autowired 
	 private MemberService e;
	 
	 
	  @RequestMapping(value = "/register", method = RequestMethod.GET) 
	  public String register() { 
		  return "register"; 
		  }
	 
	 	@RequestMapping(value = "/registerAction", method = RequestMethod.POST)
		public String registerAction( HttpServletRequest httpServletRequest) throws IllegalStateException, IOException  {
	 		
	 		
	 		
	 		String userid  = httpServletRequest.getParameter("userid");
			String userpwd  = httpServletRequest.getParameter("userpwd");
			String username  = httpServletRequest.getParameter("username");
	 		
	 		//String PATH = req.getSession().getServletContext().getRealPath("/") + "resources/";
	 		
	 		
	 		e.registerBoard(userid, userpwd, username);
	 		
			// sql.delete(namespace + ".delete", idx);
			return "index";
		}
	 	
		/*
		 * @RequestMapping(value = "/registerform", method = RequestMethod.GET)
		 * 
		 * @ResponseBody public register registerform() { return e.getRegister(); }
		 */
}
	