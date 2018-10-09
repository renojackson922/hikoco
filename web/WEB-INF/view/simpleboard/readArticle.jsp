<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%--<script type="text/javascript">--%>
<%--var _GET = _.object(_.compact(_.map(location.search.slice(1).split('&'), function(item) {  if (item) item = item.split('='); if (item[1]) item[1] = decodeURIComponent(item[1]); return item; })));--%>
<%--/*--%>
<%--var apiUrl = function(path) {--%>
<%--//        var host = 'http://minibus.conbus.net:8884';--%>
<%--var host = 'http://api.anna.sh';--%>
<%--return host + '/g1' + path;--%>
<%--};--%>
<%--*/--%>
<%--var apiUrl = function(){--%>
<%--var host = '/restfulBoard?data=';--%>
<%--var data = '${boardVO.id}';--%>
<%--return host + data;--%>
<%--}--%>

<%--var app = angular.module('app', []);--%>
<%--var _scope;--%>
<%--app.controller('ctrl', function($scope, $http) {--%>
<%--_scope = $scope;--%>
<%--$scope.test = function (callback) {--%>
<%--$http({--%>
<%--// data: data,--%>
<%--url: apiUrl(),--%>
<%--method: 'GET'--%>
<%--}).then(function (response) {--%>
<%--$scope.mine = response.data;--%>
<%--// return response;--%>
<%--$('#article2').html($scope.mine.data.detail);--%>
<%--if (callback) {--%>
<%--callback();--%>
<%--}--%>
<%--});--%>
<%--};--%>
<%--$scope.test(function(){});--%>
<%--});--%>
<%--</script>--%>
<div id="readArticle-wrapper">
	<!-- 서브 게시판 배너 -->
	<div class="text-center" style="width:100%; height:100px; border:1px solid #5d5d5d; margin-bottom:10px;">
		<span id="banner-span" style="font-size:2.0rem; font-weight:300; line-height:100px;"></span>
	</div>
	<div id="readArticle-inner-wrapper">
		<div id="readArticle-title">
			<span id="readArticle-title__category"></span>&nbsp;<span>${boardVO.title}</span>
		</div>
		<div id="readArticle-subinfo">
			<span><strong>작성자:</strong>&nbsp;${boardVO.username}&nbsp;(********)</span>&nbsp;&nbsp;&nbsp;<span><strong>작성일:</strong>&nbsp;${boardVO.writedate}</span>&nbsp;&nbsp;&nbsp;<span><strong>마지막 수정일:</strong>&nbsp;${boardVO.lastEditedDate}</span>
			<div id="readArticle-task" class="text-right" style="float:right; padding:5px 5px 0 0;">
				<a class="btn btn-secondary btn-customized" href="/board/c${category}">목록</a>
				<a class="btn btn-secondary btn-customized" href="/board/c${category}/r${boardVO.id}/edit">수정</a>
				<a class="btn btn-secondary btn-customized" href="javascript:void(0)" onclick="deleteArticle(${boardVO.id}">삭제</a>
			</div>
		</div>
		<div id="readArticle-article">
			${boardVO.detail}
		</div>
		<div id="readArticle-vote" class="text-center" style="padding:6px 0; ">
			<a class="btn btn-secondary btn-customized" href="#" style="background: crimson; border:0px;" title="추천"><i class="far fa-thumbs-up" style="font-size:1.5rem;"></i></a>
			<a class="btn btn-secondary btn-customized" href="#" style="background: deepskyblue; border:0px;" title="비추"><i class="far fa-thumbs-down" style="font-size:1.5rem;"></i></a>
			<a class="btn btn-secondary btn-customized" href="#" style="background: orangered; border:0px;" title="신고"><i class="fas fa-exclamation-triangle" style="font-size:1.5rem;"></i></a>
		</div>
		<div id="readArticle-comment">
			<div id="readArticle-comment__top">
				<span style="font-size:1.25rem; line-height:40px; font-weight:300;">댓글&nbsp;${commentCnt}</span>
			</div>
			<!-- 댓글 목록 ON -->
			<c:forEach var="i" items="${commentVOList}" varStatus="idx">
				<div class="readArticle-comment__item" data-order="${idx.count}" data-depth="${i.depth}" data-parent="${i.parent}">
					<%--<div class="readArticle-comment__item__avatar">--%>
						<%--<img src="../../../resources/imgs/margarette.png" width="100px">--%>
					<%--</div>--%>
					<div class="readArticle-comment__item__comment">
						<div class="readArticle-comment__item__comment__userinfo">
							<span><strong>${i.id}</strong></span>&nbsp;
							<span>(********)</span>&nbsp;
							<span style="font-size:0.8rem; color:#333;">${i.last_edited_date}</span>&nbsp;|
							<span style="font-size:0.8rem; color:#333;">${i.last_edited_ip}</span>&nbsp;
						</div>
						<div class="readArticle-comment__item__comment__detail">
							<p style="margin-bottom:0px;">${i.detail}</p>
						</div>
						<div class="readArticle-comment__item__comment__vote text-right">
							<a href="#">[추천]</a>&nbsp;<a href="#">[비추]</a>&nbsp;<a href="#">[신고]</a>
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 댓글 목록 OFF -->
			<div id="readArticle-comment_bottom" style="padding:10px 10px;">
				<%--<div class="readArticle-comment__item__avatar?" style="float:left; margin-right:10px;">--%>
					<%--<img src="../../../resources/imgs/margarette.png" width="120px">--%>
				<%--</div>--%>
				<form id="form1" action="/board/addComment" method="POST">
					<div class="form-row" style="margin-bottom:5px;">
						<div class="col">
							<input type="text" class="form-control comment-text" name="id" placeholder="닉네임">
						</div>
						<div class="col">
							<input type="password" class="form-control comment-text" name="pw" placeholder="비밀번호">
						</div>
						<div class="col">
							<input type="password" class="form-control comment-text" name="pwConfirm" placeholder="비밀번호 확인">
						</div>
						<input type="hidden" name="category" value="${boardVO.category}">
						<input type="hidden" name="boardId" value="${boardVO.id}">
					</div>
					<textarea name="detail" class="form-control comment-text" style="float:left; overflow-x:hidden; width:calc(100% - 130px); min-height: 120px; overflow-y:auto; resize:none !important;"></textarea>
					<button type="submit" class="btn btn-info" style="float:left; overflow-x:hidden; height:120px; margin-left:10px; width:120px">제출</button>
				</form>
			</div>
		</div>

	</div>
</div>

<script>
	var category = function(){
		var url = new URL(window.location.href);
		return url.pathname.split("/c")[1].split("/r")[0];
	};

	console.log(category());
	var getAkaFromJSON = function(){
		$.getJSON('../../../resources/json/board_category.json', function(result){
			$.each(result, function(i, field){
				if(i == category()){
					console.log(field.name);
					$('#banner-span').text(field.name);
					$('#readArticle-title__category').text('[' + field.aka + ']');

				}
			});
		});
	};
	getAkaFromJSON();
</script>

