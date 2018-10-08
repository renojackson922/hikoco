<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
	<title>실크독 심플보드</title>
	<%@ include file="../essential/base.jsp"%>
	<%--<link href="../../../resources/script/ghostcss.css" rel="stylesheet">--%>
	<link href="../../../resources/script/template.css" rel="stylesheet">
	<script src="../../../resources/js/template.js" crossorigin="*" async defer></script>
</head>
<body>
	<div id="show">
		<%@ include file="layout/banner.jsp"%>
		<%@ include file="layout/menu.jsp"%>
		<%@ include file="./boardList.jsp"%>
		<%@ include file="layout/footer.jsp"%>
	</div>
</body>
</html>