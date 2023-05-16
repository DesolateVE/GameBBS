package com.ve.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.ve.po.UserModel;
import com.ve.service.AccountService;

@Controller
public class LoginController {
	@Resource
	private AccountService as;

	@PostMapping("login")
	public String login(UserModel user, HttpServletRequest httpServletRequest) {
		UserModel u = as.login(user);
		HttpSession session = httpServletRequest.getSession();
		if (u != null) {
			session.setAttribute("loginUser", u);
			
			return "bbshome";
		} else {
			return "error";
		}
	}
	@RequestMapping("userout")
	public String userout(HttpSession session) {
		session.invalidate();
		return "bbshome";
	}
}
