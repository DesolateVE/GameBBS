package com.ve.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.ve.po.UserModel;
import com.ve.service.AccountService;

@Controller
public class AccountController {
	@Resource
	private AccountService as;

	@PostMapping("register")
	public String register(UserModel user) {
		int flag = as.register(user);
		if (flag == 1) {
			return "bbshome";
		} else {
			return "error";
		}
	}
}
