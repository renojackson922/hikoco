<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-cloak ng-app="app">
<head>
    <title>HIKOCO :: My Cart</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HIKOCO :: MAIN</title>
    <!-- Vue.js Development -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.10/angular.min.js"></script>
    <script src="../../resources/js/angular-timer.min.js"></script>
    <script src="../../resources/js/humanize-duration.js"></script>
    <%--<script src="../../resources/js/angular-moment.min.js"></script>--%>
    <!-- 주의! animated 를 위해서 slim 이 아닌 uncompressed를 사용했음. 문제를 해결하면 slim 으로 바꿀 것 -->
    <script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
    <!-- Bootstrap 4.1.1 & jQuery-Slim -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>

    <!-- Load Montstreet Fonts -->
    <%--<link rel="stylesheet" href="/public/css/fonts.css">--%>
    <!-- Font-Awesome -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js"
            integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl"
            crossorigin="anonymous"></script>
    <!-- Underscore.js -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore.js"></script>
    <!-- Animate.css -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"
          integrity="sha384-OHBBOqpYHNsIqQy8hL1U+8OXf9hH6QRxi0+EODezv82DfnZoV7qoHAZDwMwEJvSw"
          crossorigin="anonymous">
    <%--<script src="/public/js/headroom.min.js"></script>--%>
    <!-- Summernote -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
    <!-- jCarousel -->
    <script src="../../resources/js/jquery.jcarousel.min.js"></script>
    <link rel="stylesheet" href="../../resources/script/jcarousel.css">
    <!-- scrollreveal -->
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <script type="text/javascript">
        //underscore.js URL parsing code
        var _GET = _.object(_.compact(_.map(location.search.slice(1).split('&'), function (item) {
            if (item) item = item.split('=');
            if (item[1]) item[1] = decodeURIComponent(item[1]);
            return item;
        })));

        var app = angular.module('app', ['timer']);

        // 다른 도메인의 소스 불러오기 필터
        app.filter('trustUrl', function ($sce) {
            return function (url) {
                return $sce.trustAsResourceUrl(url);
            }
        });

        app.controller('ctrl', function ($scope, $http, $interval, $timeout) {
            $scope.hide = 0;

            $scope.hideAndSeek = function(){
                $scope.hide = 1;
            }

            $scope.hideAndSeekDisabled = function(){
                $scope.hide = 0;
            }
        });
    </script>
</head>
<body ng-controller="ctrl">
    <style>
        span{
            display:block;
        }
        .list-group-item{
            padding:5px;
        }
    </style>
    <%@include file="layout/hikoco_login_popup.jsp"%>
    <%@include file="layout/hikoco_navbar.jsp"%>
    <div id="show" style="width:80%; margin:0 auto; padding-top:60px;">
        <div style="height:150px; background:#5d5d5d;">
            <h1>장바구니</h1>
        </div>
        <div style="height:80px; background: #ddd;">

        </div>
        <div class="text-center" style="height:500px; padding:160px 0;">
            <h1>장바구니가 비어있습니다.</h1>
        </div>
        <div class="text-center" style="height:500px; padding:160px 0;">
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="hikoco-mycart-list" style="height:100px;">
                        <div style="display:inline-block; float:left; width:15px; padding:50px 0;">
                            <input type="checkbox">
                        </div>
                        <div style="float:left; padding:5px 0; margin-left:10px !important; border:1px solid #5d5d5d;">
                            <img src="../../resources/imgs/palit.jpg" width="100px" height="100px">
                        </div>
                        <div style="float:left; overflow:hidden; margin-left:10px !important; border:1px solid #5d5d5d; width:auto; height:100%;">

                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <div class="text-center">
            <h5>주의사항</h5>
            <span>fuck</span>
            <span>fuck</span>
            <span>fuck</span>
            <span>fuck</span>
            <span>fuck</span>
        </div>
    </div>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function(event){
        // document.getElementById('hikoco-nav').style.height = 66;
        document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0.8)';
    });
</script>
</html>
