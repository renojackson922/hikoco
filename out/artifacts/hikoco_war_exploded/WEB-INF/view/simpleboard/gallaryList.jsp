<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<style>
	.board-thead{
		/*display: table-caption;*/
		color:#fff;
		background: linear-gradient(to right, #01c9ca 0%, #3886FF 2000px) fixed;
		-moz-background-image: linear-gradient(left, #01c9ca 0%, #3886FF 100%);
		-webkit-background-image: linear-gradient(left, #01c9ca 0%, #3886FF 100%);
	}
	.board-tbody{
		/*display: table-row-group;*/
	}
	.sb-gallary-item{
		height:300px;
		float:left;
		margin:0px;
		padding:10px;
	}
	.sb-gallary-item__header {
		height:25px;
		border-bottom:1px solid #5d5d5d;
		padding-left:4px;
	}
	.sb-gallary-item__header > span{
		font-size:.75rem;
		line-height:25px;
	}
	.sb-gallary-item__figure{
		width: 100%;
		height:calc(100% - 100px);
		border-bottom:1px solid #5d5d5d;
	}
	.sb-gallary-item__title{
		width:100%;
		height:50px;
		border-bottom:1px solid #5d5d5d;
		padding:2px;

	}
	.sb-gallary-item__title > span{
		font-size:.9rem;
		margin:0px;
		word-wrap:break-word;
		white-space: normal;
		display:inline-block;
	}
	.sb-gallary-item__caption{
		width:100%;
		height:25px;
		padding-left:4px;
	}
	.sb-gallary-item__caption > div{
		float:left;
		overflow-x:hidden;
	}
	.sb-gallary-item__caption > div > span{
		font-size:.75rem;
		line-height: 25px;
	}

</style>

<!-- PC -->
<div id="sb-gallary-view" class="pc-only" style="display:block; width: calc(100% - 220px); padding-left:20px; float:left; "> <!--overflow-x:hidden;-->
	<div class="sb-cf-banner" style="width:100%; height:135px;">
		<%--<c:choose>--%>
		<%--<c:when test="${category eq 13}">--%>
		<%--<div class="common-banner text-center" style="background:#fff no-repeat local; background-position-x: 50%; background-position-y: 50%; ">--%>
		<%--&lt;%&ndash;<div class="common-banner text-center" style="background:url('../../../resources/imgs/hots_mephisto_cropped.jpg') no-repeat local; background-position-x: 50%; background-position-y: 50%; ">&ndash;%&gt;--%>
		<%--<span id="banner-span" style="font-size:2.0rem; font-weight:300; line-height:100px; background:#fff; padding:0 10px;"></span>--%>
		<%--<script>--%>
		<%--var getAkaFromJSON = function(){--%>
		<%--$.getJSON('../../../resources/json/board_category.json', function(result){--%>
		<%--$.each(result, function(i, field){--%>
		<%--if(i == category()){--%>
		<%--console.log(field.name);--%>
		<%--$('#banner-span').text(field.name);--%>
		<%--}--%>
		<%--});--%>
		<%--});--%>
		<%--};--%>
		<%--getAkaFromJSON();--%>
		<%--</script>--%>
		<%--</div>--%>
		<%--</c:when>--%>
		<%--<c:otherwise>--%>
		<div class="sb-common-banner text-center">
			<span id="banner-span" style="font-size:2.0rem; font-weight:300;"></span><br/>
			<span style="font-size:.9rem;">편하게 먹는 비용 1.3만원... 결혼은 하셨는지?</span>
			<script>
				var getAkaFromJSON = function(){
					$('#banner-span').text('음식갤러리');

					$.getJSON('../../../resources/json/board_category.json', function(result){
						$.each(result, function(i, field){
							if(i == category()){
								console.log(field.name);
								// $('#banner-span').text(field.name);
							}
						});
					});
				};
				getAkaFromJSON();
			</script>
		</div>
		<%--</c:otherwise>--%>
		<%--</c:choose>--%>
		<span id="board-name2" style="float:right; font-size:0.75rem; padding:10px 5px 5px 0;">총 게시글 수:&nbsp;${getListCountByCategory}</span>
	</div>

	<div class="sb-gallary-wrapper" style="width:inherit; height:inherit; display:inline-block; margin-bottom:30px;">
		<c:forEach var="i" items="${boardVOList}">
			<%--<c:forEach var="i" begin="1" end="4">--%>
				<div class="sb-gallary-row">
					<div class="sb-gallary-item col-md-3">
						<div style="width:inherit; border:1px solid #5d5d5d; height:100%; background-color:#fff;">
							<div class="sb-gallary-item__header">
								<span>게시물 번호: ${i.id}</span>
							</div>
							<div class="sb-gallary-item__figure">
								<img src="../../../resources/imgs/margarette.png" width="100%" height="100%">
							</div>
							<div class="sb-gallary-item__title text-center">
								<span>[형신TV] ${i.title}</span>
							</div>
							<div class="sb-gallary-item__caption">
								<div class="text-center" style="width:33.3%">
									<%--<span style="font-size:.6rem; border:0px; border-radius:4px; background-color:crimson; color:#fff; padding:0 2px;">Lv.16</span>--%>
									<span>${i.username}</span>
								</div>
								<div class="text-center" style="width:33.3%">
									<span>조회수:2.3k</span>
								</div>
								<div class="text-center" style="width:33.3%">
									<span>19/12/31</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			<%--</c:forEach>--%>
		</c:forEach>
	</div>

	<%--<!-- Desktop Pagination -->--%>
	<div class="pagination_module text-center">
		<nav aria-label="Page navigation example" style="display:inline-block;">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pageSplice eq 1}"></c:when>
					<c:when test="${pageCnt > 5}">
						<li class="page-item">
							<a class="page-link" href="/board/c${category}/p${(pageSplice-1)*5}" aria-label="Previous">
								<span aria-hidden="true">&lsaquo;</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>
					</c:when>
					<c:otherwise/>
				</c:choose>
				<c:forEach var="i" begin="${(pageSplice * 5) - 4}" end="${pageSplice * 5}">
					<c:if test="${i le pageCnt}">
						<li class="page-item"><a class="page-link" href="/board/c${category}/p${i}">${i}</a></li>
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${pageCnt lt (pageSplice*5)}"></c:when>
					<c:when test="${pageCnt > 5}">
						<li class="page-item">
							<a class="page-link" href="/board/c${category}/p${((pageSplice+1)*5)-4}" aria-label="Next">
								<span aria-hidden="true">&rsaquo;</span>
								<span class="sr-only">Next</span>
							</a>
						</li>
					</c:when>
					<c:otherwise/>
				</c:choose>

			</ul>
		</nav>
	</div>

	<div class="search_module text-center" style="padding-bottom:100px;">
		<a href="/c${category}/write" class="btn btn-info signature-btn">글쓰기</a>
	</div>

</div>



<script>
	$(function(){
		/*
		 *    e.g.)
		 *    .width() = 200
		 *    .css('width') = 200'px'
		 *  */
		/** view-width */
		pWidth = $('#gallary_list').width();
		cWidth = $('#menu-view').width();
		$('#sb-gallary-view').css('width', (pWidth - cWidth));

		/** height candidate */
		cHeight_cand1 = $('#sb-gallary-view').height();
		cHeight_cand2 = $('#menu-view').height();
		console.log('메뉴: ' + cHeight_cand2 + ", 컨텐츠: " + cHeight_cand1);
		if(cHeight_cand1 > cHeight_cand2){
			$('#gallary_list').css('height', cHeight_cand1);
		}else{
			$('#gallary_list').css('height', cHeight_cand2);
		}

		$(window).on('resize', function () {
			pWidth = $('#gallary_list').width();
			cWidth = $('#menu-view').width();
			$('#sb-gallary-view').css('width', (pWidth - cWidth));
		});

	});
</script>