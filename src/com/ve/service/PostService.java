package com.ve.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ve.mapper.PostMapper;

import com.ve.po.PostModel;

@Service
public class PostService {
	@Resource
	private PostMapper pm;

	public List<PostModel> showList(int bid, int startPos, int pageSize) {
		return pm.postlist(bid, startPos, pageSize);
	}

	public int newpost(PostModel pmodel) {
		return pm.newpost(pmodel);
	}

	public int returnid() {
		return pm.returnid();
	}

	public int getpostCount(int bid) {
		return pm.getpostCount(bid);
	}
	
	public List<PostModel> searchpost(String search){
		return pm.searchpost(search);
	}
}
