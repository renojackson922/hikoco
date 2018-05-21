<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-cloak ng-app="app">
<head>
    <title>HIKOCO :: ITEM</title>
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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
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
    <style>
        .list-group-item:first-child{
            border-top-left-radius:0px;
            border-top-right-radius:0px;
        }
        .list-group-item:last-child{
            border-bottom-left-radius:0px;
            border-bottom-right-radius:0px;
        }
        .list-group > a{
            font-size:12px;
        }

        .category-td-parent-item{
            padding:0px !important;
            width:144px;
            border-right:0px;
        }
        .category-td-parent-item > a{
            font-size:12px;
            margin:0px;
            padding:5px;
            border-top:0px;
            border-right:0px;
        }

        .category-td-child-item{
            padding:0px !important;
            width:144px;
            border-top:0px !important;
            border-right:0px;
        }

        .category-td-child-item > a{
            font-size:12px;
            margin:0px;
            padding:5px;
            border-top:0px !important;
            border-right:0px;
        }
        .last-row{
            border-right:1px solid #ddd !important;
        }
        /* modal-lg inline size */
        .modal-lg{
            max-width:1000px;
        }



        .modal-body{
            height:1000px;
            overflow-y: scroll;
        }

        #myBtn {
            display: none; /* Hidden by default */
            position: fixed; /* Fixed/sticky position */
            bottom: 20px; /* Place the button at the bottom of the page */
            right: 30px; /* Place the button 30px from the right */
            z-index: 99; /* Make sure it does not overlap */
            border: none; /* Remove borders */
            outline: none; /* Remove outline */
            background-color: darkorchid !important; /* Set a background color */
            color: white; /* Text color */
            cursor: pointer; /* Add a mouse pointer on hover */
            padding: 15px; /* Some padding */
            border-radius: 100% !important; /* Rounded corners */
            font-size: 18px; /* Increase font size */
        }

        #myBtn:hover {
            background-color: #555; /* Add a dark-grey background on hover */
        }
    </style>
    <style>
        .modal-body-wrapper{
            margin-bottom:15px;
        }
        .css-table{
            display:table;
        }
        .css-table-row{
            dispaly:table-row;
        }
        .css-table-cell{
            display:table-cell;
        }
        .img-center{
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 100%;
        }
        .modal-option-item span{

        }
        .item-focus:focus{
            background: #5d5d5d;
            color:#fff;
        }
        .modal-span{
            display: block;
        }
        .item-title{
            font-size:1.5em;
        }
        .item-subtitle{
            font-size:0.8em;
        }
        .item-optional{
            font-size:0.8em;
            vertical-align:bottom;
        }
        .btn-outline-secondary{
            border-radius:0px !important;
        }
        hr{
            margin:5px;
        }
    </style>
    <script type="text/javascript">
        //underscore.js URL parsing code
        var _GET = _.object(_.compact(_.map(location.search.slice(1).split('&'), function (item) {
            if (item) item = item.split('=');
            if (item[1]) item[1] = decodeURIComponent(item[1]);
            return item;
        })));

        var app = angular.module('app', []);

        // 다른 도메인의 소스 불러오기 필터
        app.filter('trustUrl', function ($sce) {
            return function (url) {
                return $sce.trustAsResourceUrl(url);
            }
        });

        app.controller('ctrl', function ($scope, $http, $interval, $timeout) {
            $scope.test1 = 1;

            $scope.$watch('test1 * 1000000', function(value){
                $scope.test2 = value;
                $scope.test3 = value *0.005
            });
        });
    </script>
    <style>
        #myBtn {
            display: none; /* Hidden by default */
            position: fixed; /* Fixed/sticky position */
            bottom: 20px; /* Place the button at the bottom of the page */
            right: 30px; /* Place the button 30px from the right */
            z-index: 99; /* Make sure it does not overlap */
            border: none; /* Remove borders */
            outline: none; /* Remove outline */
            background-color: red; /* Set a background color */
            color: white; /* Text color */
            cursor: pointer; /* Add a mouse pointer on hover */
            padding: 15px; /* Some padding */
            border-radius: 10px; /* Rounded corners */
            font-size: 18px; /* Increase font size */
        }

        #myBtn:hover {
            background-color: #555; /* Add a dark-grey background on hover */
        }
        .strong{
            font-weight: 700;
        }
        .unselectable {
            -moz-user-select: -moz-none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            -o-user-select: none;
            user-select: none;
        }
        #card:hover{
            background-color: #5d5d5d;
            color:#fff;
        }
    </style>
