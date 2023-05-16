<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var='user' value="${sessionScope.loginUser}" />
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'bbshome.jsp' starting page</title>

<link href="framework/css/bbshome.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="framework/css/bootstrap.css">
<link rel="stylesheet" href="framework/layui/css/layui.css" media="all">
</head>

<body>
	<div class="bbscontainer">
		<div class="bbshead">
			<div class="bbstitile">
				<h1>
					<font color="#20B2AA"> <strong>游戏论坛</strong>
					</font>
				</h1>
			</div>
			<div class="bbsuser">
				<font face="微软雅黑" size="4"> 当前登录状态： <a> <c:choose>
							<c:when test="${user.power==2}">
      普通会员
    </c:when>
							<c:when test="${user.power==1}">
       高级会员
    </c:when>
							<c:when test="${user.power==0}">
      管理员
    </c:when>
							<c:otherwise>
        游客
    </c:otherwise>
						</c:choose>
				</a> &nbsp;|&nbsp;<c:choose>
						<c:when test="${user.uid==null}">
							<a data-toggle="modal" href="#login">登录</a>
					&nbsp;或&nbsp; <a data-toggle="modal" href="#register">注册</a>
						</c:when>
						<c:otherwise>
							<img src="framework/images/img_user/${user.headphoto}"
								class="layui-nav-img">&nbsp;<a class="text-primary"
								href="bbsuser">${user.username}</a>
						 &nbsp;|&nbsp; 当前等级： <a>${user.experience}</a> &nbsp;|&nbsp; <a
								href="userout">登出</a>
						</c:otherwise>
					</c:choose>
				</font>
			</div>
		</div>

		<div class="bbsbody">
			<div class="bbsnotice">
				<div class="row">
					<div class="col-md-4">

						<div id="pic" class="carousel slide" data-ride="carousel">

							<!-- 指示符 -->
							<ul class="carousel-indicators">
								<li data-target="#pic" data-slide-to="0" class="active"></li>
								<li data-target="#pic" data-slide-to="1"></li>
								<li data-target="#pic" data-slide-to="2"></li>
							</ul>

							<!-- 轮播图片 -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="framework/images/img_html/pic1.png">
									<div class="carousel-caption">
										<h3>系兄弟就来砍我</h3>
										<p></p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="framework/images/img_html/pic2.jpg">
									<div class="carousel-caption">
										<h3></h3>
										<p></p>
									</div>
								</div>
								<div class="carousel-item">
									<img src="framework/images/img_html/pic3.jpg">
									<div class="carousel-caption">
										<h3></h3>
										<p></p>
									</div>
								</div>
							</div>

							<!-- 左右切换按钮 -->
							<a class="carousel-control-prev" href="#pic" data-slide="prev">
								<span class="carousel-control-prev-icon"></span>
							</a> <a class="carousel-control-next" href="#pic" data-slide="next">
								<span class="carousel-control-next-icon"></span>
							</a>

						</div>

					</div>
					<div class="col-md-8">
						<iframe src="message" id="iframe_mesage" width="100%"
							height="300px" scrolling="no"></iframe>
					</div>
				</div>
			</div>
			<div class="bbssearch">

				<input placeholder="在这里写下你要找的东西" type="text" class="form-control"
					style="width: 16%;float: left;" id="search-id"
					onkeyup="runsearch()"> <select
					style="float: left;width: 9%;" class="form-control"
					id="searchstyle">
					<option value="AIsearch">智能搜索</option>
					<option value="usersearch">用户</option>
					<option value="postsearch">帖子</option>
				</select>
				<button type="button" class="btn btn-primary" onclick="runsearch()">
					<strong> Search&nbsp;&nbsp;|&nbsp;&nbsp; <span
						class="layui-icon layui-icon-search"></span>
					</strong>
				</button>

			</div>
			<div class="bbspost">
				<iframe src="bbsboard" id="iframe_bbspost" width="100%" height="80%"
					scrolling="auto"></iframe>
			</div>
		</div>

	</div>
	<div class="bbsfoot">
		<br />
		<footer> <strong>网站建设于：2018-10-11&nbsp;|&nbsp;仅供学习参考请勿用于商业用途</strong>
		<br />
		<strong>By：VE</strong> </footer>
	</div>

	<div class="modal fade" id="login" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">用户登录</h4>
				</div>
				<div class="modal-body">

					<form action="login" method="post" class="form-horizontal"
						id="loginForm" role="form">
						<div class="form-group">
							<label class="col-sm-2 control-label">账户</label>
							<div class="col-sm-10">
								<input type="email" name="email" id="user" class="form-control"
									placeholder="请输入邮箱">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" name="password" id="pswd"
									class="form-control" placeholder="请输入密码">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">验证</label>
							<div class="col-sm-10">
								<input type="text" id="checkcodeID" class="form-control-sm"
									placeholder="请正确填写验证码"> <img src="getVerify"
									id="CreateCheckCode" class="img-thumbnail"> <a id="show"></a>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox" id="remember">
										记住密码
									</label>
								</div>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消
					</button>
					<button id="buttonoflogin" type="submit" disabled
						class="btn btn-primary">登录</button>
				</div>
				</form>
			</div>

		</div>

	</div>

	<div class="modal fade" id="register" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">快速注册</h4>
				</div>
				<div class="modal-body">

					<form id="registerForm" action="register" method="post"
						class="form-horizontal" role="form">
						<div class="form-group">
							<label for="firstname" class="col-sm-2 control-label">
								用户名</label>
							<div class="col-sm-10">
								<input type="text" id="usernameofregister" name="username"
									class="form-control" placeholder="请输入昵称">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input id="checkemail" type="email" name="email"
									class="form-control" placeholder="请输入邮箱，这将会是你登录的唯一凭证">
								<a id="warn"></a>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" id="pswofregister" name="password"
									class="form-control" placeholder="请输入密码">
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">取消
					</button>
					<button type="submit" id="buttonofregister" disabled
						class="btn btn-primary">注册</button>
				</div>
				</form>
			</div>

		</div>

	</div>

	<script src="framework/js/jquery-3.3.1.js"></script>
	<script src="framework/js/bootstrap.js"></script>
	<!-- 验证图片切换 -->
	<script type="text/javascript">
		var imgkey = document.getElementById('CreateCheckCode');
		$(imgkey).click(function() {
			imgkey.src = "getVerify?" + Math.random();
		});
	</script>
	<!-- ajax部署 -->
	<script type="text/javascript">
		//创建ajax对象
		function createAjax() {
			var ajax = null;
			try {
				ajax = new ActiveXObject("microsoft.xmlhttp");
			} catch (e) {
				try {
					ajax = new XMLHttpRequest();
				} catch (e1) {
					alert("请更换浏览器");
				}
			}
			return ajax;
		}
	</script>

	<script type="text/javascript">
		//去除空格
		function trim(str) {
			//从左侧开始替换空格
			str = str.replace(/^\s*/, "");
			//从左侧开始替换空格
			str = str.replace(/\s$/, "");
			return str;
		}
	</script>


	<script type="text/javascript">
		var User = document.getElementById('user').value;
		var Pswd = document.getElementById('pswd').value;
		var a = document.getElementById("show");

		document.getElementById("checkcodeID").onkeyup = function() {
			var checkcode = this.value;
			//去除空格
			checkcode = trim(checkcode.toUpperCase());
			if (checkcode.length == 4) {
				//获取ajax对象
				var ajax = createAjax();
				//获取去空格的内容

				var method = "POST";
				var url = "${pageContext.request.contextPath}/Checkcode?time="
						+ new Date().getTime();
				//准备发送异步请求
				ajax.open(method, url);
				//设置请求头POST提交方式才需要
				ajax.setRequestHeader("content-type",
						"application/x-www-form-urlencoded");
				//拼接实体内容
				var content = "checkcode=" + checkcode;
				//发送请求
				ajax.send(content);

				//监听服务器状态变化
				ajax.onreadystatechange = function() {
					if (ajax.readyState == 4) {
						if (ajax.status == 200) {
							//获取服务器内容
							var tip = ajax.responseText;
							//获取图片路径 然后进行放入标签中
							//获取登录按钮根据验证码正确与否禁用还是启用
							var img = document.createElement("img");
							img.src = tip;
							img.style.width = "14px";
							img.style.height = "14px";

							a.innerHTML = ""; /* 标签加入文本内容 */
							a.appendChild(img); /* 标签添加新的元素 */
							if (tip == "framework/images/img_html/error-icon.png") {
								document.getElementById("buttonoflogin").disabled = true;
							} else {
								document.getElementById("buttonoflogin").disabled = false;
							}
						}
					}
				};

			}

		};
	</script>

	<script type="text/javascript">
		var warn = document.getElementById("warn");
		var username = document.getElementById("usernameofregister").value;
		var password = document.getElementById("pswofregister").value;
		var register = document.getElementById("registerForm");
		var registerflag = "false";
		document.getElementById("checkemail").onchange = function() {
			var checkemail = this.value;
			checkemail = trim(checkemail);
			if (checkemail.indexOf("@") != -1) {
				$
						.ajax({
							url : "checkemail",
							type : "post",
							async : true,
							datetype : "text",
							contentType : "application/x-www-form-urlencoded",
							data : "checkemail=" + checkemail,
							success : function(data) {
								console.log('传值成功');
								if (data == "pass") {
									warn.style.color = "green";
									warn.innerHTML = "该邮箱可以使用";
									registerflag = "true";
								} else {
									warn.style.color = "red";
									warn.innerHTML = "该邮箱已被注册";
									registerflag = "false";
									document.getElementById("buttonofregister").disabled = true;
								}

							},
							error : function(data) {
								console.log('传值发生错误');
								console.log(data);
							}
						});
			}

		};
		register.onkeyup = function() {
			if (username != null && password != null && registerflag == "true") {
				document.getElementById("buttonofregister").disabled = false;
			} else {
				document.getElementById("buttonofregister").disabled = true;
			}
		};
	</script>

	<script type="text/javascript">
		window.onload = function() {
			var oForm = document.getElementById('loginForm');
			var oUser = document.getElementById('user');
			var oPswd = document.getElementById('pswd');
			var oRemember = document.getElementById('remember');
			//页面初始化时，如果帐号密码cookie存在则填充
			if (getCookie('user') && getCookie('pswd')) {
				oUser.value = getCookie('user');
				oPswd.value = getCookie('pswd');
				oRemember.checked = true;
			}
			//复选框勾选状态发生改变时，如果未勾选则清除cookie
			oRemember.onchange = function() {
				if (!this.checked) {
					delCookie('user');
					delCookie('pswd');
				}
			};
			//表单提交事件触发时，如果复选框是勾选状态则保存cookie
			oForm.onsubmit = function() {
				if (remember.checked) {
					setCookie('user', oUser.value, 7); //保存帐号到cookie，有效期7天
					setCookie('pswd', oPswd.value, 7); //保存密码到cookie，有效期7天
				}
			};
		};
		//设置cookie
		function setCookie(name, value, day) {
			var date = new Date();
			date.setDate(date.getDate() + day);
			document.cookie = name + '=' + value + ';expires=' + date;
		};
		//获取cookie
		function getCookie(name) {
			var reg = RegExp(name + '=([^;]+)');
			var arr = document.cookie.match(reg);
			if (arr) {
				return arr[1];
			} else {
				return '';
			}
		};
		//删除cookie
		function delCookie(name) {
			setCookie(name, null, -1);
		};
	</script>

	<script type="text/javascript">
		function runsearch() {
			var search = $("#search-id").val();
			var searchstyle = $("#searchstyle").val();
			var searchiframe = document.getElementById("iframe_bbspost");
			search = trim(search);
			searchstyle = trim(searchstyle);
			$.ajax({
				url : "searching",
				type : "post",
				async : true,
				datetype : "text",
				contentType : "application/x-www-form-urlencoded",
				data : {
					"search" : search,
					"searchstyle" : searchstyle
				},
				success : function() {
					console.log('传值成功');
					searchiframe.src = "bbssearch";
				},
				error : function(data) {
					console.log('传值发生错误');
					console.log(data);
				}
			});
		}
	</script>

</body>
</html>
