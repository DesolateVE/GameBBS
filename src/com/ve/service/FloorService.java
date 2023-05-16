package com.ve.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;




import com.ve.mapper.FloorMapper;
import com.ve.po.FloorModel;

@Service
public class FloorService {
	@Resource
	private FloorMapper fm;
	
public List<FloorModel> showfloor(int pid){
	return fm.floorlist(pid);
}
public int postreply(FloorModel fmodel){
	return fm.postreply(fmodel);
}
}
