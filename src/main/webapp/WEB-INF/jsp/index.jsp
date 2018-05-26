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
				<a class="navbar-item <c:if test="${param.timeline ne null}">is-active</c:if>" href="?timeline">最新</a>
				<a class="navbar-item <c:if test="${param.popular ne null}">is-active</c:if>" href="?popular">热门</a>
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
			<a class="button is-primary is-block is-alt is-large" href="#">发布</a>
			<aside class="menu">
				<p class="menu-label">
					标签
				</p>
				<ul class="menu-list">
					<li><span class="tag is-primary is-medium">名人名言</span></li>
					<li><span class="tag is-link is-medium">经典台词</span></li>
					<li><span class="tag is-success is-medium">心灵美文</span></li>
					<li><span class="tag is-warning is-medium">鸡汤有毒</span></li>
					<li><span class="tag is-light is-danger is-medium">鸡汤有屎</span></li>
					<li><span class="tag is-dark is-medium">屎里有毒</span></li>
					<li><span class="tag is-medium">_(:з」∠)_</span></li>
				</ul>
			</aside>
		</div>
	</div>
</section>

<script id="tpl-topic" type="text/html">
{{if list}}
{{each list topic index}}
<article class="post">
	<h4 class="topic-title" title="{{topic.content}}"><a href="${ctx}/topic/{{topic.id}}">{{topic.content}}</a></h4>
	<div class="media">
		<div class="media-left">
			<p class="image is-32x32">
				<img src="http://via.placeholder.com/32x32">
			</p>
		</div>
		<div class="media-content">
			<div class="content">
				<p>
					<a href="#">@{{topic.creator.username}}</a> {{topic.createTime | duration}} &nbsp;
					<span class="tag is-link">经典台词</span>
				</p>
			</div>
		</div>
		<div class="media-right">
			<span class="has-text-grey-light"><i class="fa fa-comments"></i> {{topic.comments.length}}</span>
		</div>
	</div>
</article>
{{/each}}
{{/if}}
</script>
<script id="tpl-pagination" type="text/html">
<a class="pagination-previous" {{if isFirstPage}}title="没有上一页了" disabled{{/if}} data-pagenum="{{prePage}}">上一页</a>
<a class="pagination-next" {{if isLastPage}}title="没有下一页了" disabled{{/if}} data-pagenum="{{nextPage}}">下一页</a>
<ul class="pagination-list">
	{{each navigatepageNums}}
	<li><a class="pagination-link {{if $value==pageNum}}is-current{{/if}}" data-pagenum="{{$value}}">{{$value}}</a></li>
	{{/each}}
</ul>
</script>
<script>
template.defaults.imports.duration = function(value){
	var duration = Math.floor((new Date().getTime() - new Date(value).getTime()) / 1000);
	if(duration < 60) {
		return '刚刚';
	} else if(duration > 30*24*60*60) {
		return '很久以前';
	} else {
		var days = Math.floor(duration/(24*60*60));
		var hours = Math.floor(duration%(24*60*60)/(60*60));
        var minutes = Math.floor(duration%(60*60)/(60));
		return days?days+'天前':hours?hours+'小时前':minutes?minutes+'分钟前':'';
	}
};
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
		url: ctx + '/api/topics/p' + (pageNum || 1)<c:if test="${param.popular ne null}"> + '?order=popular'</c:if>,
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