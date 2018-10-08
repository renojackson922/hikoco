	<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
		<!--
		=============================================================================
		PPPPPP      CCCCCC          VV    VV  IIIIII  EEEEEE  WW      WW
		PP    PP   CC     CC        VV    VV    II    EE      WW      WW
		PP    PP   CC               VV    VV    II    EE      WW      WW
		PPPPPP     CC        ====   VV    VV    II    EEEEEE  WW  WW  WW
		PP         CC        ====   VV    VV    II    EE      WW  WW  WW
		PP         CC     CC         VV  VV     II    EE      WW W  W WW
		PP          CCCCCC             VV     IIIIII  EEEEEE   WWW  WWW
		=============================================================================
		-->
		<div id="pc-whole-wrapper">
		<div id="view-wrapper" style="height:100%;">
		<div id="menu-view" style="float:left; max-width:220px;">  <!--rgba(0,0,0,0.125);-->
		<c:choose>
			<c:when test="${0 ne 0}">
				<div id="login-module-negative" class="text-center"
				style="height: 100px; margin-top:15px; border:1px solid rgba(0,0,0,0.125); padding:30px 0;">
				<span style="font-size:0.8rem;">비회원으로 활동하거나<br><a href="#">로그인</a>하세요.</span>
				</div>
			</c:when>
			<c:otherwise>
				<div id="login-module" style="min-height:350px; border:1px solid crimson; padding:7px 7px 15px 7px;">
				<img id="login-module-avatar" src="../../../../resources/imgs/margarette.png" width="100%" height="" class="mx-auto d-block">
				<div id="login-module__idnick">
				<span style="line-height:10px;"><strong>마가렛트</strong></span>
				<span>(margarette)</span>
				<span class="login-module__idnick__icon" style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px;
				background:crimson; color:#fff; display:inline-block !important;">Lv.273</span>
				<span class="login-module__idnick__icon"  style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px;
				background:orange; color:#fff; display:inline-block !important;">겜창인생</span>
				<span class="login-module__idnick__icon"  style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px;
				background:#000; color:#fff; display:inline-block !important;">만세a</span>
				</div>
				<div id="login-module__progress">
				<div class="progress">
				<div class="progress-bar progress-bar-striped" role="progressbar" style="width: 75%"
				aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">75%</div>
				</div>
				</div>
				<div id="login-module__motto">
				<p>오늘밤도 고독이 밀려온다..<br>나 혼자서 이 밤을 견디려면.. 알코올.. 알코올이 필요하다..<br>
				나는 저급한 소주 따위는 마시지 않는다.<br>아일랜드산 흑맥주. <strong>구인네스</strong>를 마신다.</p>
				</div>
				<div id="login-module__menu" class="text-center">
				<%--<button class="btn btn-sm btn-info">프로필 수정</button>--%>
				<%--<button class="btn btn-sm btn-danger">로그아웃</button>--%>
				</div>
				</div>
			</c:otherwise>
		</c:choose>

		<div style="height:10px"></div>
		<!-- PC Version -->
		<ul id="list-filter1" class="list-group" style="max-width:220px;">
		<div class="text-center" style="padding:10px 0 5px;">
		<span style="font-size:1rem">포말게시판</span>
		</div>
		<c:set var="array">자유게시판,질문게시판,익명게시판,장터게시판,신고게시판</c:set>
		<c:forEach var="i" begin="0" end="4" items="${array}" varStatus="idx">
			<li class="list-group-item list-menu" data-value="${idx.index + 1}" onclick="moveByRef(this)">${i}</li>
		</c:forEach>
		</ul>
		<ul id="list-filter2" class="list-group" style="max-width:220px;">
		<div class="text-center" style="padding:10px 0 5px;">
		<span style="font-size:1rem">께임게시판</span>
		</div>
		<c:set var="array2">오버워치,몬스터헌터:월드,리그오브레전드,나와라</c:set>
		<c:forEach var="i" begin="0" end="3" items="${array2}" varStatus="idx">
			<li class="list-group-item list-menu" data-value="${idx.index + 6}" onclick="moveByRef(this)">${i}</li>
		</c:forEach>
		</ul>
		<ul id="list-filter3" class="list-group" style="max-width:220px;">
		<div class="text-center" style="padding:10px 0 5px;">
		<span style="font-size:1rem">투데이윾머</span>
		</div>
		<c:set var="array3">윾게,스게,만세a</c:set>
		<c:forEach var="i" begin="0" end="2" items="${array3}" varStatus="idx">
			<li class="list-group-item list-menu" data-value="${idx.index + 10}" onclick="moveByRef(this)">${i}</li>
		</c:forEach>
		</ul>
		</div>

		<!--used to be here -->
		<%--<%@include file="../boardList.jsp"%>--%>

		</div><!-- End of view-wrapper-->
		<!-- footer.jsp -->
		<%--<%@include file="./layout/footer.jsp"%>--%>
		</div>
		<script>
		$(function(){
		var menuHeight = $('#menu-view').css('height');
		$('#pc-whole-wrapper').css('height', menuHeight);
		});
		</script>