<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link rel="stylesheet" href="${ctx}/static/forum.css">
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
							<a class="button is-small" href="${ctx}/admin">
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
		<div class="column is-9">
			<div class="box content"></div>
			<nav class="pagination is-centered" role="navigation" aria-label="pagination"></nav>
		</div>
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
	</div>
</section>

<script id="tpl-topic" type="text/html">
{{if list}}
{{each list}}
<article class="post">
	<h4>{{$value.content}}</h4>
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
{{/each}}
{{/if}}
</script>
<script id="tpl-pagination" type="text/html">
<a class="pagination-previous" {{if isFirstPage}}title="到第一页了" disabled{{/if}} data-pagenum="{{prePage}}">上一页</a>
<a class="pagination-next" {{if isLastPage}}title="到最后一页了" disabled{{/if}} data-pagenum="{{nextPage}}">下一页</a>
<ul class="pagination-list">
	{{each navigatepageNums}}
	<li><a class="pagination-link {{if $value==pageNum}}is-current{{/if}}" data-pagenum="{{$value}}">{{$value}}</a></li>
	{{/each}}
</ul>
</script>
<script>
$(function(){
	loadPage();
	$('.pagination').on('click', 'a', function(e){
		var target = e.target;
		if(!$(target).hasClass('is-current')) {
			loadPage($(target).data('pagenum'));
		}
	});
});
function loadPage(pageNum){
	$.ajax({
		url: ctx + '/api/topics/p' + (pageNum || 1),
		method: 'get',
		type: 'json',
		success: function(res){
            $('.box.content').html(template('tpl-topic', res));
            $('.pagination').html(template('tpl-pagination', res));
		}
	});
}
</script>
</body>
</html>