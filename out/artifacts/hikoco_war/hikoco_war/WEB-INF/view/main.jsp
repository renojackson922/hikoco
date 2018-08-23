<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html ng-cloak ng-app="app">
<head>
    <title>HIKOCO :: MAIN</title>
    <!-- MAIN 화면 전용 CSS -->
    <link rel="stylesheet" href="../../resources/script/main.css">
    <%@ include file="./essential/base.jsp" %>
    <script type="text/javascript">
        (function ($) {
            $(function () {
                var jcarousel = $('.jcarousel');
                jcarousel
                    .on('jcarousel:reload jcarousel:create', function () {
                        var carousel = $(this),
                            width = carousel.innerWidth();

                        if (width >= 600) {
                            width = width / 6; // 6
                        } else if (width >= 350) {
                            width = width / 5;  // 5
                        }

                        /* .jcarousel-ul > li 에 margin-right 를 20만큼 줬기 때문에 -20 만큼 연산함 */
                        carousel.jcarousel('items').css('width', Math.ceil(width) - 20 + 'px');
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

        var app = angular.module('app', []);

        // 다른 도메인의 소스 불러오기 필터
        app.filter('trustUrl', function ($sce) {
            return function (url) {
                return $sce.trustAsResourceUrl(url);
            }
        });

        app.controller('ctrl', function ($scope, $http, $interval, $timeout) {});
    </script>
</head>
<body ng-controller="ctrl">
<!-- 고정 Footer 간의 간격 -->
<div id="show">
    <!-- navbar -->
    <%@ include file="layout/hikoco_navbar.jsp" %>
    <!-- section 1 -->
    <style>
        .hikoco-sec1-title > span{
            display: inline-block;
            margin-bottom:10px;
        }
        .hikoco-noitem{
            font-weight:400;
            padding-bottom:9px !important;
        }
    </style>
    <section id="hikoco-sec1">
        <div class="hikoco-sec1-div">
            <div class="hikoco-sec1-title col-md-8 offset-md-2 text-right" style="padding:200px 0">
                <span id="catchphrase" style="font-size:3.0em; color:#fff; font-weight:400;
                background: rgb(118,185,0); padding:0 15px 0 20px; letter-spacing: 2px;">GEFORCE RTX™</span><br>
                <span style="font-size:1.5em; color:#fff; font-weight:200;
                background: rgb(118,185,0); padding:0 15px 0 15px;letter-spacing: 3px;">GRAPHICS REINVENTED</span><br>
                <span style="font-size:1.2em; color:#fff; font-weight:200;
                background: rgb(118,185,0); padding:0 15px 0 15px;letter-spacing: 2px;">PRE-ORDER NOW</span>
            </div>
            <%--
            <div class="hikoco-sec1-title col-md-8 offset-md-2 text-center" style="padding:200px 0">
                <span style="font-size:3.0em; color:#fff; font-weight:200;
                background: rgba(0,0,0,0.7); padding:0 15px 0 15px;">번개는 항상 두 번 친다!</span><br>
                <span style="font-size:1.5em; color:#fff; font-weight:200;
                background: rgba(0,0,0,0.7); padding:0 15px 0 15px;">Lightning CAN strike twice!</span><br>
                <span style="font-size:1.2em; color:#fff; font-weight:200;
                background: rgba(0,0,0,0.7); padding:0 15px 0 15px;">"The coin? You used me for THE COIN!?"</span>
            </div>
            --%>
        </div>
    </section>

    <!-- section 2 -->
    <section id="hikoco-sec2">
        <!-- Small Title -->
        <div class="text-left"
             style="height:100px; background-color:#ddd; line-height:50px; margin:0 20px 0 20px; padding:25px 0 0 25px; ">
            <span style="font-size:1.5em; font-weight:200;">BESTSELLER</span>
        </div>

        <%--<h1>${cntRyzen}</h1>--%>
        <!-- cntRyzen eq '[]' 는 임시방편. 갯수를 컨트롤러에서 받아오는 방법으로 수정할 것 -->
        <c:choose>
            <c:when test="${cntRyzen eq '[]'}">
                <div class="text-center" style="height:300px; padding:100px 0;">
                    <h2 class="hikoco-noitem">아이템이 없습니다.</h2>
                    <a class="btn btn-warning" href="#">등록하기</a>
                </div>
            </c:when>
            <c:otherwise>
                <div class="jcarousel-wrapper">
                    <div class="jcarousel">
                        <ul class="jcarousel-ul">
                            <c:forEach var="i" items="${cntRyzen}">
                                <li class="unselectable" onclick="window.location.href='item/${i.item_id}'" style="padding:0 !important;">
                                    <figure>
                                        <div style="height:90% !important; padding:10px;"> <!--padding:20px 25px 5px 25px; -->
                                            <img class="center" src="${i.item_pic}"
                                                 style="margin-bottom:10px; height:200px; width:200px;">
                                            <figcaption> <!-- 임시적 높이 조정 -->
                                                <p style="margin-bottom:0px; font-size:0.7em; font-weight:700; padding-bottom:5px;">${i.item_title}</p>
                                                    <%--<hr class="item-hr">--%>
                                                <p style="font-size:0.6em; color:#5d5d5d; text-align:left; font-weight:400;">${i.item_summary}</p>
                                            </figcaption>
                                        </div>
                                        <div style="height:10% !important; border-top:1px solid #ddd; padding:5px;">
                                            <figcaption>
                                                <%-- 판매가격 --%>
                                                <div style="float:left;padding-right:5px;">
                                                    <span style="font-size:0.6em; font-weight:400; color:crimson;">판매가격</span>
                                                </div>
                                                <%-- 가격 --%>
                                                <div style="float:left;">
                                                    <span style="font-size:1.0em; font-weight:400;"><strong><fmt:formatNumber
                                                    value="${i.item_price}" type="currency"
                                                    currencySymbol=""/>원</strong></span>
                                                </div>
                                                    <%--<div class="text-right" style=" vertical-align: middle;">--%>
                                                    <%--<span style="font-size:12px; border:1px solid #428bca; background: #428bca; color:#fff; padding:0 5px 0 5px; border-radius:4px;">MD추천</span>--%>
                                                    <%--</div>--%>
                                            </figcaption>
                                        </div>
                                    </figure>
                                </li>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${cntRyzen.size() > 6}"></c:when>
                                <c:otherwise>
                                    <c:forEach var="j" begin="1" end="${6 - cntRyzen.size()}">
                                        <li>
                                            <figure class="jcarousel-item text-center unselectable" style="padding:150px 0;">
                                                <i class="fas fa-coffee" style="color:#ddd; font-size:2.5em;"></i>
                                             </figure>
                                        </li>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                    <c:choose>
                        <c:when test="${cntRyzen.size() > 6}">
                            <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
                            <a href="#" class="jcarousel-control-next">&rsaquo;</a>
                            <p class="jcarousel-pagination"></p>
                        </c:when>
                        <c:otherwise></c:otherwise>
                    </c:choose>
                </div>

            </c:otherwise>
        </c:choose>


    </section>

    <!-- section 3 -->
    <section id="hikoco-sec3" class="text-center">
        <!-- Small Title -->
        <div class="text-left"
             style="height:100px; background-color:#ddd; line-height:50px; margin:0 20px 0 20px; padding:25px 0 0 25px; ">
            <span style="font-size:1.5em; font-weight:200; ">CPU Special Offer</span>
        </div>
        <!-- Intro -->
        <div class="hikoco-sec3-intro">
            <div class="hikoco-sec3-intro-opaque">
                <div class="intro-table">
                    <div class="intro-cell">
                        <div class="intro-box" style="display:inline-block">
                            <h1 style="letter-spacing: 2px; font-weight: 200; border:1px solid #000; display:inline-block; padding:5px 17px 5px 17px; background: crimson;">
                                EXTREME GAMING ENV.</h1>
                            <img src="../../resources/imgs/ryzen-logo-white.png" width="200px"
                                 style="padding-left:57px;">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Item List -->
        <div class="sec3-wrapper container" style="display:inline-block; padding:17px 0 17px 0; width:100%">
            <c:choose>
                <c:when test="${cntRyzen eq '[]'}">
                    <div class="text-center" style="height:300px; padding:100px 0;">
                        <h2 class="hikoco-noitem">Ryzen과(와) 관련된 아이템이 없습니다.</h2>
                        <a class="btn btn-warning" href="#">등록하기</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="list-right">
                        <ul class="list-ul">
                            <c:forEach var="i" items="${cntRyzen}">
                                <li class="list-action unselectable"
                                    onclick="window.location.href='item/${i.item_id}'"> <!-- TEST -->
                                    <figure>
                                        <div class="fig-top" style="padding:20px 25px 5px 25px;">
                                            <img class="center" src="${i.item_pic}"
                                                 style="margin-bottom:10px; height:150px; max-width:150px;">
                                            <figcaption style="height:135px;">
                                                <p style="margin-bottom:0px; font-size:14px; font-weight:700; min-height:60px;">${i.item_title}</p>
                                                <hr class="item-hr">
                                                    <%--<p style="margin-bottom:0px; font-size:14px; font-weight:700;">현존 최고의 성능 워크스테이션</p>--%>
                                                <p style="font-size:12px; color:#5d5d5d; text-align:left; font-weight:400;">${i.item_summary}</p>
                                            </figcaption>
                                        </div>
                                        <div class="fig-bottom">
                                            <figcaption>
                                                <div class="text-left" style="float:left;">
                                            <span style="font-size:14px;"><strong><fmt:formatNumber
                                                    value="${i.item_price}" type="currency"
                                                    currencySymbol=""/>원</strong></span>
                                                </div>
                                                <div class="text-right" style=" vertical-align: middle;">
                                                    <span style="font-size:12px; border:1px solid coral; background: coral; color:#fff; padding:0 5px 0 5px; border-radius:4px;">특가</span>
                                                </div>
                                            </figcaption>
                                        </div>
                                    </figure>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </section>

    <!-- section 4 -->
    <section id="hikoco-sec4" class="text-center">
        <!-- Small Title -->
        <div id="hikoco-sec4-profile" class="text-left"
             style="height:100px; background-color:#ddd; margin:0 20px 0 20px; line-height:50px; padding:25px 0 0 25px; ">
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
                                <p style="font-size:2em; font-weight:200; text-align:left; color:#fff; padding-top:15px;">
                                    <strong>DEFY CONVENTION.</strong> Don’t follow. Lead. Choose Radeon RX Vega graphics
                                    & Radeon™ FreeSync technology.</p>
                            </div>
                            <div class="col-md-6" style="display: block; float:left;">
                                <img src="../../resources/imgs/vega64.png" width="100%" alt
                                     style="display:block; opacity: 0.6;">
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
            <c:choose>
                <c:when test="${cntVega eq '[]'}">
                    <div class="text-center" style="height:300px; padding:100px 0;">
                        <h2 class="hikoco-noitem">Vega과(와) 관련된 아이템이 없습니다.</h2>
                        <a class="btn btn-warning" href="#">등록하기</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="list-left" style="margin-left:17px;"> <!-- NEED TO BE FIXED -->
                        <ul class="list-ul__left">
                            <c:forEach var="i" items="${cntVega}">
                                <li class="list-action unselectable"
                                    onclick="window.location.href='item/${i.item_id}'">
                                    <figure>
                                        <div class="fig-top" style="padding:20px 25px 5px 25px;">
                                            <img class="center" src="${i.item_pic}"
                                                 style="margin-bottom:10px; height:200px; width:200px;">
                                            <figcaption style="height:135px;"> <!-- 임시적 높이 조정 -->
                                                <p style="margin-bottom:0px; font-size:0.8em; font-weight:700;">${i.item_title}</p>
                                                <hr class="item-hr">
                                                <p style="font-size:12px; color:#5d5d5d; text-align:left; font-weight:400;">${i.item_summary}</p>
                                            </figcaption>
                                        </div>
                                        <div class="fig-bottom">
                                            <figcaption>
                                                <div class="text-left" style="float:left;">
                                            <span style="font-size:14px;"><strong><fmt:formatNumber
                                                    value="${i.item_price}" type="currency"
                                                    currencySymbol=""/>원</strong></span>
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
                                <li class="list-action unselectable"
                                    onclick="window.location.href='item/${i.item_id}'">
                                    <figure>
                                        <div class="fig-top" style="padding:20px 25px 5px 25px;">
                                            <img class="center" src="${i.item_pic}"
                                                 style="margin-bottom:10px; height:200px; width:200px;">
                                            <figcaption style="height:135px;"> <!-- 임시적 높이 조정 -->
                                                <p style="margin-bottom:0px; font-size:0.8em; font-weight:700;">${i.item_title}</p>
                                                <hr class="item-hr">
                                                <p style="font-size:12px; color:#5d5d5d; text-align:left; font-weight:400;">${i.item_summary}</p>
                                            </figcaption>
                                        </div>
                                        <div class="fig-bottom">
                                            <figcaption>
                                                <div class="text-left" style="float:left;">
                                            <span style="font-size:14px;"><strong><fmt:formatNumber
                                                    value="${i.item_price}" type="currency"
                                                    currencySymbol=""/>원</strong></span>
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
                </c:otherwise>
            </c:choose>
        </div>
    </section>
    <%--<section id="hikoco-sec5">--%>
        <%--&lt;%&ndash;<div style="height:50px; background-color:#ddd; line-height:50px; padding-left:20px; ">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<span style="font-size:24px;">Hot-Selling</span>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
    <%--</section>--%>
    <%@include file="layout/hikoco_footer.jsp" %>
</div>
</body>

<script>
var block = {
    reset: true,
    viewOffset: {top: 64}
}
var container = document.getElementById('hikoco-sec4');
// sr.reveal('.hikoco-sec4-intro', { container : container }, block);  // , block


// When the user scrolls down 20px from the top of the document, change background properties
// CSS 설정을 바꾸기.... 이게 뭐하는건지..
document.addEventListener("DOMContentLoaded", function (event) {
    // document.getElementById('hikoco-nav').style.height = 66;
    document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0.8)';
    // document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0)'; // stormsurge
});

window.onscroll = function () {
    scrollFunction()
};

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
        document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0.8)';
        // document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0)'; // Stormsurge
    }
}
</script>
</html>