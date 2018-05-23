<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="/jsp/common/head.jsp"></jsp:include>
	</head>
	<body>
	    <div class="topic"></div>
	    <ol class="comments"></ol>
	    <textarea id="comment"></textarea>
	    <button id="btnSave">保存</button>
    
    
		<script>
		$(function(){
			$.ajax({
				url: ctx + '/api/topic/${id}',
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
	                url: ctx + '/api/topic/${id}/comment',
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