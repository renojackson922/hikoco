<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html ng-app="app">
<head>
    <title>${boardVO.title}&nbsp;&#124;&nbsp;실크독 심플보드</title>
    <%@include file="./essential/base.jsp"%>
    <style>
        .col-md-2, .col-md-10{
            float:left;
        }
    </style>
    <script>
        $(document).ready(function(){
            var imgResize = document.getElementsByTagName( 'img' )[0]; // '0' to assign the first (and only `HTML` tag)
            imgResize.className += 'img-fluid';

            history.pushState(null, null, location.href);
            window.onpopstate = function(event) {
                history.go(1);
            };
        });

        var deleteArticle = function(num){
            if(confirm('정말로 삭제하시겠습니까?\n한번 삭제된 내용은 복구할 수 없습니다!')){
                return true;
            }else{
                return false;
            }
        }

    </script>
    <script type="text/javascript">
        var _GET = _.object(_.compact(_.map(location.search.slice(1).split('&'), function(item) {  if (item) item = item.split('='); if (item[1]) item[1] = decodeURIComponent(item[1]); return item; })));
/*
        var apiUrl = function(path) {
//        var host = 'http://minibus.conbus.net:8884';
            var host = 'http://api.anna.sh';
            return host + '/g1' + path;
        };
*/
        var apiUrl = function(){
            var host = '/restfulBoard?data=';
            var data = '${boardVO.id}';
            return host + data;
        }

        var app = angular.module('app', []);
        var _scope;
        app.controller('ctrl', function($scope, $http) {
            _scope = $scope;
            $scope.test = function (callback) {
                $http({
                    // data: data,
                    url: apiUrl(),
                    method: 'GET'
                }).then(function (response) {
                    $scope.mine = response.data;
                    // return response;
                    $('#article2').html($scope.mine.data.detail);
                    if (callback) {
                        callback();
                    }
                });
            };

          $scope.test(function(){

          });
        });

    </script>
    <style>
        .btn{
            border-radius:0px;
        }
        .list-group-item{
            padding: 0px;
        }
        .list-group-item:first-child{
            border-top-left-radius: 0px;
            border-top-right-radius: 0px;
        }
        .list-group-item:last-child{
            border-bottom-left-radius: 0px;
            border-bottom-right-radius: 0px;
        }
        .btn-tiny{
            font-size:0.6em;
        }
        @media screen and (min-width: 0px) and (max-width: 700px) {
            #board-view {
                /*display: block;*/
                width:100%;
            }
        }
        @media screen and (min-width: 701px) and (max-width: 3000px) {
            #board-view {
                width:80%;
                margin:0 auto;
            }
        }
    </style>
</head>
<body id="board-view" ng-controller="ctrl">
<div class="text-right" style="right:0; width:100%; margin-top:20px;">
    <a class="btn btn-sm btn-secondary" href="/board/c${category}/r${boardVO.id}/edit">수정</a>
    <a class="btn btn-sm btn-secondary" href="javascript:void(0)" onclick="deleteArticle(${boardVO.id})">삭제</a>
    <a class="btn btn-sm btn-secondary" href="/board/c${category}">목록</a>
</div>

<c:choose>
    <c:when test="${boardVO.category eq 1}">
        <c:set var="catAbbr" value="[자게]"/>
    </c:when>
    <c:when test="${boardVO.category eq 2}">
        <c:set var="catAbbr" value="[질문]"/>
    </c:when>
    <c:when test="${boardVO.category eq 3}">
        <c:set var="catAbbr" value="[익명]"/>
    </c:when>
    <c:when test="${boardVO.category eq 4}">
        <c:set var="catAbbr" value="[장터]"/>
    </c:when>
    <c:when test="${boardVO.category eq 5}">
        <c:set var="catAbbr" value="[신고]"/>
    </c:when>
</c:choose>

