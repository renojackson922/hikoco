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
		padding:10px 5px 10px 5px;
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
	<%@ include file="../layout/subBanner.jsp" %>
	<div class="sb-gallary-wrapper" style="width:100%; height:inherit; display:inline-block; margin-bottom:30px;">
		<c:forEach var="i" items="${boardVOList}">
			<%--<c:forEach var="i" begin="1" end="4">--%>
				<div class="sb-gallary-row">
					<div class="sb-gallary-item col-md-3">
						<div style="width:inherit; border:1px solid #5d5d5d; height:100%; background-color:#fff;">
							<div class="sb-gallary-item__header">
								<span>게시물 번호: ${i.id}</span>
							</div>
							<div class="sb-gallary-item__figure">
								<img src="../../../../resources/imgs/margarette.png" width="100%" height="100%">
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