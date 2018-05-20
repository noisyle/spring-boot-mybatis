<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<link rel="stylesheet" href="static/login.css">
	</head>
	<body>
		<section class="hero is-success is-fullheight">
			<div class="hero-body">
				<div class="container has-text-centered">
					<div class="column is-4 is-offset-4">
						<h3 class="title has-text-grey">登录</h3>
						<p class="subtitle has-text-grey">Please login to proceed.</p>
						<div class="box">
							<figure class="avatar">
								<img src="https://placehold.it/128x128">
							</figure>
							<form action="login" method="post">
								<div class="field">
									<div class="control">
										<input class="input is-large" name="username" placeholder="用户名" autofocus="">
									</div>
								</div>
								<div class="field">
									<div class="control">
										<input class="input is-large" name="password" placeholder="密码">
									</div>
								</div>
								<c:if test="${param.error ne null}">
								<div class="field has-text-danger has-text-left">
								用户名或密码错误
								</div>
								</c:if>
								<div class="field has-text-left">
									<label class="checkbox">
										<input type="checkbox"> 自动登录
									</label>
								</div>
								<button class="button is-block is-info is-large is-fullwidth">登录</button>
							</form>
						</div>
						<p class="has-text-grey">
							<a href="#">注册</a> &nbsp;·&nbsp; <a href="#">忘记密码</a>
						</p>
					</div>
				</div>
			</div>
		</section>
	</body>
</html>