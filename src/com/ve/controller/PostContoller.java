package com.ve.controller;

import java.util.List;

import javax.annotation.Resource;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ve.po.FloorModel;
import com.ve.po.NewPostModel;
import com.ve.po.PostModel;
import com.ve.po.ReFloorModel;
import com.ve.po.PageModel;
import com.ve.service.FloorService;
import com.ve.service.PostService;
import com.ve.service.ReFloorService;

@Controller
public class PostContoller {
	@Resource
	private PostService ps;
	@Resource
	private FloorService fs;
	@Resource
	private ReFloorService rfs;

	@RequestMapping("showposts")
	public ModelAndView getpost(@RequestParam("bid") int bid,
			HttpServletRequest httpServletRequest) {
		ModelAndView mv = new ModelAndView();
		PageModel pagemodel = new PageModel(1, ps.getpostCount(bid));
		List<PostModel> pm = ps.showList(bid, pagemodel.getStartPos(),
				pagemodel.getPageSize());
		HttpSession session = httpServletRequest.getSession();
		session.removeAttribute("bid");
		session.setAttribute("bid", bid);
		mv.addObject("page", pagemodel);
		mv.addObject("posts", pm);
		mv.setViewName("bbspost");
		return mv;
	}

	@RequestMapping("pagenum")
	public ModelAndView pageturning(int pageNow, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		int bid = (int) req.getSession().getAttribute("bid");
		PageModel pagemodel = new PageModel(pageNow, ps.getpostCount(bid));
		List<PostModel> pm = ps.showList(bid, pagemodel.getStartPos(),
				pagemodel.getPageSize());
		mv.addObject("page", pagemodel);
		mv.addObject("posts", pm);
		mv.setViewName("bbspost");
		return mv;
	}

	@RequestMapping("bbsnewpost")
	public String newpost() {
		return "bbsnewpost";
	}

	@PostMapping("createpost")
	public ModelAndView realnewpost(NewPostModel npm) {
		PostModel pmodel = new PostModel();
		pmodel.setPosttype(npm.getPosttype());
		pmodel.setUser_id(npm.getUser_id());
		pmodel.setBoard_id(npm.getBoard_id());
		pmodel.setPosttitle(npm.getPosttitle());
		ps.newpost(pmodel);
		int pid = ps.returnid();
		FloorModel fmodel = new FloorModel();
		fmodel.setFloorcontent(npm.getFloorcontent());
		fmodel.setFloornum(npm.getFloornum());
		fmodel.setPost_id(pid);
		fmodel.setUser_id(npm.getUser_id());
		int flag = fs.postreply(fmodel);
		ModelAndView mv = new ModelAndView();
		if (flag == 1) {
			List<FloorModel> fm = fs.showfloor(pid);
			List<ReFloorModel> rfm = rfs.showrefloor(pid);
			mv.setViewName("bbsfloor");
			mv.addObject("floors", fm);
			mv.addObject("refloors", rfm);

		} else {

			mv.setViewName("error");

		}
		return mv;
	}

}
