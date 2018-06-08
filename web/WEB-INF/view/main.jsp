<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Map<String, Integer> mainHashMap = new HashMap<String, Integer>();
    mainHashMap.put("../../resources/imgs/img1.jpg", 1);
    mainHashMap.put("../../resources/imgs/img2.jpg", 2);
    mainHashMap.put("../../resources/imgs/img3.jpg", 3);
    mainHashMap.put("../../resources/imgs/img4.jpg", 4);
    mainHashMap.put("../../resources/imgs/img5.jpg", 5);
    mainHashMap.put("../../resources/imgs/img6.jpg", 6);

    Map<Integer, String> titleHashMap = new HashMap<Integer, String>();
    titleHashMap.put(1, "RX530");
    titleHashMap.put(2, "RX540");
    titleHashMap.put(3, "RX550");
    titleHashMap.put(4, "RX560");
    titleHashMap.put(5, "RX570");
    titleHashMap.put(6, "RX580");

    Map<Integer, String> detailHashMap = new HashMap<Integer, String>();
    detailHashMap.put(1, "RX시리즈1");
    detailHashMap.put(2, "RX시리즈2");
    detailHashMap.put(3, "RX시리즈3");
    detailHashMap.put(4, "RX시리즈4");
    detailHashMap.put(5, "RX시리즈5");
    detailHashMap.put(6, "RX시리즈6");


    Set<Map.Entry<String, Integer>> set = mainHashMap.entrySet();
    Iterator<Map.Entry<String, Integer>> it = set.iterator();

    Set<Map.Entry<Integer, String>> set2 = titleHashMap.entrySet();
    Iterator<Map.Entry<Integer, String>> it2 = set2.iterator();

    Set<Map.Entry<Integer, String>> set3 = detailHashMap.entrySet();
    Iterator<Map.Entry<Integer, String>> it3 = set3.iterator();

    session.setAttribute("mainHashMap", mainHashMap);
%>
<%
%>
<html ng-cloak ng-app="app">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HIKOCO :: MAIN</title>
    <%@ include file="./essential/script_collection.jsp"%>
    <script>
        (function ($) {
            $(function () {
                var jcarousel = $('.jcarousel');

                jcarousel
                    .on('jcarousel:reload jcarousel:create', function () {
                        var carousel = $(this),
                            width = carousel.innerWidth();

                        if (width >= 600) {
                            width = width / 6;
                        } else if (width >= 350) {
                            width = width / 5;
                        }

                        carousel.jcarousel('items').css('width', Math.ceil(width) + 'px');
                    })
                    .jcarousel({
                        wrap: 'circular'
                    });

                $('.jcarousel-control-prev')
                    .jcarouselControl({
                        target: '-=1'
                    });

                $('.jcarousel-control-next')
                    .jcarouselControl({
                        target: '+=1'
                    });

                $('.jcarousel-pagination')
                    .on('jcarouselpagination:active', 'a', function () {
                        $(this).addClass('active');
                    })
                    .on('jcarouselpagination:inactive', 'a', function () {
                        $(this).removeClass('active');
                    })
                    .on('click', function (e) {
                        e.preventDefault();
                    })
                    .jcarouselPagination({
                        perPage: 1,
                        item: function (page) {
                            return '<a href="#' + page + '">' + page + '</a>';
                        }
                    });

                /* =================================================================================== */

            });
        })(jQuery);
    </script>

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
    <script>
        window.sr = ScrollReveal();
    </script>
    <style>
        html, body{

        }
        .hikoco-sec1-div {
            height: 600px;
            /*background-color: #fff;*/
            background: url("../../resources/imgs/bg1.jpg");
            background-size: cover;
        }
        .hikoco-sec1-span {
            color: #fff;
        }
        .bg {
            background: url("../../resources/imgs/rx580_grande.png");
        }
        .jcarousel-control-next, .jcarousel-control-prev {
            text-decoration: none !important;
        }
        .jcarousel-control-next:hover, .jcarousel-control-prev:hover {
            color: #fff;
        }
        .jcarousel-wrapper{

        }
        #hikoco-sec2, #hikoco-sec3, #hikoco-sec4{
            margin:0 auto;
            padding-top:17px;
            min-width:70%;
            max-width:100%;
        }
    </style>
