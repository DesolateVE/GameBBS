package com.ve.service;

import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.ve.mapper.BoardMapper;
import com.ve.po.BoardModel;

@Service
public class BoardService {
	@Resource
	private BoardMapper bM;

	public List<BoardModel> showboard() {
		return bM.boardlist();
	}
}
