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
</head>
<body>
	<div id="show">
		<%@ include file="../layout/banner.jsp"%>
		<div id="read_article" style="display:block; width:100%; height:100%;">
			<%@ include file="../layout/menu.jsp"%>
			<%@ include file="../content/readContent.jsp"%>
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
		pWidth = $('#read_article').width();
		cWidth = $('#menu-view').width();
		$('#readArticle-wrapper').css('width', (pWidth - cWidth));

		cHeight_cand1 = $('#readArticle-wrapper').height();
		cHeight_cand2 = $('#menu-view').height();
		if(cHeight_cand1 > cHeight_cand2){
			$('#read_article').css('height', cHeight_cand1);
		}else{
			$('#read_article').css('height', cHeight_cand2);
		}


		$(window).on('resize', function () {
			pWidth = $('#read_article').width();
			cWidth = $('#menu-view').width();
			$('#readArticle-wrapper').css('width', (pWidth - cWidth));
		});

	});
</script>
</html>