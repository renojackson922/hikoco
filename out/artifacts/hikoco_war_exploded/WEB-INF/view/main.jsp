<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html ng-cloak ng-app="app">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HIKOCO :: MAIN</title>
    <!-- MAIN화면 전용 CSS -->
    <link rel="stylesheet" href="../../resources/script/main.css">
    <%@ include file="./essential/base.jsp" %>
    <script>
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

        var app = angular.module('app', ['timer']);

        // 다른 도메인의 소스 불러오기 필터
        app.filter('trustUrl', function ($sce) {
            return function (url) {
                return $sce.trustAsResourceUrl(url);
            }
        });

        app.controller('ctrl', function ($scope, $http, $interval, $timeout) {
            $scope.hide = 0;

            $scope.hideAndSeek = function () {
                $scope.hide = 1;
            }

            $scope.hideAndSeekDisabled = function () {
                $scope.hide = 0;
            }
        });
    </script>
    <script>
        window.sr = ScrollReveal();
    </script>
</head>
<%--ng-click="hideAndSeekDisabled(); lockBodyScroll={overflow:'scroll'}"--%>
<body ng-controller="ctrl" ng-style="lockBodyScroll">
<%@ include file="layout/hikoco_login_popup.jsp" %>
<!-- 고정 Footer 간의 간격 -->
<div id="show" style="padding-bottom:170px;">
    <!-- navbar -->
    <%@ include file="layout/hikoco_navbar.jsp" %>
    <!-- section 1 -->
    <section id="hikoco-sec1">
        <div class="hikoco-sec1-div">
            <div class="col-md-6" style="float:left;"></div>
            <div class="col-md-6" style="float:left;">
                <!-- 찰스형 애니메이션 부분 , fadeInUp -->
                <div class="animated"
                     style="position:absolute; width:300px; height:90px; right:150px; top:180px; background-color: rgba(0,0,0,0.5); padding:15px; ">
            <span class="hikoco-sec1-span"
                  style="font-size:1.3em; display:block; line-height: 30px;"><i>최상의 게이밍 성능</i></span>
                    <div class="text-right">
                        <span class="hikoco-sec1-span" style="font-size:1.0em; display:block; line-height: 30px;"><i>- Charles Hoskinson</i></span>
                    </div>
                </div>
                <div class="animated"
                     style="position:absolute; width:300px; height:150px; right:150px; top:280px; background-color:#000; padding:20px;">
                    <span class="hikoco-sec1-span" style="font-size:1.0em; line-height: 20px;">AMD</span>
                    <span class="hikoco-sec1-span" style="font-size:1.8em; display:block; line-height: 30px;"><strong>Radeon&#174; RX580</strong></span>
                    <span class="hikoco-sec1-span" style="font-size:1.2em; display:block; line-height: 40px;">&#8361;&nbsp;300,000 부터</span>
                    <div class="text-right">
                        <a href="#"><span style="font-size:0.8em; line-height:40px;">지금 구매하기</span></a>
                    </div>
                </div>
            </div>
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
                    <h2>아이템이 없습니다.</h2>
                    <a class="btn btn-warning" href="#">등록하기</a>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="i" items="${cntRyzen}">
                    <div class="jcarousel-wrapper">
                        <div class="jcarousel">
                            <ul class="jcarousel-ul">
                                <li>
                                    <figure class="jcarousel-item text-center unselectable"
                                            onclick="window.location.href='/item_detail.do?item_id=${i.item_id}'">
                                            <%-- 참고: https://getbootstrap.com/docs/4.1/content/images/--%>
                                        <img class="mx-auto" src="${i.item_pic}" width="200px" height="auto" alt>
                                        <figcaption>
                                            <div style="padding-bottom:7px; ">
                                                <span style="font-size:8px;">${i.item_manu}</span><br>
                                                <span style="font-size:0.8em;"><strong>${i.item_title}</strong></span>
                                            </div>
                                            <hr class="item-hr">
                                            <div style="padding-top:7px;">
                                                <span style="font-size:1.1em;"><strong><fmt:formatNumber
                                                        value="${i.item_price}" type="currency"
                                                        currencySymbol=""/>원</strong></span>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </li>
                            </ul>
                        </div>
                        <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
                        <a href="#" class="jcarousel-control-next">&rsaquo;</a>
                        <p class="jcarousel-pagination"></p>
                    </div>
                </c:forEach>
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
            <div class="list-right">
                <ul class="list-ul">
                    <c:forEach var="i" items="${cntRyzen}">
                        <li class="list-action unselectable"
                            onclick="window.location.href='item_detail.do?item_id=${i.item_id}'"> <!-- TEST -->
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
            <div class="list-left" style="margin-left:17px;"> <!-- NEED TO BE FIXED -->
                <ul class="list-ul__left">
                    <c:forEach var="i" items="${cntVega}">
                        <li class="list-action unselectable"
                            onclick="window.location.href='item_detail.do?item_id=${i.item_id}'">
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
                            onclick="window.location.href='item_detail.do?item_id=${i.item_id}'">
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
        </div>
    </section>
    <section id="hikoco-sec5">
        <%--<div style="height:50px; background-color:#ddd; line-height:50px; padding-left:20px; ">--%>
        <%--<span style="font-size:24px;">Hot-Selling</span>--%>
        <%--</div>--%>
    </section>
    <%@include file="layout/hikoco_footer.jsp" %>
</div>
</body>

<script>;
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
    document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0)';
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
        document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0)';
    }
}
</script>
</html>