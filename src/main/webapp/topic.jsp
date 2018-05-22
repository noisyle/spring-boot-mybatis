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
		<link rel="stylesheet" href="/webjars/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="/webjars/bulma/0.7.1/css/bulma.min.css">
		<link rel="stylesheet" href="/static/common.css">
	</head>
	<body>
    <div class="topic"></div>
    <ol class="comments"></ol>
    <textarea id="comment"></textarea>
    <button id="btnSave">保存</button>
    
    
		<script src="/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
		<script>
		$(function(){
			$.ajax({
				url: '/api/topic/${id}',
				method: 'get',
				type: "json",
				success: function(data){
		            $(".topic").text(data.content);
		            data.comments.forEach(function(row, index){
		            	$(".comments").append("<li>"+row.content+"</li>");
		            });
				}
			});
			
			$("#btnSave").click(function() {
	            $.ajax({
	                url: '/api/topic/${id}/comment',
	                method: 'post',
	                data: {content: $("#comment").val()},
	                type: "json",
	                success: function(data){
	                    $(".comments").append("<li>"+data.content+"</li>");
	                    $("#comment").val("")
	                }
	            });
			});
		});
		</script>
	</body>
</html>