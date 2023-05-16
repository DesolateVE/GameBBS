package com.ve.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ve.po.FloorModel;
import com.ve.po.ReFloorModel;
import com.ve.service.FloorService;
import com.ve.service.ReFloorService;

@Controller
public class FloorController {
	@Resource
	private FloorService fs;
	@Resource
	private ReFloorService rfs;

	@RequestMapping("showfloors")
	public ModelAndView getfloor(int pid) {
		ModelAndView mv = new ModelAndView();
		List<FloorModel> fm = fs.showfloor(pid);
		List<ReFloorModel> rfm = rfs.showrefloor(pid);

		mv.addObject("floors", fm);
		mv.addObject("refloors", rfm);
		mv.setViewName("bbsfloor");
		return mv;
	}

	@PostMapping("floorreply")
	public String floorreply(ReFloorModel rfmodel) {
		int flag = rfs.floorreply(rfmodel);
		if (flag == 1) {

			return "bbsfloor";
		} else {
			return "error";
		}
	}

	@PostMapping("postreply")
	public String postreply(FloorModel fmodel) {
		int flag = fs.postreply(fmodel);
		if (flag == 1) {
			return "bbsfloor";
		} else {
			return "error";
		}
	}
}
