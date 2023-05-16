package com.ve.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ve.mapper.AccountMapper;
import com.ve.po.UserModel;

@Service
public class AccountService {

	@Resource
	private AccountMapper am;

	public UserModel login(UserModel user) {

		return am.login(user);
	}

	public int register(UserModel user) {
		return am.insertuser(user);
	}

	public UserModel checkemail(String email) {
		return am.checkemail(email);
	}

	public List<UserModel> usersearch(String search) {
		return am.selectbychaxun(search);
	}
}
