<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/jsp/common/head.jsp" %>
<link rel="stylesheet" href="${ctx}/webjars/toastr/build/toastr.min.css">
<link rel="stylesheet" href="${ctx}/static/forum.css">
</head>
<body>
<nav class="navbar is-white topNav">
	<div class="container">
		<div class="navbar-brand">
			<a class="navbar-item navbar-text" href="#">
				Crowbar
			</a>
			<div class="navbar-burger burger" data-target="topNav">
				<span></span>
				<span></span>
				<span></span>
			</div>
		</div>
		<div id="topNav" class="navbar-menu">
			<div class="navbar-start">
				<a class="navbar-item" href="${ctx}/">首页</a>
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
							<a class="button is-small" href="${ctx}/logout">
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
							<a class="button is-small is-info is-outlined" href="${ctx}/login">
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
				<a class="navbar-item ${param.order eq null ? "is-active" : ""}" href="${ctx}/">最新</a>
				<a class="navbar-item ${param.order eq "popular" ? "is-active" : ""}" href="${ctx}/?order=popular">热门</a>
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
		<div class="column is-9 articles">
		</div>
		<div class="column is-3">
            <sec:authorize access="hasRole('ADMIN')">
			<div class="buttons has-addons">
                <a class="button" href="#" id="btnExport">
                    <span class="icon is-small">
                        <i class="fa fa-download"></i>
                    </span>
                    <span>导出</span>
                </a>
                <a class="button" href="#" id="btnImportModal">
                    <span class="icon is-small">
                        <i class="fa fa-upload"></i>
                    </span>
                    <span>导入</span>
                </a>
			</div>
            </sec:authorize>
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
<div class="modal" id="modalImport">
    <div class="modal-background"></div>
    <div class="modal-card">
    <form action="${ctx}/api/topics/import" method="post" enctype="multipart/form-data">
        <header class="modal-card-head">
            <p class="modal-card-title">导入</p>
            <button class="delete" aria-label="close"></button>
        </header>
        <section class="modal-card-body">
                <div class="field">
                    <div class="control">
                        <input class="input" type="file" name="file">
                    </div>
                </div>
        </section>
        <footer class="modal-card-foot">
            <button class="button is-success" id="btnImport">确定</button>
            <button class="button cancel">取消</button>
        </footer>
    </form>
    </div>
</div>

<script id="tpl-topic" type="text/html">
{{extend 'tpl-pagination'}}
{{block 'content'}}
<div class="box content">
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
			<span class="has-text-grey-light"><i class="fa fa-comments"></i> {{topic.commentCount}}</span>
		</div>
	</div>
</article>
{{/each}}
{{/if}}
</div>
{{/block}}
</script>
<script id="tpl-pagination" type="text/html">
{{block 'content'}}{{/block}}
<nav class="pagination is-centered" role="navigation" aria-label="pagination">
<a class="pagination-previous" {{if isFirstPage}}title="没有上一页了" disabled{{/if}} data-pagenum="{{prePage}}">上一页</a>
<a class="pagination-next" {{if isLastPage}}title="没有下一页了" disabled{{/if}} data-pagenum="{{nextPage}}">下一页</a>
<ul class="pagination-list">
	{{each navigatepageNums}}
	<li><a class="pagination-link {{if $value==pageNum}}is-current{{/if}}" data-pagenum="{{$value}}">{{$value}}</a></li>
	{{/each}}
</ul>
</nav>
</script>
<script src="${ctx}/webjars/sockjs-client/dist/sockjs.min.js"></script>
<script src="${ctx}/webjars/stomp-websocket/lib/stomp.min.js"></script>
<script src="${ctx}/webjars/toastr/build/toastr.min.js"></script>
<script>
(function($){

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
	function loadPage(pageNum){
		$.ajax({
			url: ctx + '/api/topics/p' + (pageNum || 1) + '?order=${param.order}',
			method: 'get',
			type: 'json',
			success: function(res){
	            $('.articles').html(template('tpl-topic', res));
			}
		});
	}
	$(function(){
		loadPage();
		$('.articles').on('click', '.pagination a', function(e){
			var target = e.target;
			if(!$(target).hasClass('is-current')) {
				loadPage($(target).data('pagenum'));
			}
		});
		$('#btnExport').on('click', function(e){
			window.open(ctx + '/api/topics/export');
			return false;
		});
		$('#btnImportModal').on('click', function(e){
			$('#modalImport').addClass('is-active');
			return false;
		});
		$('.modal-background, .modal-card-head>.delete, .modal-card-foot>.button.cancel').on('click', function(e){
			$(e.target).closest('.modal').removeClass('is-active');
			return false;
		});
		
		if('${message}'!=='') {
			showGreeting('${message}');
		}
	});
	
	
	
	var stompClient = null;
	function connect(callback) {
	    var socket = new SockJS(ctx + '/websocket');
	    stompClient = Stomp.over(socket);
	    stompClient.connect({}, callback);
	}

	function disconnect() {
	    if (stompClient !== null) {
	        stompClient.disconnect();
	    }
	    console.log("Disconnected");
	}

	function sendName() {
		<sec:authorize access="hasRole('USER')">
	    stompClient.send("/app/login", {}, JSON.stringify({'username': '<sec:authentication property="name" />'}));
	    </sec:authorize>
		<sec:authorize access="!hasRole('USER')">
	    stompClient.send("/app/login", {}, JSON.stringify({'username': '游客'}));
	    </sec:authorize>
	}

	toastr.options.positionClass = 'toast-bottom-right';
	toastr.options.newestOnTop = true;
	function showGreeting(message) {
	    toastr.info(message)
	}

	$(function () {
		connect(function (frame) {
	        console.log('Connected: ' + frame);
	        stompClient.subscribe('/message/greetings', function (greeting) {
	            showGreeting(JSON.parse(greeting.body).content);
	        });
	        sendName();
	    });
	});
})(jQuery);
</script>
</body>
</html>