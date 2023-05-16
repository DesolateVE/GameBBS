package com.ve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ve.po.BoardModel;
import com.ve.po.PostModel;
import com.ve.po.UserModel;
import com.ve.service.AccountService;
import com.ve.service.BoardService;
import com.ve.service.PostService;
import com.ve.utils.RandomValidateCode;

@Controller
public class RequestController {

	@Resource
	private BoardService bs;
	@Resource
	private AccountService as;
	@Resource
	private PostService ps;

	@RequestMapping("bbshome")
	public String bbshomeweb() {
		return "bbshome";
	}

	@RequestMapping("message")
	public String messageweb() {
		return "message";
	}

	@RequestMapping("/")
	public String welcomeweb() {
		return "bbshome";
	}

	@RequestMapping("bbsboard")
	public ModelAndView bbsboard() {
		ModelAndView mv = new ModelAndView();
		List<BoardModel> bm = bs.showboard();
		mv.setViewName("bbsboard");
		mv.addObject("boards", bm);
		return mv;
	}

	@RequestMapping("bbssearch")
	public String bbssearchweb() {
		return "bbssearch";
	}

	@RequestMapping("getVerify")
	public void getVerify(HttpServletRequest request,
			HttpServletResponse response) {
		response.setContentType("image/jpeg");// 设置相应类型,告诉浏览器输出的内容为图片
		response.setHeader("Pragma", "No-cache");// 设置响应头信息，告诉浏览器不要缓存此内容
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expire", 0);
		response.setCharacterEncoding("utf-8");
		RandomValidateCode randomValidateCode = new RandomValidateCode();
		try {
			randomValidateCode.getRandcode(request, response);// 输出验证码图片方法
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@PostMapping("Checkcode")
	public void Checkcode(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		// 图片路径
		String tip = "framework/images/img_html/error-icon.png";
		/* 重构逻辑 */

		String checkcode = req.getParameter("checkcode");
		// 测试
		// System.out.println(checkcode);
		// 获取session域中的数字
		String checkcodeService = (String) req.getSession().getAttribute(
				"randomcore");
		// 判断
		if (checkcode.equals(checkcodeService)) {
			tip = "framework/images/img_html/true-icon.png";

		}
		// 输出路径
		PrintWriter pw = resp.getWriter();
		pw.write(tip);
		pw.flush();
		pw.close();

	}

	@PostMapping("checkemail")
	@ResponseBody
	public String checkemail(String checkemail) {
		UserModel u = as.checkemail(checkemail);
		if (u != null) {
			return "existed";
		} else {
			return "pass";
		}
	}

	@PostMapping("searching")
	@ResponseBody
	public void returnseachinfo(String search, String searchstyle,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		List<UserModel> userdata = as.usersearch('%' + search + '%');
		List<PostModel> postdata = ps.searchpost('%' + search + '%');
		HttpSession session = request.getSession();
		session.removeAttribute("searchuserinfo");
		session.removeAttribute("searchpostinfo");
		switch (searchstyle) {
		case "AIsearch":
			/*
			 * response.setCharacterEncoding("utf-8");
			 * response.getWriter().print(JSON.toJSON(userdata));
			 * response.getWriter().print(JSON.toJSON(postdata));
			 */
			session.setAttribute("searchuserinfo", userdata);
			session.setAttribute("searchpostinfo", postdata);
			break;
		case "usersearch":
			/*
			 * response.setCharacterEncoding("utf-8");
			 * response.getWriter().print(JSON.toJSON(userdata)); break;
			 */
			session.setAttribute("searchuserinfo", userdata);
			break;
		case "postsearch":
			/*
			 * response.setCharacterEncoding("utf-8");
			 * response.getWriter().print(JSON.toJSON(postdata)); break;
			 */
			session.setAttribute("searchpostinfo", postdata);
			break;
		default:
			break;
		}
	}
}
