package com.ve.controller;



import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.ve.service.BoardService;


/*管理员拥有创建新板块的权利*/
@Controller
public class BoardController {
	@Resource
	private BoardService bs;
	
	
}
