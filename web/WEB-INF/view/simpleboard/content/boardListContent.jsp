<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!-- PC -->
<div class="table-view pc-only" style="width: calc(100% - 220px); padding-left:20px; float:left; overflow-x:hidden;">
	<%@ include file="../layout/subBanner.jsp" %>
	<table id="board-table" class="table table-bordered" style="background-color:#fff; border-color:#ddd;">
		<thead class="board-thead">
		<tr>
			<th scope="col" class="text-center" style="width:5% !important;">#</th>
			<th style="width:70% !important;"><strong>제목</strong></th>
			<th style="width:5% !important;"><strong>조회수</strong></th>
			<th style="width:10% !important;"><strong>작성자</strong></th>
			<th style="width:10% !important;"><strong>작성일자</strong></th>
		</tr>
		</thead>
		<tbody class="board-tbody">
		<c:choose>
			<c:when test="${boardVOList eq '[]'}">
				<tr>
					<th colspan="5">
						<div class="text-center" style="height:300px;">
                            <span style="line-height: 300px; font-size:2.0rem; font-weight:300;">
                                게시글이 없습니다.
                            </span>
						</div>
					</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="j" items="${bVAL}" varStatus="var">
					<tr style="background:rgba(0,0,0,0.09);">
						<th scope="row" class="text-center">${j.id}</th>
						<c:choose>
							<c:when test="${j.title.length() gt 50}">
								<c:set var="tmpj" value="${fn:substring(j.title, 0, 50)}..."></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="tmpj" value="${j.title}"></c:set>
							</c:otherwise>
						</c:choose>
						<th><a href="/board/c${category}/r${j.id}">${tmpj}&nbsp;&nbsp;<strong>[${j.comment_cnt}]</strong></a>&nbsp;&nbsp;
								<%--<i class="fas fa-leaf" title="새 게시물" style="color:#8fff52;">&nbsp;&nbsp;<i class="fas fa-fire" title="인기 게시물" style="color:#dc2e2e;"></i></i></td>--%>
						<th class="text-center">${j.hit}</th>
						<th>${j.username}</th>
						<th>${j.writedate}</th>
					</tr>
				</c:forEach>

				<c:forEach var="i" items="${boardVOList}">
					<tr>
						<td scope="row" class="text-center" style="width:5% !important;">${i.id}</td>
						<c:choose>
							<c:when test="${i.title.length() gt 50}">
								<c:set var="tmp" value="${fn:substring(i.title, 0, 50)}..."></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="tmp" value="${i.title}"></c:set>
							</c:otherwise>
						</c:choose>
						<td style="width:70% !important;"><a href="/board/c${category}/r${i.id}">${tmp}&nbsp;&nbsp;<strong>[${i.comment_cnt}]</strong></a>&nbsp;&nbsp;
								<%--<i class="fas fa-leaf" title="새 게시물" style="color:#8fff52;">&nbsp;&nbsp;<i class="fas fa-fire" title="인기 게시물" style="color:#dc2e2e;"></i></i></td>--%>
						<td class="text-center" style="width:5% !important;">${i.hit}</td>
						<td style="width:10% !important;">${i.username}</td>
						<td style="width:10% !important;">${i.writedate}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	<style>
		#number_module > span{
			font-size:0.8rem;
		}
	</style>

	<!-- Desktop Pagination -->
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
								<span class="sr-only">Next</span>ㅁ							</a>
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

<!-- mobile -->
<style>
	.mobile-only-items{
		white-space: initial !important;
		overflow: initial !important;
		text-overflow: initial !important;
	}
	.mobile-only-items-second > span{
		font-weight: 400;
		color: #969696;
	}
</style>
<div id="mobile-scroll-prevent" class="table-view col-md-10 mobile-only" style="float:left; width:100%;">
	<%--모바일데스웅--%>
	<div style="padding-top:10px;">
		<img src="" class="board-banner-img img-fluid mx-auto d-block" style="display:block; margin-bottom:5px;">
	</div>
	<table class="table table-bordered" style="border-color:#ddd;">
		<thead>
		<th scope="col" class="text-center">게시글</th>
		</thead>
		<tbody>

		<c:choose>
			<c:when test="${boardVOList eq '[]'}">
				<tr>
					<th colspan="4">
						<div class="text-center" style="height:300px;">
                            <span style="line-height: 300px; font-size:2.0rem; font-weight:300;">
                                게시글이 없습니다.
                            </span>
						</div>
					</th>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="i" items="${boardVOList}">
					<tr>
						<td><a href="/board/c${category}/r${i.id}">
							<div class="mobile-only-items">
								<div class="mobile-only-items-first" style="padding-bottom:4px;">
									<span style="font-size:0.9rem;"><strong>[윾머(임시)]</strong></span>&nbsp;<span style="font-size:0.9rem;">${i.title}</span><br>
								</div>
								<div class="mobile-only-items-second">
									<span>${i.username}</span>
									&nbsp;<span>|</span>&nbsp;
									<span>추천 0</span>
									&nbsp;<span>|</span>&nbsp;
									<span>조회 100</span>
									&nbsp;<span>|</span>&nbsp;
									<span>${i.writedate}</span>
								</div>
							</div>
						</a>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	</table>
	<%--<div class="number_module text-center">--%>
	<%--&lt;%&ndash;<span>&#60; &#60;&#60;/span>&ndash;%&gt;--%>
	<%--<c:forEach var="j" begin="1" end="5">--%>
	<%--<span>${j}</span>--%>
	<%--</c:forEach>--%>
	<%--<span>&#62; &#62;&#62;</span>--%>
	<%--</div>--%>

	<!-- Mobile Pagination -->
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

		/** table-view    */
		pWidth = $('#table-view').width();
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