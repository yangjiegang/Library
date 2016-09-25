package com.library.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.library.bean.User;
import com.library.dao.UserDAO;

@Controller
public class UserAction {
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(@RequestParam(value="userName",required = false, defaultValue = "")String userName, @RequestParam(value="password")String password,
			HttpServletRequest request){
		Boolean isExist = userDAO.login(userName, password);
		if (isExist) {
			request.getSession().setAttribute("userName", userName);
			return "welcome";
		} else {
			return "login";
		}
	}
	
	@RequestMapping(value="/register.do", method=RequestMethod.POST)
	public String register(@ModelAttribute User newUser, Model model){
		if (userDAO.register(newUser)) {
			return "login";
		} else {
			model.addAttribute("message","register fault");
			return "register";
		}
	}
}
