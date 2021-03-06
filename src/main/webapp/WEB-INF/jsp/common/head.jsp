<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Spring Boot Mybatis Demo</title>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script>
var ctx = '${ctx}';
</script>
<link rel="stylesheet" href="${ctx}/webjars/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${ctx}/webjars/bulma/css/bulma.min.css">
<link rel="stylesheet" href="${ctx}/static/common.css">
<script src="${ctx}/webjars/jquery/dist/jquery.min.js"></script>
<script src="${ctx}/webjars/art-template/lib/template-web.js"></script>