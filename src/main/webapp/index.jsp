<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="webjars/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="webjars/bulma/0.7.1/css/bulma.min.css">
		<link rel="stylesheet" href="static/common.css">
		<link rel="stylesheet" href="static/forum.css">
	</head>
	<body>
		<nav class="navbar is-white topNav">
			<div class="container">
				<div class="navbar-brand">
					<a class="navbar-item navbar-text" href="#">
						Bulma Forum
					</a>
					<div class="navbar-burger burger" data-target="topNav">
						<span></span>
						<span></span>
						<span></span>
					</div>
				</div>
				<div id="topNav" class="navbar-menu">
					<div class="navbar-start">
						<a class="navbar-item" href="">首页</a>
					</div>
					<div class="navbar-end">
						<div class="navbar-item">
							<div class="field is-grouped">
								<sec:authorize access="hasRole('ADMIN')">
								<p class="control">
									<a class="button is-small" href="admin">
										<span class="icon">
											<i class="fa fa-server"></i>
										</span>
										<span>
											管理入口
										</span>
									</a>
								</p>
								</sec:authorize>
								<sec:authorize access="hasRole('USER')">
								<p class="control">
									<a class="button is-small" href="logout">
										<span class="icon">
											<i class="fa fa-sign-out"></i>
										</span>
										<span>
											退出
										</span>
									</a>
								</p>
								</sec:authorize>
								<sec:authorize access="!hasRole('USER')">
								<p class="control">
									<a class="button is-small">
										<span class="icon">
											<i class="fa fa-user-plus"></i>
										</span>
										<span>
											注册
										</span>
									</a>
								</p>
								<p class="control">
									<a class="button is-small is-info is-outlined" href="login">
										<span class="icon">
											<i class="fa fa-user"></i>
										</span>
										<span>登录</span>
									</a>
								</p>
								</sec:authorize>
							</div>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<nav class="navbar is-white">
			<div class="container">
				<div class="navbar-menu">
					<div class="navbar-start">
						<a class="navbar-item is-active" href="?timeline">最新</a>
						<a class="navbar-item" href="?popular">热门</a>
					</div>
					<div class="navbar-end">
						<div class="navbar-item">
							<input class="input" type="search" placeholder="搜索">
						</div>
					</div>
				</div>
			</div>
		</nav>
		<section class="container">
			<div class="columns">
				<div class="column is-3">
					<a class="button is-primary is-block is-alt is-large" href="#">发帖</a>
					<aside class="menu">
						<p class="menu-label">
							标签
						</p>
						<ul class="menu-list">
							<li><span class="tag is-primary is-medium ">Dashboard</span></li>
							<li><span class="tag is-link is-medium ">Customers</span></li>
							<li><span class="tag is-light is-danger is-medium ">Authentication</span></li>
							<li><span class="tag is-dark is-medium ">Payments</span></li>
							<li><span class="tag is-success is-medium ">Transfers</span></li>
							<li><span class="tag is-warning is-medium ">Balance</span></li>
							<li><span class="tag is-medium ">Question</span></li>
						</ul>
					</aside>
				</div>
				<div class="column is-9">
					<div class="box content">
						<article class="post">
							<h4>Bulma: How do you center a button in a box?</h4>
							<div class="media">
								<div class="media-left">
									<p class="image is-32x32">
										<img src="http://via.placeholder.com/32x32">
									</p>
								</div>
								<div class="media-content">
									<div class="content">
										<p>
											<a href="#">@jsmith</a> replied 34 minutes ago &nbsp;
											<span class="tag">Question</span>
										</p>
									</div>
								</div>
								<div class="media-right">
									<span class="has-text-grey-light"><i class="fa fa-comments"></i> 1</span>
								</div>
							</div>
						</article>
						<article class="post">
							<h4>How can I make a bulma button go full width?</h4>
							<div class="media">
								<div class="media-left">
									<p class="image is-32x32">
										<img src="http://via.placeholder.com/32x32">
									</p>
								</div>
								<div class="media-content">
									<div class="content">
										<p>
											<a href="#">@red</a> replied 40 minutes ago &nbsp;
											<span class="tag">Question</span>
										</p>
									</div>
								</div>
								<div class="media-right">
									<span class="has-text-grey-light"><i class="fa fa-comments"></i> 0</span>
								</div>
							</div>
						</article>
						<article class="post">
							<h4>TypeError: Data must be a string or a buffer when trying touse vue-bulma-tabs</h4>
							<div class="media">
								<div class="media-left">
									<p class="image is-32x32">
										<img src="http://via.placeholder.com/32x32">
									</p>
								</div>
								<div class="media-content">
									<div class="content">
										<p>
											<a href="#">@jsmith</a> replied 53 minutes ago &nbsp;
											<span class="tag">Question</span>
										</p>
									</div>
								</div>
								<div class="media-right">
									<span class="has-text-grey-light"><i class="fa fa-comments"></i> 13</span>
								</div>
							</div>
						</article>
						<article class="post">
							<h4>How to vertically center elements in Bulma?</h4>
							<div class="media">
								<div class="media-left">
									<p class="image is-32x32">
										<img src="http://via.placeholder.com/32x32">
									</p>
								</div>
								<div class="media-content">
									<div class="content">
										<p>
											<a href="#">@brown</a> replied 3 hours ago &nbsp;
											<span class="tag">Question</span>
										</p>
									</div>
								</div>
								<div class="media-right">
									<span class="has-text-grey-light"><i class="fa fa-comments"></i> 2</span>
								</div>
							</div>
						</article>
						<article class="post">
							<h4>I'm trying to use hamburger menu on bulma css, but it doesn't work. What is wrong?</h4>
							<div class="media">
								<div class="media-left">
									<p class="image is-32x32">
										<img src="http://via.placeholder.com/32x32">
									</p>
								</div>
								<div class="media-content">
									<div class="content">
										<p>
											<a href="#">@hamburgler</a> replied 5 hours ago &nbsp;
											<span class="tag">Question</span>
										</p>
									</div>
								</div>
								<div class="media-right">
									<span class="has-text-grey-light"><i class="fa fa-comments"></i> 2</span>
								</div>
							</div>
						</article>
						<article class="post">
							<h4>How to make tiles wrap with Bulma CSS?</h4>
							<div class="media">
								<div class="media-left">
									<p class="image is-32x32">
										<img src="http://via.placeholder.com/32x32">
									</p>
								</div>
								<div class="media-content">
									<div class="content">
										<p>
											<a href="#">@rapper</a> replied 3 hours ago &nbsp;
											<span class="tag">Question</span>
										</p>
									</div>
								</div>
								<div class="media-right">
									<span class="has-text-grey-light"><i class="fa fa-comments"></i> 2</span>
								</div>
							</div>
						</article>
					</div>
				</div>
			</div>
		</section>
<!-- 		<script src="webjars/jquery/3.3.1/dist/jquery.min.js"></script> -->
		<script src="static/common.js"></script>
	</body>
</html>