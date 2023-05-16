package com.ve.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;






import com.ve.mapper.ReFloorMapper;
import com.ve.po.ReFloorModel;

@Service
public class ReFloorService {
	@Resource
	private ReFloorMapper rfm;

	public List<ReFloorModel> showrefloor(int pid) {
		return rfm.refloorlist(pid);
	}
    public int floorreply(ReFloorModel rfmodel){
    	return rfm.reply(rfmodel);
    }
}
