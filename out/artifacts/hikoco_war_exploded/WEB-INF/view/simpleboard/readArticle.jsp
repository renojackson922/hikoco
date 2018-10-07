<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${boardVO.title}&nbsp;&#124;&nbsp;실크독 심플보드</title>
    <%@include file="../essential/base.jsp"%>
    <script>
        $(function(){
            var imgResize = document.getElementsByTagName( 'img' )[0]; // '0' to assign the first (and only `HTML` tag)
            imgResize.className += 'img-fluid';

            // history.pushState(null, null, location.href);
            // window.onpopstate = function(event) {
            //     history.go(1);
            // };
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
            $scope.test(function(){});
        });
    </script>
    <style>
        * {
            /*background: #000 !important;*/
            /*color: #0f0 !important;*/
            /*outline: solid #f00 1px !important;*/
        }
        @media screen and (min-width: 0px) and (max-width: 700px) {
            #board-view {
                /*display: block;*/
                /*width:100%;*/
            }
        }
        @media screen and (min-width: 701px) and (max-width: 3000px) {
            #board-view {
                /*width:80%;*/
                /*margin:0 auto;*/
            }
        }

    </style>
</head>
<body ng-app="app">
    <div id="show">
        <div id="readArticle-wrapper">
            <style>
                #show{}
                #readArticle-wrapper{
                    width:70%;
                    margin:0 auto;
                    border:1px solid #5d5d5d;
                }
                #readArticle-title{
                    height:50px;
                    border-bottom:1px solid #5d5d5d;
                }
                #readArticle-title > span{
                    font-size:1.5rem;
                    line-height:50px;
                }
                #readArticle-subinfo{
                    height:50px;
                    border-bottom:1px solid #5d5d5d;
                }
                #readArticle-task{
                    height:50px;
                    border-bottom:1px solid #5d5d5d;
                }
                #readArticle-article{
                    /*height:calc(1000px - 150px);*/
                    min-height: 500px;
                    border-bottom:1px solid #5d5d5d;
                }
                #readArticle-vote{
                    height:50px;
                    border-bottom:1px solid #5d5d5d;
                }
                #readArticle-comment__top{
                    padding-left:10px;
                    height:50px;
                    border-bottom:1px solid #5d5d5d;
                }
                .readArticle-comment__item{
                    min-height:145px;
                    overflow-y: auto;
                    border-left:1px solid #5d5d5d;
                    border-bottom:1px solid #5d5d5d;
                }
                .readArticle-comment__item__avatar{
                    float:left;
                    /*margin:12px 0;*/
                    padding:10px;
                    width:120px;
                }
                .readArticle-comment__item__comment{
                    float:left;
                    overflow-x:hidden;
                    width: calc(100% - 120px);
                    min-height:inherit;
                    padding:10px;
                }
                .readArticle-comment__item__comment__userinfo{
                    height:25px;
                    padding-left:10px;
                }
                .readArticle-comment__item__comment__detail{
                    min-height: calc(100px - 25px);
                    padding-left:10px;
                }
                .readArticle-comment__item__comment__vote{
                    height:25px;
                    padding-left:10px;
                }
                #readArticle-comment_bottom{
                    width:80%;
                    margin:0 auto;
                    min-height:120px;
                    overflow-y: auto;
                }
            </style>
            <div id="readArticle-title">
                <span id="readArticle-title__category"></span>&nbsp;<span>${boardVO.title}</span>
            </div>
            <div id="readArticle-subinfo">
                ${boardVO.username}
            </div>
            <div id="readArticle-task" class="text-right" style="padding:6px 6px 6px 0; ">
                <a class="btn btn-primary" href="#">목록</a>
                <a class="btn btn-primary" href="#">수정</a>
                <a class="btn btn-primary" href="#">삭제</a>
            </div>
            <div id="readArticle-article">
                ${boardVO.detail}
            </div>
            <div id="readArticle-vote" class="text-center" style="padding:6px 0; ">
                <a class="btn btn-primary" href="#">붐업</a>
                <a class="btn btn-primary" href="#">붐따</a>
                <a class="btn btn-primary" href="#">신고</a>
            </div>
            <div id="readArticle-comment">
                <div id="readArticle-comment__top">
                    <span style="font-size:2.0rem; line-height:50px; font-weight:300;">댓글</span>
                </div>
                <!-- 댓글 목록 ON -->
                <div class="readArticle-comment__item" data-order="1" data-depth="1">
                    <div class="readArticle-comment__item__avatar">
                        <img src="../../../resources/imgs/margarette.png" width="100px">
                    </div>
                    <div class="readArticle-comment__item__comment">
                        <div class="readArticle-comment__item__comment__userinfo">
                            <span><strong>애플워너비</strong></span>&nbsp;
                            <span>(appl****)</span>&nbsp;
                            <span>192.168.35.159</span>
                        </div>
                        <div class="readArticle-comment__item__comment__detail">
                            <p style="margin-bottom:0px;">와! 정말 알고 싶던 정보였어요!</p>
                        </div>
                        <div class="readArticle-comment__item__comment__vote text-right">
                            [추천] [비추] [신고]
                        </div>
                    </div>
                </div>
                <div class="readArticle-comment__item" data-order="2" data-depth="1">
                    <div class="readArticle-comment__item__avatar">
                        <img src="../../../resources/imgs/margarette.png" width="100px">
                    </div>
                    <div class="readArticle-comment__item__comment">
                        <div class="readArticle-comment__item__comment__userinfo">
                            <span>ㅎㅇ</span>&nbsp;
                            <span>(aiko****)</span>&nbsp;
                            <span>192.168.35.159</span>
                        </div>
                        <div class="readArticle-comment__item__comment__detail">
                            <p style="margin-bottom:0px;">와! 정말 알고 싶던 정보였어요!</p>
                        </div>
                        <div class="readArticle-comment__item__comment__vote text-right">
                            [추천] [비추] [신고]
                        </div>
                    </div>
                </div>
                <div class="readArticle-comment__item" data-order="3" data-depth="2" style="margin-left:25px;" >
                    <div class="readArticle-comment__item__avatar">
                        <img src="../../../resources/imgs/margarette.png" width="100px">
                    </div>
                    <div class="readArticle-comment__item__comment">
                        <div class="readArticle-comment__item__comment__userinfo">
                            <span>ㅎㅇ</span>&nbsp;
                            <span>(aiko****)</span>&nbsp;
                            <span>192.168.35.159</span>
                        </div>
                        <div class="readArticle-comment__item__comment__detail">
                            <p style="margin-bottom:0px;">지나치게 비꼬시네요. PPAP 떠놨고 고소하겠읍니다.</p>
                        </div>
                        <div class="readArticle-comment__item__comment__vote text-right">
                            [추천] [비추] [신고]
                        </div>
                    </div>
                </div>
                <div class="readArticle-comment__item" data-order="4" data-depth="3" style="margin-left:50px;">
                    <div class="readArticle-comment__item__avatar">
                        <img src="../../../resources/imgs/margarette.png" width="100px">
                    </div>
                    <div class="readArticle-comment__item__comment">
                        <div class="readArticle-comment__item__comment__userinfo">
                            <span>ㅎㅇ</span>&nbsp;
                            <span>(aiko****)</span>&nbsp;
                            <span>192.168.35.159</span>
                        </div>
                        <div class="readArticle-comment__item__comment__detail">
                            <p style="margin-bottom:0px;">엌ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 이걸로 고소를??????????? ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                                ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                                ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
                                ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ</p>
                        </div>
                        <div class="readArticle-comment__item__comment__vote text-right">
                            [추천] [비추] [신고]
                        </div>
                    </div>
                </div>
                <!-- 댓글 목록 OFF -->
                <div id="readArticle-comment_bottom" style="padding:10px 0;">
                    <div class="readArticle-comment__item__avatar?" style="float:left; margin-right:10px;">
                        <img src="../../../resources/imgs/margarette.png" width="120px">
                    </div>
                    <textarea class="form-control" style="float:left; overflow-x:hidden; width:calc(100% - 260px); min-height: 120px; overflow-y:auto;"></textarea>
                    <button type="button" class="btn btn-info" style="float:left; overflow-x:hidden; height:120px; margin-left:10px; width:120px">제출</button>
                </div>
            </div>
        </div>
    </div>
</body>
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
                    $('#readArticle-title__category').text('[' + field.aka + ']');

                }
            });
        });
    };
    getAkaFromJSON();
</script>
</html>
