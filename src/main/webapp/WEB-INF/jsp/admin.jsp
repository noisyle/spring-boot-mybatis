<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/WEB-INF/jsp/common/head.jsp" />
		<link rel="stylesheet" href="${ctx}/static/admin.css">
	</head>
	<body>
		<nav class="navbar is-white">
			<div class="container">
				<div class="navbar-brand">
					<a class="navbar-item brand-text" href="#"> Bulma Admin </a>
					<div class="navbar-burger burger" data-target="navMenu">
						<span></span> <span></span> <span></span>
					</div>
				</div>
				<div id="navMenu" class="navbar-menu">
					<div class="navbar-start">
						<a class="navbar-item" href="../"> 返回论坛 </a>
					</div>
	
				</div>
			</div>
		</nav>
	    <div class="container">
	        <div class="columns">
	            <div class="column is-3">
	                <aside class="menu">
	                    <p class="menu-label">
	                        General
	                    </p>
	                    <ul class="menu-list">
	                        <li><a class="is-active">Dashboard</a></li>
	                        <li><a>Customers</a></li>
	                    </ul>
	                    <p class="menu-label">
	                        Administration
	                    </p>
	                    <ul class="menu-list">
	                        <li><a>Team Settings</a></li>
	                        <li>
	                            <a>Manage Your Team</a>
	                            <ul>
	                                <li><a>Members</a></li>
	                                <li><a>Plugins</a></li>
	                                <li><a>Add a member</a></li>
	                            </ul>
	                        </li>
	                        <li><a>Invitations</a></li>
	                        <li><a>Cloud Storage Environment Settings</a></li>
	                        <li><a>Authentication</a></li>
	                    </ul>
	                    <p class="menu-label">
	                        Transactions
	                    </p>
	                    <ul class="menu-list">
	                        <li><a>Payments</a></li>
	                        <li><a>Transfers</a></li>
	                        <li><a>Balance</a></li>
	                    </ul>
	                </aside>
	            </div>
	            <div class="column is-9">
	                <nav class="breadcrumb" aria-label="breadcrumbs">
	                    <ul>
	                        <li><a href="#">Admin</a></li>
	                        <li class="is-active"><a href="#" aria-current="page">Dashboard</a></li>
	                    </ul>
	                </nav>
	                <section class="hero is-info welcome is-small">
	                    <div class="hero-body">
	                        <div class="container">
	                            <h1 class="title">
	                                Hello, Admin.
	                            </h1>
	                            <h2 class="subtitle">
	                                I hope you are having a great day!
	                            </h2>
	                        </div>
	                    </div>
	                </section>
	                <section class="info-tiles">
	                    <div class="tile is-ancestor has-text-centered">
	                        <div class="tile is-parent">
	                            <article class="tile is-child box">
	                                <p class="title">439k</p>
	                                <p class="subtitle">Users</p>
	                            </article>
	                        </div>
	                        <div class="tile is-parent">
	                            <article class="tile is-child box">
	                                <p class="title">59k</p>
	                                <p class="subtitle">Products</p>
	                            </article>
	                        </div>
	                        <div class="tile is-parent">
	                            <article class="tile is-child box">
	                                <p class="title">3.4k</p>
	                                <p class="subtitle">Open Orders</p>
	                            </article>
	                        </div>
	                        <div class="tile is-parent">
	                            <article class="tile is-child box">
	                                <p class="title">19</p>
	                                <p class="subtitle">Exceptions</p>
	                            </article>
	                        </div>
	                    </div>
	                </section>
	                <div class="columns">
	                    <div class="column is-6">
	                        <div class="card events-card">
	                            <header class="card-header">
	                                <p class="card-header-title">
	                                    Events
	                                </p>
	                                <a href="#" class="card-header-icon" aria-label="more options">
	                  <span class="icon">
	                    <i class="fa fa-angle-down" aria-hidden="true"></i>
	                  </span>
	                </a>
	                            </header>
	                            <div class="card-table">
	                                <div class="content">
	                                    <table class="table is-fullwidth is-striped">
	                                        <tbody>
	                                            <tr>
	                                                <td width="5%"><i class="fa fa-bell-o"></i></td>
	                                                <td>Lorum ipsum dolem aire</td>
	                                                <td><a class="button is-small is-primary" href="#">Action</a></td>
	                                            </tr>
	                                            <tr>
	                                                <td width="5%"><i class="fa fa-bell-o"></i></td>
	                                                <td>Lorum ipsum dolem aire</td>
	                                                <td><a class="button is-small is-primary" href="#">Action</a></td>
	                                            </tr>
	                                            <tr>
	                                                <td width="5%"><i class="fa fa-bell-o"></i></td>
	                                                <td>Lorum ipsum dolem aire</td>
	                                                <td><a class="button is-small is-primary" href="#">Action</a></td>
	                                            </tr>
	                                            <tr>
	                                                <td width="5%"><i class="fa fa-bell-o"></i></td>
	                                                <td>Lorum ipsum dolem aire</td>
	                                                <td><a class="button is-small is-primary" href="#">Action</a></td>
	                                            </tr>
	                                            <tr>
	                                                <td width="5%"><i class="fa fa-bell-o"></i></td>
	                                                <td>Lorum ipsum dolem aire</td>
	                                                <td><a class="button is-small is-primary" href="#">Action</a></td>
	                                            </tr>
	                                            <tr>
	                                                <td width="5%"><i class="fa fa-bell-o"></i></td>
	                                                <td>Lorum ipsum dolem aire</td>
	                                                <td><a class="button is-small is-primary" href="#">Action</a></td>
	                                            </tr>
	                                            <tr>
	                                                <td width="5%"><i class="fa fa-bell-o"></i></td>
	                                                <td>Lorum ipsum dolem aire</td>
	                                                <td><a class="button is-small is-primary" href="#">Action</a></td>
	                                            </tr>
	                                            <tr>
	                                                <td width="5%"><i class="fa fa-bell-o"></i></td>
	                                                <td>Lorum ipsum dolem aire</td>
	                                                <td><a class="button is-small is-primary" href="#">Action</a></td>
	                                            </tr>
	                                            <tr>
	                                                <td width="5%"><i class="fa fa-bell-o"></i></td>
	                                                <td>Lorum ipsum dolem aire</td>
	                                                <td><a class="button is-small is-primary" href="#">Action</a></td>
	                                            </tr>
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                            <footer class="card-footer">
	                                <a href="#" class="card-footer-item">View All</a>
	                            </footer>
	                        </div>
	                    </div>
	                    <div class="column is-6">
	                        <div class="card">
	                            <header class="card-header">
	                                <p class="card-header-title">
	                                    Inventory Search
	                                </p>
	                                <a href="#" class="card-header-icon" aria-label="more options">
	                  <span class="icon">
	                    <i class="fa fa-angle-down" aria-hidden="true"></i>
	                  </span>
	                </a>
	                            </header>
	                            <div class="card-content">
	                                <div class="content">
	                                    <div class="control has-icons-left has-icons-right">
	                                        <input class="input is-large" type="text" placeholder="">
	                                        <span class="icon is-medium is-left">
	                      <i class="fa fa-search"></i>
	                    </span>
	                                        <span class="icon is-medium is-right">
	                      <i class="fa fa-check"></i>
	                    </span>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="card">
	                            <header class="card-header">
	                                <p class="card-header-title">
	                                    User Search
	                                </p>
	                                <a href="#" class="card-header-icon" aria-label="more options">
	                  <span class="icon">
	                    <i class="fa fa-angle-down" aria-hidden="true"></i>
	                  </span>
	                </a>
	                            </header>
	                            <div class="card-content">
	                                <div class="content">
	                                    <div class="control has-icons-left has-icons-right">
	                                        <input class="input is-large" type="text" placeholder="">
	                                        <span class="icon is-medium is-left">
	                      <i class="fa fa-search"></i>
	                    </span>
	                                        <span class="icon is-medium is-right">
	                      <i class="fa fa-check"></i>
	                    </span>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</body>
</html>