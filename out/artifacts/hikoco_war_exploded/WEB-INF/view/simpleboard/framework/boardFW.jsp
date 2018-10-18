<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
	<title>실크독 심플보드</title>
	<%@ include file="../../essential/base.jsp"%>
	<%--<link href="../../../resources/script/ghostcss.css" rel="stylesheet">--%>
	<link href="../../../../resources/script/template.css" rel="stylesheet">
	<script src="../../../../resources/js/template.js" crossorigin="*" async defer></script>
	<script>
		var foo = '${getAllCategoryList}';
		console.log(foo);
	</script>
</head>
<body>
	<div id="show">
		<%@ include file="../layout/banner.jsp"%>
		<div id="board_list" style="display:block; width:100%; height:100%;">
			<c:set var="myRequestModel" value="${getAllCategoryList}" scope="request" />
			<%--<%@ include file="layout/menu.jsp"%>--%>
			<jsp:include page="../layout/menu.jsp">
				<jsp:param name="model" value="myRequestModel"/>
			</jsp:include>
			<%@ include file="../content/boardListContent.jsp"%>
		</div>
		<%@ include file="../layout/footer.jsp"%>
	</div>
</body>
<script>
	$(function(){
		/*
		 *    e.g.)
		 *    .width() = 200
		 *    .css('width') = 200'px'
		 *  */
		pWidth = $('#board_list').width();
		cWidth = $('#menu-view').width();
		$('#table-view').css('width', (pWidth - cWidth));

		cHeight_cand1 = $('#table-view').height();
		cHeight_cand2 = $('#menu-view').height();
		if(cHeight_cand1 > cHeight_cand2){
			$('#board_list').css('height', cHeight_cand1);
		}else{
			$('#board_list').css('height', cHeight_cand2);
		}

		$(window).on('resize', function () {
			pWidth = $('#board_list').width();
			cWidth = $('#menu-view').width();
			$('#table-view').css('width', (pWidth - cWidth));
		});

	});
</script>
</html>