</head>
<body ng-controller="ctrl">
    <div id="hide">

    </div>
    <button onclick="topFunction()" id="myBtn" class="animated fadeIn" title="Go to top">Top</button>
    <div id="show">
        <%@include file="layout/hikoco_navbar.jsp"%>
        <div class="container" style="margin-top:17px; margin-bottom:17px; padding:17px; border:1px solid #ddd;">
            <span style="font-size:12px"><i class="fas fa-home"></i>&nbsp;&nbsp;홈 > 그래픽카드 > 엔비디아 > PALIT</span>
        </div>
        <div class="container" style="margin-top:17px; margin-bottom:17px; padding:17px; border:1px solid #ddd;">
            <div class="css-table">
                <!-- 상품의 정보, Top -->
                <div class="css-table-row">
                    <!-- 제목, 가격 등... -->
                    <div class="css-table-cell" style="float:left;">
                        <img src="/resources/imgs/palit.jpg" width="300px" height="300px" style="border:1px solid #ddd;">
                        <div class="" style="display: block;">
                            <button class="btn btn-sm btn-outline-secondary" style="width:100%; margin-top:5px;">자세히 보기</button>
                            <button class="btn btn-sm btn-outline-secondary" style="width:100%; margin-top:5px;">상품신고</button>
                        </div>
                    </div>
                    <!-- 상품의 정보 -->
                    <div class="css-table-cell" style="float:left; margin-left:20px;">
                        <span class="modal-span item-title"><strong>[PALIT] GeForce GTX1060 Dual D5 6GB</strong></span>
                        <span class="modal-span item-subtitle" style="color:#5d5d5d;">NVIDIA Corporation&nbsp;&nbsp;|&nbsp;&nbsp;STCOM Inc.</span>
                        <span class="modal-span item-subtitle">지포스 GTX1060 / GDDR5 6GB / 1506MHz / 최대 1708MHz / 8000MHz / 192-bit / 히트파이프+팬 / PCI-Express x16(3.0)</span>
                        <div class="modal-span">
                            <span class="span-loginInfo" style="font-size:10px; padding:0px 5px 0px 5px; background: #2897d3; color:#fff; border-radius:0px; display: inline-block;">사은품</span>
                            <span class="item-optional">&nbsp;구매영수증 인증 시 메로나 아이스크림 증정 (05.01~05.31)</span>
                        </div>
                        <div class="modal-span">
                            <span class="span-loginInfo" style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>
                            <span class="item-optional">&nbsp;후기 작성 후 별도의 신청 시 스타벅스 캔커피 증정 (05.01~05.31)</span>
                        </div>
                        <div class="modal-span">
                            <span class="span-loginInfo" style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>
                            <span class="item-optional">&nbsp;후기 작성 후 별도의 신청을 하신 6분께 LED 삼각대 증정 (05.01~05.31)</span>
                        </div>
                        <hr>
                        <div class="modal-span">
                            <span class="item-optional strong">제품번호:&nbsp;</span>
                            <span class="item-optional">000001</span>
                        </div>
                        <div class="modal-span">
                            <span class="item-optional strong">적립금:&nbsp;</span>
                            <span class="item-optional">{{test3}}원</span>
                        </div>
                        <div class="modal-span">
                            <span class="item-optional strong">배송정보:&nbsp;</span>
                            <span class="item-optional">2018년 5월 24일 배송예정</span>
                        </div>
                        <div class="modal-span">
                            <span class="item-optional strong">카드혜택:&nbsp;</span>
                            <span class="item-optional">최대 6개월 무이자&nbsp;</span>
                            <span id="card" class="unselectable" style="height:1.0em; font-size:0.5em; padding:5px 5px 5px 5px; border:1px solid #5d5d5d;">카드사별</span>
                        </div>
                        <!-- 옵션 -->
                        <div class="modal-option" style="margin-top:15px;">
                            <!--
                            <table class="table table-bordered">
                                <tbody>
                                <tr>
                                    <div class="modal-option-item" style="border:1px solid #ddd; min-width:150px; height:80px; padding:0px 5px 5px 5px; display:inline-block; margin-right:10px;">
                                        <span style="font-size:12px;">Mint</span>
                                    </div>
                                    <div class="modal-option-item" style="border:1px solid #ddd; min-width:150px; height:80px; padding:0px 5px 5px 5px; display:inline-block; margin-right:10px;">
                                        <span style="font-size:12px;">Mint + M.2 SSD 512GB</span>
                                    </div>
                                </tr>
                                </tbody>
                            </table>
                            -->
                        </div>
                        <!-- 가격 -->
                        <div class="modal-price text-right text-bottom">
                            <span>수량</span>
                            <input ng-model="test1" id="itemAmount" type="text" value="1" style="text-align:center;"><br>
                            <div style="display:inline-block; border:1px solid coral; border-radius:4px; vertical-align:bottom; padding:5px 10px 5px 10px;">
                                <span style="font-size:18px; color:coral"><strong>&#8361;&nbsp;{{test2}}</strong></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <!-- 상품의 디테일, Bottom -->
            <div class="modal-body-wrapper" style="display:block;">
                <!-- button goes here -->
                <div>
                    <table class="table text-center">
                        <tbody>
                        <tr>
                            <div class="category-td-parent" style="display:block">
                                <td class="category-td-parent-item"><a href="#" class="list-group-item list-group-item-action item-focus" onclick="window.location.hash='item-describe'">상세정보</a></td>
                                <td class="category-td-parent-item"><a href="#" class="list-group-item list-group-item-action item-focus" onclick="window.location.hash='item-specinfo'">상품정보제공고시</a></td>
                                <td class="category-td-parent-item"><a href="#" class="list-group-item list-group-item-action item-focus" onclick="window.location.hash='item-comment'">이용후기&nbsp;(0)</a></td>
                                <td class="category-td-parent-item"><a href="#" class="list-group-item list-group-item-action item-focus" onclick="window.location.hash='item-review'">뉴스/리뷰&nbsp;(0)</a></td>
                                <td class="category-td-parent-item"><a href="#" class="list-group-item list-group-item-action item-focus" onclick="window.location.hash='item-qna'">상품Q&A</a></td>
                                <td class="category-td-parent-item last-row"><a href="#" class="list-group-item list-group-item-action item-focus" onclick="window.location.hash='item-refund'">배송/교환/환불</a></td>
                            </div>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Detail goes here -->
                <div>
                    <style>
                        div[id^="item-"], div[id*="item-"]{
                            margin-bottom:15px;
                        }
                        .custom-tablecell, .custom-tablecell__last{
                            float:left;
                            border:1px solid #ddd;
                            font-size:0.8em;
                            border-bottom:0px;
                        }
                        .custom-tablecell{
                            border-right:0px !important;
                        }
                        th, td{
                            font-size:0.7em;
                        }
                        td{
                            padding: .3rem .3rem .3rem .7rem !important;
                            width:35%; /* 주의 */
                        }
                        th{
                            font-weight: 400;
                            background-color: #5d5d5d;
                            color:#fff;
                            width:16%;  /* 주의 */
                            padding: .3rem .3rem .3rem .7rem !important;
                        }
                    </style>
                    <!-- Title -->
                    <div style="margin-bottom:15px;">
                        <h5>상품 상세설명</h5>
                    </div>
                    <div id="item-describe">
                        <img class="img-center" src="/resources/imgs/222.jpg">
                    </div>
                    <!--  상품정보제공고시 -->
                    <div style="margin-bottom:15px;">
                        <h5>상품정보 제공고시</h5>
                    </div>
                    <div id="item-specinfo" class="container" style="height:300px;">
                        <table class="table table-sm table-bordered">
                            <tbody>
                            <tr>
                                <th scope="row">품명 및 모델명</th>
                                <td colspan="3">GeForce GTX1060 Dual D5 6GB</td>
                            </tr>
                            <tr>
                                <th scope="row">동일모델의 출시년월</th>
                                <td>2017.06</td>
                                <th>제조사/제조국가</th>
                                <td>중국</td>
                            </tr>
                            <tr>
                                <th scope="row">정격전압</th>
                                <td>400W</td>
                                <th>소비전력</th>
                                <td>120W</td>
                            </tr>
                            <tr>
                                <th scope="row">에너지소비효율등급</th>
                                <td>해당없음</td>
                                <th>크기/무게</th>
                                <td>252 X 112 mm</td>
                            </tr>
                            <tr>
                                <th scope="row">전자파 적합 인증번호</th>
                                <td>MSIP-REI-STO-PLT1060</td>
                                <th>A/S 책임자</th>
                                <td>N/A</td>
                            </tr>
                            <tr>
                                <th scope="row">KC 자율안전 인증번호</th>
                                <td>해당없음</td>
                                <th>품질보증기준</th>
                                <td>3년</td>
                            </tr>
                            <hr>
                            <tr>
                                <th scope="row">종류</th>
                                <td>GTX1060</td>
                                <th>메모리용량</th>
                                <td>6GB</td>
                            </tr>
                            <tr>
                                <th scope="row">연결방식</th>
                                <td>PCI-Express 3.0</td>
                                <th>카드형태</th>
                                <td>일반</td>
                            </tr>
                            <tr>
                                <th scope="row">출력단자</th>
                                <td>DisplayPort x 3개,HDMI x 1개,DVI x 1개</td>
                                <th>쿨러형태</th>
                                <td>히트파이프 + 팬</td>
                            </tr>
                            <tr>
                                <th scope="row">보조전원</th>
                                <td colspan="3">6핀</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- 이용후기 -->
                    <div style="margin-bottom:15px;">
                        <h5>이용후기</h5>
                    </div>
                    <style>
                        div[class^="item-comment__"]{
                            float:left;
                            margin:2px;
                            border:1px solid #ddd;
                            width:32%;
                            height:150px;
                        }
                        .title{
                            height: 24%;
                            border-bottom:1px solid #ddd;
                        }
                        .title > h5{
                            display:inline-block;
                            font-size:0.9em;
                            margin:8px 0 0 20px;
                            padding:0px;
                        }
                        .starry-wrapper{
                            padding:10px;
                            padding-top:18px !important;
                        }
                        .starry{
                            text-align:center;
                            color: darkorchid;
                        }
                        .starry > span{
                            font-size:1.6em;
                        }
                        .starry__score{
                            font-weight: 700;
                            text-align: center;
                        }
                        .starry__score > span{
                            font-size:2.2em;
                        }
                        .bubble{
                            text-align: center;
                            padding:10px;
                            padding-top:24px !important;
                        }
                        .bubble > span{
                            font-weight: 700;
                            font-size:2.2em;
                        }
                        .satisfaction{
                            padding:25px 0 10px 12px;
                            /*display:block;*/
                        }
                        .col-md-3, .col-md-9{
                            padding:0; /* 주의 */
                        }
                        .satisfaction-col > span{
                            font-size:0.7em;
                            margin-bottom:1px;
                            display:block;
                        }
                        div[class^="satisfaction-comment-item__"]{
                            display:block;
                            margin:5px 0 5px 0;
                        }
                        .satisfaction-comment > span{
                            font-size:0.8em;
                        }
                        /*.satisfaction-comment-item__profile{*/
                            /*display:block;*/
                        /*}*/
                        .satisfaction-comment-item__profile > span{
                            font-size:0.7em;
                        }
                        .satisfaction-comment-item__profile > span > i{  /* Stars */
                            color: darkorchid;
                        }
                        .satisfaction-comment-item__title > span{
                            font-size:0.9em;
                            font-weight:700;
                        }
                        .satisfaction-comment-item__detail > span{
                            font-size:0.8em;
                        }
                    </style>

                    <div id="item-comment" class="container" style="width:80%; min-height:300px; margin-bottom:27px;">
                        <!-- Wrapper -->
                        <div class="item-comment-wrapper" style="display:block; width:100%;">
                            <!-- 별 -->
                            <div class="item-comment__star">
                                <div class="title">
                                    <h5>전체 만족도</h5>
                                </div>
                                <div class="starry-wrapper">
                                    <div class="starry">
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                        <span><i class="fas fa-star"></i></span>
                                    </div>
                                    <div class="starry__score">
                                        <span>5 / 5</span>
                                    </div>
                                </div>
                            </div>
                            <!-- 이용후기 수 -->
                            <div class="item-comment__total">
                                <div class="title">
                                    <h5>전체 이용후기 수</h5>
                                    <div class="bubble">
                                        <span style="font-size:2.6em;"><i class="far fa-comment-dots"></i></span><br>
                                        <span class="bubble__amount" style="line-height: 45px;">25</span>
                                    </div>
                                </div>
                            </div>
                            <!-- 분포 -->
                            <div class="item-comment__dist">
                                <div class="title" style="margin:0 auto;">
                                    <h5>만족도별 분포</h5>
                                    <div class="satisfaction">
                                        <div class="satisfaction-col col-md-3" style="float:left;">
                                            <span>매우 만족</span>
                                            <span>만족</span>
                                            <span>보통</span>
                                            <span>불만족</span>
                                            <span>매우 불만족</span>
                                        </div>
                                        <div class="satisfaction-col col-md-9" style="float:left;">
                                            <!-- 임시용 -->
                                            <% for(int k = 0; k < 5; k++){ %>
                                            <span style="border:1px solid #5d5d5d; margin-left:5px; margin-right:10px; margin-bottom:3px; height:14px;"></span>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br><br><br><br><br><br><br><!-- 주의 -->
                        <!-- 코멘트 -->
                        <div class="satisfaction-comment-wrapper" style="display:block;">
                            <div class="satisfaction-comment" style="border-bottom:2px solid #5d5d5d; padding-bottom:5px; margin-bottom:5px;">
                                &nbsp;<span>전체(29) | 일반(20) | 프리미엄(9)</span>
                            </div>
                            <% for(int i = 0; i< 5; i++){%>
                            <div class="satisfaction-comment-item" style="min-height:90px; border-bottom:1px solid #ddd; padding-left:7px;">
                                <div class="satisfaction-comment-item__profile">
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="fas fa-star"></i></span>
                                    <span><i class="fas fa-star"></i></span>
                                    <span style="font-weight: 700;">5</span>
                                </div>
                                <div class="satisfaction-comment-item__title">
                                    <span>야옹</span>
                                </div>
                                <div class="satisfaction-comment-item__detail">
                                    <span>야옹</span>
                                </div>
                            </div>
                            <% } %>
                            <br> <!-- 주의 -->
                            <div class="text-center">
                                <span style="font-size:0.8em; font-weight:700;">1  2  3  4  5  6  7</span>
                            </div>
                        </div>
                    </div>
                    <!-- 뉴스 / 리뷰 -->
                    <div style="margin-bottom:15px;">
                        <h5>뉴스 / 리뷰</h5>
                    </div>
                    <div id="item-review" class="container text-center" style="height:300px; padding-top:90px;"> <!-- 주의 -->
                        <h1><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;등록된 리뷰가 없습니다</h1>
                        <button class="btn btn-outline-secondary">리뷰 등록하기</button>
                    </div>
                    <!-- 질문 / 답변 -->
                    <div style="margin-bottom:15px;">
                        <h5>질문 / 답변</h5>
                    </div>
                    <div id="item-qna" class="container text-center" style="height:300px; padding-top:90px;"> <!-- 주의 -->
                        <h1><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;등록된 Q&A가 없습니다</h1>
                        <button class="btn btn-outline-secondary">질문하기</button>
                    </div>
                    <!-- 배송 / 환불 / 교환 -->
                    <div style="margin-bottom:15px;">
                        <h5>배송 / 환불 / 교환규정</h5>
                    </div>
                    <div id="item-refund" class="container" style="height:300px;">

                    </div>
                </div>
            </div>
        </div>
        <%@include file="layout/hikoco_footer.jsp"%>
    </div>
</body>
<script>
    $(document).ready(function() {
        $("#itemAmount").keydown(function (e) {
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                // Allow: Ctrl/cmd+A
                (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                // Allow: Ctrl/cmd+C
                (e.keyCode == 67 && (e.ctrlKey === true || e.metaKey === true)) ||
                // Allow: Ctrl/cmd+X
                (e.keyCode == 88 && (e.ctrlKey === true || e.metaKey === true)) ||
                // Allow: home, end, left, right
                (e.keyCode >= 35 && e.keyCode <= 39)) {
                // let it happen, don't do anything
                return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
            // if(e.keyCode == 48){
            //     e.preventDefault();
            //     alert('1 이상의 값을 입력해주세요.');
            //     document.getElementById("itemAmount").value = 1;
            // }
        });
    });
    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            document.getElementById("myBtn").style.display = "block";
        } else {
            document.getElementById("myBtn").style.display = "none";
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }
</script>
</html>