<%--<div class="wrapper" style="border:1px solid #ddd; margin:5px 0;">--%>
    <%--<div style="border-bottom: 1px solid #ddd; ">--%>
        <%--<div class="col-md-12" style="padding-top:5px; padding-bottom:5px;;background: #f5f6f6;">--%>
            <%--<span style="font-weight:600;">${catAbbr}&nbsp;${boardVO.title}</span>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div style="border-bottom: 1px solid #ddd; ">--%>
        <%--<div class="col-md-12" style="padding-top:5px; padding-bottom:5px;"><span style="font-size:0.8em;">작성자: ${boardVO.username}</span></div>--%>
    <%--</div>--%>
    <%--<div>--%>
        <%--&lt;%&ndash;<button id="edit" class="btn btn-primary" onclick="edit()" type="button">Edit 1</button>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<button id="save" class="btn btn-primary" onclick="save()" type="button">Save 2</button>&ndash;%&gt;--%>
        <%--<div id="article" style="min-height:500px; border-bottom:1px solid #5d5d5d; padding:10px 15px; overflow-x: hidden;">--%>
            <%--${boardVO.detail}--%>
        <%--</div>--%>

        <%--&lt;%&ndash;<div id="reply" style="min-height:100px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<ul class="list-group">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 메인댓글 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<li class="list-group-item">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 사진 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div style="width:15%; float:left; min-height: 130px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<img src="../../resources/imgs/overspark.png" class="img-fluid mx-auto d-block"&ndash;%&gt;--%>
        <%--&lt;%&ndash;style="padding:5px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 내용 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div style="float:left; width:85%; min-height:130px; padding:5px 15px 5px 15px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 닉네임 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div style="padding-bottom:2px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<span style="font-size:0.9em;"><strong>야옹이</strong></span>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 내용 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<p style="font-size:0.8em;">앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠&ndash;%&gt;--%>
        <%--&lt;%&ndash;앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠&ndash;%&gt;--%>

        <%--&lt;%&ndash;</p>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="text-right" style="display:block;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<button class="btn btn-sm btn-secondary btn-tiny">수정</button>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<button class="btn btn-sm btn-secondary btn-tiny">삭제</button>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<button class="btn btn-sm btn-secondary btn-tiny">목록</button>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<c:forEach var="i" begin="1" end="3">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 답글 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<li class="list-group-item" style="padding-left:50px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 사진 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div style="width:15%; float:left; min-height: 130px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<img src="../../resources/imgs/overspark.png" class="img-fluid mx-auto d-block"&ndash;%&gt;--%>
        <%--&lt;%&ndash;style="padding:5px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 내용 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div style="float:left; width:85%; min-height:130px; padding:5px 15px 5px 15px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 닉네임 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div style="padding-bottom:2px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<span style="font-size:0.9em;"><strong>야옹이</strong></span>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 내용 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<p style="font-size:0.8em;">앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠&ndash;%&gt;--%>
        <%--&lt;%&ndash;앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠앙메르띠&ndash;%&gt;--%>

        <%--&lt;%&ndash;</p>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="text-right" style="display:block;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<button class="btn btn-sm btn-secondary btn-tiny">수정</button>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<button class="btn btn-sm btn-secondary btn-tiny">삭제</button>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<button class="btn btn-sm btn-secondary btn-tiny">목록</button>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</li>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</c:forEach>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div id="reply-write" style="height:132px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<form id="form2" name="form2" action="/reply" method="POST" style="margin:0;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 사진 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div style="width:15%; float:left; min-height: 130px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<img src="../../resources/imgs/overspark.png" class="img-fluid mx-auto d-block"&ndash;%&gt;--%>
        <%--&lt;%&ndash;style="padding:5px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 내용 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div style="float:left; width:85%; min-height:130px; padding:5px;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<!-- 닉네임 -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div style="padding-bottom:2px; display:inline-block;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<style>&ndash;%&gt;--%>
        <%--&lt;%&ndash;#inputGroup-sizing-sm1, #inputGroup-sizing-sm2{&ndash;%&gt;--%>
        <%--&lt;%&ndash;font-size:0.8em;&ndash;%&gt;--%>
        <%--&lt;%&ndash;}&ndash;%&gt;--%>
        <%--&lt;%&ndash;</style>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div id="auth-form-wrapper" class="mb-1" style="display:inline-block; width:100%;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="col-sm-4" style="float:left; padding-left:0;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="input-group input-group-sm"> <!-- mb-3; margin-bottom -->&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="input-group-prepend">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<span class="input-group-text" id="inputGroup-sizing-sm1">닉네임</span>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<input type="text" class="form-control" aria-label="닉네임" aria-describedby="inputGroup-sizing-sm1">&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="col-sm-4" style="float:left; padding-left:0;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="input-group input-group-sm">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="input-group-prepend">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<span class="input-group-text" id="inputGroup-sizing-sm2">비밀번호</span>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<input type="text" class="form-control" aria-label="비밀번호" aria-describedby="inputGroup-sizing-sm2">&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div id="reply-wrapper" style="display:inline-block; width:100%">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="col-sm-11" style="padding:0; height:87px; float:left;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<textarea class="form-control" placeholder="댓글 내용을 입력해주세요." style="height: inherit;&ndash;%&gt;--%>
        <%--&lt;%&ndash;border-radius:0px; resize: none;"></textarea>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="col-md-1" style="padding-left:5px; float:left; height:87px; float:left;">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<button type="submit" class="btn btn-info" style="height: inherit">제출</button>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</form>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div><!-- End of Reply Wrapper-->&ndash;%&gt;--%>
    <%--</div>--%>
<%--</div>--%>

<!----------->
<div class="wrapper" style="border:1px solid #ddd; margin:5px 0;">
    <div style="border-bottom: 1px solid #ddd;">
        <div class="col-md-12" style="padding-top:5px; padding-bottom:5px;;background: #f5f6f6; white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;">
            <span style="font-weight:600; font-size:0.9rem;">${catAbbr}&nbsp;{{mine.data.title}}</span>
        </div>
    </div>
    <div style="border-bottom: 1px solid #ddd; ">
        <div class="col-md-12" style="padding-top:5px; padding-bottom:5px;"><span style="font-size:0.8rem;">작성자: {{mine.data.username}}</span></div>
    </div>
    <div>
        <style>
            #article2 > p {
                font-size: initial;
            }
            #article2 > h1{
                font-size: initial;
            }
        </style>
        <div id="article2" style="min-height:500px; border-bottom:1px solid #5d5d5d; padding:10px 15px; overflow-x: hidden;">
            <%--${boardVO.detail}--%>
        </div>
    </div>
</div>
<!--------->

<div style="height:200px;"></div>

</body>
</html>


<%--<div class="col-md-4">${boardVO.username}</div>--%>
<%--<div class="col-md-4">${boardVO.writedate}</div>--%>