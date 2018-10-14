	<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<div id="shadow" style="position:fixed; display:none; z-index:9998; width:100%; height:100%; background: rgba(0,0,0,0.8)"></div>
		<button onclick="verticalScrollMenu()" id="vertical-scrollBtn" title="모바일 메뉴 보기"><i class="fas fa-bars"></i></button>
		<!-- 모바일용 스크롤링  메뉴 -->
		<div id="menu-view-verticalScroll" class="animated slideInLeft col-md-2" style="display:none; padding-right:20% !important;">
		<div id="list-filter-vert__close" style="height:20px; position:fixed; top:0px; right:10px;">
		<a id="times" href="javascript:void(0)" onclick="verticalScrollRestore()"><span style="font-size:3.0rem; font-weight:200; color: #fff;text-decoration: none;">&times;</span></a>
		</div>
		<div style="height:30px;"></div>
		<c:choose>
			<c:when test="${0 ne 0}">
				<div id="login-module-negative__mobile" class="text-center" style="background: #ddd; padding:20px 0;">
				<span style="font-size:0.8rem;">비회원으로 활동하거나<br><a href="#">로그인</a>하세요.</span>
				</div>
			</c:when>
			<c:otherwise>
				<div id="login-module__mobile" style="background: #ddd; height:75px; padding:10px;">
				<div id="login-module__mobile__avatar" style="float:left;">
				<img src="../../../resources/imgs/margarette.png"
				width="50px" height="auto" style="border-radius:9999px;">
				</div>
				<div id="login-module__mobile__idnick" style="float:left; overflow:hidden; padding-left:5px; padding-top:5px;">
				<span style="font-size:0.9rem; line-height: 15px;"><strong>마가렛트</strong>&nbsp;(margarette)</span>
				<div id="login-module__mobile__icon-wrapper">
				<span class="login-module__idnick__icon" style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px;
				background:crimson; color:#fff; display:inline-block !important;">Lv.273</span>
				<%--<span class="login-module__idnick__icon"  style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px; background:deepskyblue; color:#fff; display:inline-block !important;">유리천장</span>--%>
				<span class="login-module__idnick__icon"  style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px;
				background:orange; color:#fff; display:inline-block !important;">겜창인생</span>
				<span class="login-module__idnick__icon"  style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px;
				background:#000; color:#fff; display:inline-block !important;">만세a</span>
				</div>
				</div>
				</div>
			</c:otherwise>
		</c:choose>
		<ul id="list-filter-vert1" class="list-group">
		<div class="text-center" style="padding:10px 0 5px;">
		<span style="font-size:1rem; color:#fff;">포말게시판</span>
		</div>
		<li class="list-group-item list-menu" data-value="1" onclick="moveByRef(this)">자유게시판</li>
		<li class="list-group-item list-menu" data-value="2" onclick="moveByRef(this)">질문게시판</li>
		<li class="list-group-item list-menu" data-value="3" onclick="moveByRef(this)">익명게시판</li>
		<li class="list-group-item list-menu" data-value="4" onclick="moveByRef(this)">장터게시판</li>
		<li class="list-group-item list-menu" data-value="5" onclick="moveByRef(this)">신고게시판</li>
		</ul>
		<ul id="list-filter-vert2" class="list-group">
		<div class="text-center" style="padding:10px 0 5px;">
		<span style="font-size:1rem; color:#fff;">께임게시판</span>
		</div>
		<li class="list-group-item list-menu" data-value="6" onclick="moveByRef(this)">오버워치</li>
		<li class="list-group-item list-menu" data-value="7" onclick="moveByRef(this)">몬스터헌터:월드</li>
		<li class="list-group-item list-menu" data-value="8" onclick="moveByRef(this)">리그오브레전드</li>
		<li class="list-group-item list-menu" data-value="9" onclick="moveByRef(this)">나와라</li>
		<li class="list-group-item list-menu" data-value="13" onclick="moveByRef(this)">히어로즈오브더스톰</li>
		</ul>
		<ul id="list-filter-vert3" class="list-group">
		<div class="text-center" style="padding:10px 0 5px;">
		<span style="font-size:1rem; color:#fff;">투데이윾머</span>
		</div>
		<li class="list-group-item list-menu" data-value="10" onclick="moveByRef(this)">윾게</li>
		<li class="list-group-item list-menu" data-value="11" onclick="moveByRef(this)">스게</li>
		<li class="list-group-item list-menu" data-value="12" onclick="moveByRef(this)">만세a</li>
		</ul>
		</div>
		<!-- End of 모바일용 스크롤링 메뉴 -->

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
		<div id="menu-view" style="float:left; max-width:220px;">  <!--rgba(0,0,0,0.125);-->
		<style>
		#login-module, #login-module-negative{
		/*border:2px solid blueviolet;*/
		box-sizing: border-box;
		display: inline-block;
		border-style: solid;
		background-color:#fff;
		border-image: linear-gradient(to right, #01c9ca 0%, #3886FF 100%);
		border-image-slice: 1;
		border-image-width:2px;
		}
		</style>
		<c:choose>
			<c:when test="${session eq null}">
				<%--<c:if test="${loginResult ne null}">--%>
				<%--<script>--%>
				<%--loginResultAlert();--%>
				<%--</script>--%>
				<%--</c:if>--%>
				<div id="login-module-negative" style="min-height:300px; width:220px; padding:7px 7px 15px 7px;">
				<style>
				#login-module-negative__header__title:before{
				content: '';
				font-size: 2.0rem;
				animation-name: head;
				animation-duration: 5s;
				animation-direction: alternate;
				animation-iteration-count: infinite;
				-webkit-animation-name: head;
				-webkit-animation-duration: 5s;
				-webkit-animation-direction: alternate;
				-webkit-animation-iteration-count: infinite;
				-moz-animation-name: head;
				-moz-animation-duration: 5s;
				-moz-animation-direction: alternate;
				-moz-animation-iteration-count: infinite;
				}

				@keyframes head {
				0% {opacity:1; content: "심플보드"}
				50% {opacity:0; color:#fff;}
				100% {opacity:1; content: "Simpleboard"}
				/*75% {opacity:0; color:#fff;}*/
				/*100% {opacity:1; content: "심플보드"}*/
				/*100% {opacity:1; content: "Simpleboard"}*/
				}
				@-webkit-keyframes head {
				0% {opacity:1; content: "심플보드"}
				50% {opacity:0; color:#fff;}
				100% {opacity:1; content: "Simpleboard"}
				}
				@-moz-keyframes head {
				0% {opacity:1; content: "심플보드"}
				50% {opacity:0; color:#fff;}
				100% {opacity:1; content: "Simpleboard"}
				}
				.login-field{
				margin-bottom:8px;
				}
				.login-field > label{
				margin-bottom:4px;
				}
				.login-field > input{
				height: 30px !important;
				}

				.login-field > label, input{
				font-size:0.8rem !important;
				}
				.login-field-option-item{
				display: inline-block;
				}
				.login-field-option-item > a{
				text-decoration: none;
				color:#5d5d5d;
				font-size:0.8rem;
				}
				</style>
				<div id="login-module-negative__header" class="text-center" style="height:50px; margin:10px; ">
				<span id="login-module-negative__header__title" style="line-height:50px; font-size:2.0rem; display:block; margin-bottom:10px;"></span>
				<form class="text-left" action="/board/login" method="POST">
				<div class="form-group login-field">
				<label for="id">아이디</label>
				<input type="email" id="id" name="username" class="form-control">
				</div>
				<div class="form-group login-field">
				<label for="pw">비밀번호</label>
				<input type="password" id="pw" name="password" class="form-control">
				</div>
				<div class="text-center login-field-option">
				<div class="login-field-option-item" style="padding-right:6px; border-right:1px solid #ddd;">
				<a href="/board/signup">회원가입</a>
				<%--<a href="/board/signup">회원가입</a>--%>
				</div>
				<div class="login-field-option-item" style="padding-left:5px;">
				<a href="javascript:void(0)">계정찾기</a>
				<%--<a href="/board/account_find">계정찾기</a>--%>
				</div>
				<div style="padding-top:8px;">
				<button type="submit" class="btn btn-secondary signature-btn">로그인</button>
				</div>
				</div>
				</form>
				</div>
				<form>

				</form>
				</div>
			</c:when>
			<c:otherwise>
				<div id="login-module" style="min-height:350px; padding:7px 7px 15px 7px;">
				<img id="login-module-avatar" src="../../../../resources/imgs/margarette.png" width="100%" height="" class="mx-auto d-block">
				<div id="login-module__idnick">
				<span style="line-height:10px;"><strong>${userinfo.nickname}</strong></span>
				<span>(${userinfo.username})</span>
				<span class="login-module__idnick__icon" style="font-size:0.6rem !important; border:none; padding:1px 5px; border-radius:4px;
				background:crimson; color:#fff; display:inline-block !important;">Lv.${userinfo.level}</span>
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
				<c:choose>
					<c:when test="${userinfo.introduction eq null or userinfo.introduction eq ''}">
						<%--<div class="text-center">--%>
						<%--<span style="font-size:0.8rem;">자기소개가 없습니다.<br />프로필 수정에서 자기소개를 업데이트 해주세요.</span>--%>
						<%--</div>--%>
					</c:when>
					<c:otherwise>
						<p>${userinfo.introduction}</p>
					</c:otherwise>
				</c:choose>
				</div>
				<div id="login-module__menu" class="text-center">
				<button class="btn btn-sm signature-btn">프로필 수정</button>
				<form onsubmit="return confirm('로그아웃 하시겠습니까?')" action="/board/logout" method="POST" style="display:inline-block; margin-bottom:0;">
				<button type="submit" class="btn btn-sm signature-btn" style="font-size: 0.75rem;border-radius: 0px;">로그아웃</button>
				</form>
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
		<li class="list-group-item list-menu" data-value="13" onclick="moveByRef(this)">히어로즈오브더스톰</li>
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
		<script>
		<%--var loginResultAlert = function(){--%>
		<%--var phrase = '${loginResult}';--%>
		<%--alert(phrase);--%>
		<%--// return false;--%>
		<%--};--%>
		</script>

		<%--<c:forEach items="${param.model}" var="i">--%>
		<%--${i}--%>
		<%--</c:forEach>--%>
		<%--<c:out value="${param.model}"/>--%>