</head>
<%--ng-click="hideAndSeekDisabled(); lockBodyScroll={overflow:'scroll'}"--%>
<body ng-controller="ctrl" ng-style="lockBodyScroll">
<%@ include file="layout/hikoco_login_popup.jsp" %>
<div id="show">
    <!-- navbar -->
    <%@ include file="layout/hikoco_navbar.jsp" %>
    <!-- section 1 -->
    <section id="hikoco-sec1">
        <div class="hikoco-sec1-div">
            <!-- 찰스형 애니메이션 부분 -->
            <%--<div class="text-left" style="padding-top:30px; padding-left:400px;">--%>
            <%--&lt;%&ndash;<img class="animated fadeInUp" src="../../resources/imgs/rx580_grande.png" style="right:1000px; top:100px;">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div class="bg"></div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<img class="animated fadeInUp" src="../../resources/imgs/radeon-rx580-logo-960x540.png" width="480px">&ndash;%&gt;--%>
            <%--<div class="animated fadeInUp"--%>
            <%--style="position:absolute; width:300px; height:90px; right:150px; top:180px; background-color: rgba(0,0,0,0.5); padding:15px; ">--%>
            <%--<span class="hikoco-sec1-span"--%>
            <%--style="font-size:20px; display:block; line-height: 30px;"><i>최상의 게이밍 성능</i></span>--%>
            <%--<div class="text-right">--%>
            <%--<span class="hikoco-sec1-span" style="font-size:16px; display:block; line-height: 30px;"><i>- Charles Hoskinson</i></span>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--<div class="animated fadeInUp"--%>
            <%--style="position:absolute; width:300px; height:150px; right:150px; top:280px; background-color:#000; padding:20px;">--%>
            <%--<span class="hikoco-sec1-span" style="font-size:16px; line-height: 20px;">AMD</span>--%>
            <%--<span class="hikoco-sec1-span" style="font-size:30px; display:block; line-height: 30px;"><strong>Radeon&#174; RX580</strong></span>--%>
            <%--<span class="hikoco-sec1-span" style="font-size:18px; display:block; line-height: 40px;">&#8361;&nbsp;300,000 부터</span>--%>
            <%--<div class="text-right">--%>
            <%--<a href="#"><span style="font-size:12px; line-height:40px;">지금 구매하기</span></a>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
        </div>
    </section>
    <!-- section 2 -->
    <section id="hikoco-sec2">
        <!-- Small Title -->
        <div class="text-left" style="height:100px; background-color:#ddd; line-height:50px; margin:0 20px 0 20px; padding:25px 0 0 25px; ">
            <span style="font-size:1.5em; font-weight:200;">BESTSELLER</span>
        </div>
        <div style="height:350px;">
            <div class="wrapper">
                <%--<h1>Responsive Carousel</h1>--%>
                <%--<p>This example shows how to implement a responsive carousel. Resize the browser window to see the effect.</p>--%>
                <div class="jcarousel-wrapper">
                    <style>
                        .jcarousel-item:hover{
                            background-color: #ddd;
                        }
                    </style>
                    <div class="jcarousel">
                        <ul>
                            <%
                                Map.Entry<String, Integer> e;
                                Map.Entry<Integer, String> e2;
                                Map.Entry<Integer, String> e3;
                                while (it.hasNext() && it2.hasNext() && it3.hasNext()) {
                            %>
                            <c:forEach var="i" begin="1" end="6" step="1">
                                <%
                                    e = it.next();
                                    e2 = it2.next();
                                    e3 = it3.next();
                                %>
                                <li>
                                    <div class="jcarousel-item text-center unselectable" onclick="window.location.href='/item_detail.do?no=${i}'">
                                        <img src="<%=e.getKey()%>" alt="Image ${i}">
                                        <span style="font-size:8px;">제품 ${i}</span><br>
                                        <span><strong><%=e2.getValue()%></strong></span>
                                        <p><%=e3.getValue()%>
                                        </p>
                                    </div>
                                </li>
                            </c:forEach>
                            <%
                                }
                            %>
                        </ul>
                    </div>

                    <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
                    <a href="#" class="jcarousel-control-next">&rsaquo;</a>

                    <p class="jcarousel-pagination"></p>
                </div>
            </div>
        </div>
    </section>

    <style>
        figure {
            margin-bottom: 0px;
        }

        hr {
            margin: 5px 0px 5px 0px;
        }
        .list-ul{
            /*padding-right:20px;*/
            padding-left:17px;
        }

        .list-ul__left{
            /*padding-right:20px;*/
            /*padding-left:17px;*/
            padding-left:0px;
        }
        .list-ul > li, .list-ul__left > li {
            float: left;
            max-width: 263px;
            min-height: 333px;
            border: 1px solid #ddd;
            display: inline-block !important;
            margin: 0 17px 17px 0;
        }

        .list-group-item:first-child {
            border-top-left-radius: 0em;
            border-top-right-radius: 0em;
        }

        .list-group-item:last-child {
            border-bottom-left-radius: 0em;
            border-bottom-right-radius: 0em;
        }

        .list-action {
            /*width: 100%;*/
            background-color: #fff;
            color: #495057;
            text-align: inherit
        }

        .list-action:focus, .list-action:hover {
            color: #495057;
            text-decoration: none;
            background-color: #f8f9fa
        }

        .list-action:active {
            color: #212529;
            background-color: #e9ecef
        }
        .list-left, .list-right{
            display:inline-block;
            float:left;
            /*overflow:hidden;*/
        }
        .center {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 100%;
        }
        .hikoco-sec3-intro{
            background: #000 url("../../resources/imgs/amd-pinacle.jpg");
            /*background: #000 url("../../resources/imgs/i78700k+ryzen_cropped.png");*/
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            width: auto;
            height: 300px;
            margin-top:17px;
        }
        .hikoco-sec3-intro-opaque{
            width: inherit;
            height: inherit;
            background: rgba(0, 0, 0, 0.5);
        }

        .hikoco-sec4-intro{
            background: #000 url("../../resources/imgs/smoke-hero.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            width: auto;
            height: 500px;
            margin-top:17px;
        }
        .hikoco-sec4-intro-opaque{
            width: inherit;
            height: inherit;
            background: rgba(0, 0, 0, 0.5);
        }
        /* table, table-cell 3단 콤보 */
        .intro-table, .optional-table{
            display:table;
            position:relative;
            width:100%;
            height:inherit;
        }
        .intro-cell, .optional-cell{
            display:table-cell;
            vertical-align:middle;
        }
        .intro-box{
            display:block;
            margin:0 auto;
            padding:10px;
            font-size:12px;
            width: 800px;
        }
        .optional-box{
            display:block;
            margin:0 auto;
            padding:10px;
            font-size:12px;
            width: 300px;
        }

        .intro-box > h1{
            color:#fff;
        }
        .optional-box > h1{
            color:#fff;
        }
        .intro-box > p{
            color:#fff;
            font-size:1.5em;
            display:block;
            margin:0;
            font-weight:300;
        }
        .optional-box > p{
            color:#fff;
            font-size:1.5em;
            display:block;
            margin:0;
            font-weight:300;
        }

        .hikoco-sec3-list-left__img{
            background: url("../../resources/imgs/retriever.png");
            background-repeat: no-repeat;
            background-size: cover;
            background-position-x: -100px !important;
        }

        .hikoco-sec4-list-right__img{
            background: url("../../resources/imgs/ramsay.png");
            background-repeat: no-repeat;
            background-size: cover;
        }
        .opaque__light{
            width: inherit;
            height: inherit;
            background: rgba(0, 0, 0, 0.3);
        }
        .fa-quote-left, .fa-quote-right{
            vertical-align:top;
        }

        #hikoco-sec4{
            background:  url("../../resources/imgs/sticky-shadow-top.png");
            background-size: cover;
        }

    </style>


    <!-- section 3 -->
    <section id="hikoco-sec3" class="text-center">
        <!-- Small Title -->
        <div class="text-left" style="height:100px; background-color:#ddd; line-height:50px; margin:0 20px 0 20px; padding:25px 0 0 25px; ">
            <span style="font-size:1.5em; font-weight:200; ">CPU Special Offer</span>
        </div>
        <!-- Intro -->
        <div class="hikoco-sec3-intro">
            <div class="hikoco-sec3-intro-opaque">
                <div class="intro-table">
                    <div class="intro-cell">
                        <div class="intro-box" style="display:inline-block">
                            <h1 style="letter-spacing: 2px; font-weight: 200; border:1px solid #000; display:inline-block; padding:5px 17px 5px 17px; background: crimson;">EXTREME GAMING ENV.</h1>
                            <img src="../../resources/imgs/ryzen-logo-white.png" width="200px" style="padding-left:57px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Item List -->
        <div class="sec3-wrapper container" style="display:inline-block; padding:17px 0 17px 0; width:100%">
            <%--<div class="list-left" style="min-width:240px; max-width:240px; height:800px; background:#ddd; margin-left:17px;">--%>
            <%--<div class="hikoco-sec3-list-left__img" style="width:inherit; height:inherit;">--%>
            <%--<div class="opaque__light">--%>
            <%--<div class="optional-table">--%>
            <%--<div class="optional-cell">--%>
            <%--<div class="optional-box">--%>
            <%--<p>Unleash<br>               the beast</p>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <div class="list-right">
                <ul class="list-ul">
                    <c:forEach var="i" begin="1" end="2">
                        <c:forEach var="j" begin="1" end="4">
                            <li class="list-action unselectable" onclick="window.location.href='item_detail.do?no=${j}"> <!-- TEST -->
                                <figure>
                                    <div class="fig-top" style="padding:20px 25px 5px 25px;">
                                        <img class="center" src="../../resources/imgs/neogul_thumbnail.png"
                                             style="margin-bottom:10px; height:150px; max-width:150px;">
                                        <figcaption>
                                            <p style="margin-bottom:0px; font-size:14px; font-weight:700;">너굴맨이 해결했으니 안심하라구!</p>
                                            <hr>
                                                <%--<p style="margin-bottom:0px; font-size:14px; font-weight:700;">현존 최고의 성능 워크스테이션</p>--%>
                                            <p style="font-size:12px; color:#5d5d5d; text-align:left; font-weight:400;">인텔 Xeon
                                                E5-2687Wv4 (3.0G) / DDR4 4GB / HDD 미포함 / VGA 미포함 / ODD미포함 / 3.5인치 내부 4Bay / 5.25인치
                                                3Bay / 시리얼포트 / 1000W 파워 / 지원 / 32GB 이상</p>
                                        </figcaption>
                                    </div>
                                    <div class="fig-bottom" style="padding:15px 30px 15px 30px; border-top:1px solid #ddd;">
                                        <figcaption>
                                            <div class="text-left" style="float:left;">
                                                <span style="font-size:14px;"><strong>9,400,270원</strong></span>
                                            </div>
                                            <div class="text-right" style=" vertical-align: middle;">
                                                <span style="font-size:12px; border:1px solid coral; background: coral; color:#fff; padding:0 5px 0 5px; border-radius:4px;">특가</span>
                                            </div>
                                        </figcaption>
                                    </div>
                                </figure>
                            </li>
                        </c:forEach>
                        <br> <!-- HAS TO BE FIXED -->
                    </c:forEach>
                </ul>
            </div>

        </div>

    </section>

    <style>
        #hikoco-sec4-profile{
            background: #000 !important;
        }
    </style>


    <!-- section 4 -->
    <section id="hikoco-sec4" class="text-center">
        <!-- Small Title -->
        <div id="hikoco-sec4-profile" class="text-left" style="height:100px; background-color:#ddd; margin:0 20px 0 20px; line-height:50px; padding:25px 0 0 25px; ">
            <span style="font-size:1.5em; color:#fff; font-weight:200;">AMD Radeon RX Vega 특별 기획전</span>
        </div>
        <!-- Intro -->
        <div class="hikoco-sec4-intro">
            <div class="hikoco-sec4-intro-opaque">
                <div class="intro-table">
                    <div class="intro-cell">
                        <div class="intro-box unselectable">
                            <div class="col-md-6" style="display: block; float:left;">
                                <img src="../../resources/imgs/svg/rxvega.svg" alt style="display:block;">
                                <p style="font-size:2em; font-weight:200; text-align:left; color:#fff; padding-top:15px;"><strong>DEFY CONVENTION.</strong> Don’t follow. Lead. Choose Radeon RX Vega graphics & Radeon™ FreeSync technology.</p>
                            </div>
                            <div class="col-md-6" style="display: block; float:left;">
                                <img src="../../resources/imgs/vega64.png" width="100%" alt style="display:block; opacity: 0.6;">
                            </div>
                            <%--<h1>역습의 람쥐썬더</h1>--%>
                            <%--<p><i class="fas fa-quote-left"></i>&nbsp;람쥐썬더가 올해도 장물을 한아름 짊어지고 찾아왔습니다!</p>--%>
                            <%--<p>아래의 특별히 준비한 특가상품들을 구매하지 않으면 람쥐썬더가 폭력을 행사할 것입니다.&nbsp;<i class="fas fa-quote-right"></i></p>--%>
                            <%--<p style="font-size:2.0em; font-weight:600;">기대해!</p>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Item List; AMD RXVega Special Offer -->
        <div class="sec4-wrapper container" style="display:inline-block; padding:17px 0 17px 0;  width:100%;">
            <div class="list-left" style="margin-left:17px;"> <!-- NEED TO BE FIXED -->
                <ul class="list-ul__left">
                    <c:forEach var="i" items="${cntVega}">
                            <li class="list-action unselectable" onclick="window.location.href='item_detail.do?item_id=${i.item_id}'">
                                <figure>
                                    <div class="fig-top" style="padding:20px 25px 5px 25px;">
                                        <img class="center" src="${i.item_pic}"
                                             style="margin-bottom:10px; height:200px; width:200px;">
                                        <figcaption style="height:135px;"> <!-- 임시적 높이 조정 -->
                                            <p style="margin-bottom:0px; font-size:0.8em; font-weight:700;">${i.item_title}</p>
                                            <hr>
                                            <p style="font-size:12px; color:#5d5d5d; text-align:left; font-weight:400;">${i.item_summary}</p>
                                        </figcaption>
                                    </div>
                                    <div class="fig-bottom" style="padding:15px 30px 15px 30px; border-top:1px solid #ddd;">
                                        <figcaption>
                                            <div class="text-left" style="float:left;">
                                                <span style="font-size:14px;"><strong>${i.item_price}원</strong></span>
                                            </div>
                                            <div class="text-right" style=" vertical-align: middle;">
                                                <span style="font-size:12px; border:1px solid #428bca; background: #428bca; color:#fff; padding:0 5px 0 5px; border-radius:4px;">MD추천</span>
                                            </div>
                                        </figcaption>
                                    </div>
                                </figure>
                            </li>
                    </c:forEach>
                    <c:forEach var="i" items="${cntVega}">
                        <li class="list-action unselectable" onclick="window.location.href='item_detail.do?item_id=${i.item_id}'">
                            <figure>
                                <div class="fig-top" style="padding:20px 25px 5px 25px;">
                                    <img class="center" src="${i.item_pic}"
                                         style="margin-bottom:10px; height:200px; width:200px;">
                                    <figcaption style="height:135px;"> <!-- 임시적 높이 조정 -->
                                        <p style="margin-bottom:0px; font-size:0.8em; font-weight:700;">${i.item_title}</p>
                                        <hr>
                                        <p style="font-size:12px; color:#5d5d5d; text-align:left; font-weight:400;">${i.item_summary}</p>
                                    </figcaption>
                                </div>
                                <div class="fig-bottom" style="padding:15px 30px 15px 30px; border-top:1px solid #ddd;">
                                    <figcaption>
                                        <div class="text-left" style="float:left;">
                                            <span style="font-size:14px;"><strong>${i.item_price}원</strong></span>
                                        </div>
                                        <div class="text-right" style=" vertical-align: middle;">
                                            <span style="font-size:12px; border:1px solid #428bca; background: #428bca; color:#fff; padding:0 5px 0 5px; border-radius:4px;">MD추천</span>
                                        </div>
                                    </figcaption>
                                </div>
                            </figure>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </section>
    <section id="hikoco-sec5">
        <%--<div style="height:50px; background-color:#ddd; line-height:50px; padding-left:20px; ">--%>
        <%--<span style="font-size:24px;">Hot-Selling</span>--%>
        <%--</div>--%>
    </section>
    <%--<%@include file="layout/hikoco_footer.jsp" %>--%>
</div>
</body>

<script>;
var block = {
    reset: true,
    viewOffset: { top: 64 }
}
var container = document.getElementById('hikoco-sec4');
// sr.reveal('.hikoco-sec4-intro', { container : container }, block);  // , block


// When the user scrolls down 20px from the top of the document, change background properties
// CSS 설정을 바꾸기.... 이게 뭐하는건지..
document.addEventListener("DOMContentLoaded", function(event){
    // document.getElementById('hikoco-nav').style.height = 66;
    document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0)';
});

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        // document.getElementById('hikoco-nav').style.height = 66;

        // document.getElementById('hikoco-nav').classList.add('animated');
        // document.getElementById('hikoco-nav').classList.add('fadeIn');
        document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0.8)';
    } else {
        // document.getElementById('hikoco-nav').style.height = 66;
        // document.getElementById('hikoco-nav').classList.add('animated');
        // document.getElementById('hikoco-nav').classList.add('fadeOut');
        document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0)';
    }
}
</script>
</html>