<%@ page import="me.huding.luobo.utils.MySessionContext" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<%
	// 获取所有的Cookie
	Cookie[] cookies = request.getCookies();
	String sessionId = null;

	System.out.println("login.jsp: " + session.getId());
	System.out.println(cookies);
	// 查找名为 "JSESSIONID" 的Cookie
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("sessionId")) {
				sessionId = cookie.getValue();
				System.out.println("find session's id in cookie:"+sessionId);
				break;
			}
		}
	}

	// 判断是否存在Session ID，并进行身份验证
	if (sessionId != null) {
		MySessionContext myc= MySessionContext.getInstance();
		HttpSession sess = myc.getSession(sessionId);

		if (sess != null && sess.getAttribute("user") != null) {
			System.out.println("find correct session!");
			Cookie sessionCookie = new Cookie("sessionId", session.getId());
			sessionCookie.setMaxAge(24 * 60 * 60);
			sessionCookie.setHttpOnly(true);
			sessionCookie.setPath("/login");
			response.addCookie(sessionCookie);
			session.setAttribute("user",sess.getAttribute("user"));
			if(!sess.getId().equals(session.getId())){
				sess.invalidate();
			}
			response.sendRedirect("/home");
		}else {
			System.out.println("this session don't login in!");
		}
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<link rel="shortcut icon" type="image/png" href="http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/17/17/542503d8-5e00-4fd8-899a-08d8b6752b85.png">
	<title>我的登录页面</title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/back/static/css/my-login.css">
	<link rel="shortcut icon" type="image/png" href="http://120.133.136.23:8888/uploadImages/113/110/166/3/2023/02/10/17/17/542503d8-5e00-4fd8-899a-08d8b6752b85.png">
	<script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/back/static/js/my-login.js"></script>
</head>

<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img src="${pageContext.request.contextPath}/back/static/img/logo.jpg" alt="logo">
					</div>

					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">登录</h4>
							<form method="POST" id="loginForm" class="my-login-validation" novalidate="">
								<div class="form-group">
									<label for="email">用户名</label>
									<input id="email" type="text" class="form-control" name="email" value="" required autofocus>
									<div class="invalid-feedback">
										请输入用户名
									</div>
								</div>

								<div class="form-group">
									<label for="password">密码</label>
									<input id="password" type="password" class="form-control" name="password" required data-eye>
								    <div class="invalid-feedback">
								    	请输入密码
							    	</div>
								</div>

								<div class="form-group">
									<label for="code">验证码</label>
									<div style="display: flex ">
										<input id="code" type="text" class="form-control" name="code" required autofocus style="width: 55%">
										<img id="verity-code" src="/captcha" width="130px" height="48px" />
									</div>
									<div class="invalid-feedback" id="warning1">
										请输入验证码
									</div>
								</div>


								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block">
										Login
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; 2023
					</div>
				</div>
			</div>
		</div>
	</section>


</body>
</html>
