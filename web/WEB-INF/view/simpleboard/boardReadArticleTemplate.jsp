<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>실크독 심플보드</title>
    <%@ include file="../essential/base.jsp"%>
    <%--<link href="../../../resources/script/ghostcss.css" rel="stylesheet">--%>
    <style>
        .main-banner-nav__button{
            font-size:1.5rem;
            color:#5d5d5d;
            margin-left:5px;
            margin-right: 5px;
        }
        #navbar-gohome:hover{
            color:greenyellow;
        }
        .table td, .table th{
            vertical-align:middle;
            font-size: 0.8rem;
            /*font-size: 0.8rem;*/
            /*width: 25px!important;*/
            /*height: 20px !important;*/
            padding: 1em;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .table thead th, .table thead td{
            /*background: #e7e7e7;*/
            /*background: rgba(220,20,60,0.7);*/
            /*color: #*/
        }
        td > a{
            text-decoration: none;
            color:#5d5d5d;
        }
        td > a:hover{
            text-decoration: none;
            color:#ccc;
        }
        select, option{
            font-size: 0.8rem !important;
            padding:0 !important;
            max-height:2em !important;
        }
        /* 모바일 뷰 */
        @media screen and (min-width: 0px) and (max-width: 767px) {
            /*html, body{*/
                /*margin: initial;*/
                /*width:100%;*/
            /*}*/
            body{
                width:100%;
            }
            #view-wrapper {}
            .table-view, #menu-view{
                padding:0 !important;
            }
            #menu-view{
                position: absolute;
                visibility: hidden;
                overflow: hidden;
            }
            .pc-only{
                position: absolute;
                visibility: hidden;
                overflow: hidden;
            }
            .mobile-only{
                visibility: visible;
                overflow: initial;
            }
            #main-banner{
                height: 60px !important;
            }
            #main-banner__first{
                font-size: 2.5rem;
            }
            #main-banner__last {
                font-size: 0.85rem;
            }
            .bottom-wrapper{
                margin-top: 50px !important;
            }
        }
        /* 데스크탑 뷰 */
        @media screen and (min-width: 768px) and (max-width: 3000px) {
            body{
                width:70%;
                margin:0 auto;
            }
            /*html, body{*/
                /*margin:0 auto;*/
                /*padding:0;*/
                /*width:1000px;*/
            /*}*/

            #view-wrapper {}
            #menu-view{
                visibility: visible;
                overflow: initial;
            }
            .pc-only{
                visibility: visible;
                overflow: initial;
            }
            .mobile-only{
                position: absolute;
                visibility: hidden;
                overflow: hidden;
            }
            #vertical-scrollBtn{
                display:none !important;
            }
            #main-banner{
                height: 100px !important;
            }
            #main-banner__first{
                font-size: 3.0rem;
            }
            #main-banner__last {
                font-size: 1.0rem;
            }
            .bottom-wrapper{
                margin-top: 200px !important;
            }
        }
        .search_module{
            padding-top:30px;
        }
        .number_module > span{
            font-size:0.8rem;
        }
        #vertical-scrollBtn{
            display: block;
            /*display: none;*/
            position: fixed;
            top: 5px;
            right: 5px;
            z-index: 9999;
            font-size: 16px;
            border: none;
            outline: none;
            background-color: #969696;
            color: white;
            cursor: pointer;
            padding: 10px;
            border-radius: 4px;
        }
        #vertical-scrollBtn:hover{
            background-color: #555;
        }
        .col-md-2, .col-md-10{
            padding:0 15px 0 0;
        }
        .col-md-3, .col-md-9{
            padding:0 15px 0 0;
        }
        .list-group-item{
            font-size: 0.75rem;
        }
        .list-group-item:first-child{
            border-top-right-radius: 0px;
            border-top-left-radius: 0px;
        }
        .list-group-item:last-child{
            border-bottom-right-radius: 0px;
            border-bottom-left-radius: 0px;
        }
        .list-menu, .list-menu-selected{
            -moz-user-select: -moz-none;
            -khtml-user-select: none;
            -webkit-user-select: none;
            -o-user-select: none;
            user-select: none;
        }
        .list-menu:hover{
            background: #ddd;
        }
        .list-menu-selected{
            background: #5d5d5d;
            color:#fff;
        }
        #menu-view-verticalScroll{
            display: none;
            position: absolute;
            z-index: 10000;
            padding:0 !important;
        }
        ul[id^="list-filter-vert"]{
            margin:0;
            padding:0;
        }
        #list-filter-vert__close:hover{
            color: #a10f2c !important;
        }
        .slideInLeft {
            -webkit-animation-name: slideInLeft;
            animation-name: slideInLeft;
            -webkit-animation-duration: 0.5s;
            animation-duration: 0.5s;
        }
        .slideOutLeft {
            -webkit-animation-name: slideInLeft;
            animation-name: slideInLeft;
            -webkit-animation-duration: 0.5s;
            animation-duration: 0.5s;
        }
        #times:focus, #times:hover{
            text-decoration: none;
        }
        #login-module__idnick{
            padding:10px 5px 5px 5px;
        }
        #login-module__idnick > span{
            font-size:0.8rem;
            display:block;
        }
        #login-module__progress{
            padding:2px 5px;
        }
        #login-module__progress > .progress > .progress-bar{
            background-color: crimson !important;
            font-size:0.7rem !important;
        }
        #login-module__motto{
            padding:2px 5px 5px 5px;
        }
        #login-module__motto > p{
            font-size:0.75rem;
            line-height: 15px;
            margin-top:3px;
            margin-bottom:3px;
        }
        #login-module__menu > button{
            font-size:0.75rem;
            border-radius: 0px;
        }
        .login-module__idnick__icon{
            margin-bottom:2px;
        }
    </style>
    <script>
        var category = function(){
            var url = new URL(window.location.href);
            return url.pathname.split("/c")[1].split("/p")[0];
        };
        console.log(category());

        var tmp = 0, tmpNum = 0;

        $(function(){
            $('#list-filter1 .list-menu').each(function(){
                if($(this).attr('data-value') == category) {
                    $(this).removeClass('list-menu').addClass('list-menu-selected');
                    tmp = $(this).text();
                    tmpNum = $(this).attr('data-value');
                }
            });

            $('#list-filter2 .list-menu').each(function(){
                if($(this).attr('data-value') == category) {
                    $(this).removeClass('list-menu').addClass('list-menu-selected');
                    tmp = $(this).text();
                    tmpNum = $(this).attr('data-value');

                }
            });

            $('#list-filter3 .list-menu').each(function(){
                if($(this).attr('data-value') == category) {
                    $(this).removeClass('list-menu').addClass('list-menu-selected');
                    tmp = $(this).text();
                    tmpNum = $(this).attr('data-value');

                }
            });

            $('#list-filter-vert1 .list-menu').each(function(){
                if($(this).attr('data-value') == category) {
                    $(this).removeClass('list-menu').addClass('list-menu-selected');
                    tmp = $(this).text();
                    tmpNum = $(this).attr('data-value');
                }
            });

            $('#list-filter-vert2 .list-menu').each(function(){
                if($(this).attr('data-value') == category) {
                    $(this).removeClass('list-menu').addClass('list-menu-selected');
                    tmp = $(this).text();
                    tmpNum = $(this).attr('data-value');

                }
            });

            $('#list-filter-vert3 .list-menu').each(function(){
                if($(this).attr('data-value') == category) {
                    $(this).removeClass('list-menu').addClass('list-menu-selected');
                    tmp = $(this).text();
                    tmpNum = $(this).attr('data-value');

                }
            });

            if(tmpNum == 6){
                $('.board-banner-img').attr('src', '../../../resources/imgs/overwatch_ge.jpg');
            }else if(tmpNum == 7){
                $('.board-banner-img').attr('src', '../../../resources/imgs/mhw_ge.jpg');
            }else if(tmpNum == 8){
                $('.board-banner-img').attr('src', '../../../resources/imgs/lol_ge.jpg');
            }else if(tmpNum == 9){

            }

            console.log(tmp + ' / ' + tmpNum)

            // history.pushState(null, null, location.href);
            // window.onpopstate = function(event) {
            //     history.go(1);
            // };
            $('#board-name').text(tmp);
        });

        function moveByRef(data){
            var idx = data.getAttribute('data-value');
            window.location.replace('/board/c' + idx);
        }

        // When the user scrolls down 20px from the top of the document, show the button
        // window.onscroll = function() {scrollFunction()};
        //
        // function scrollFunction() {
        //     if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
        //         document.getElementById("myBtn").style.display = "block";
        //     } else {
        //         document.getElementById("myBtn").style.display = "none";
        //     }
        // }
        //
        // // When the user clicks on the button, scroll to the top of the document
        // function topFunction() {
        //     document.body.scrollTop = 0;
        //     document.documentElement.scrollTop = 0;
        // }

        $.wait = function(ms) {
            var defer = $.Deferred();
            setTimeout(function() { defer.resolve(); }, ms);
            return defer;
        };

        function verticalScrollMenu(){
            $('#menu-view-verticalScroll').removeClass('slideOutLeft').addClass('slideInLeft');
            function doTask(){
                document.getElementById("shadow").style.display = "block";
                document.getElementById("menu-view-verticalScroll").style.display = "block";
                document.getElementById("vertical-scrollBtn").style.display = "none";
                // document.getElementById("mobile-scroll-prevent").style.overflowY = "hidden";
            }
            $.wait(10).then(doTask);
        }

        function verticalScrollRestore(){
            $('#menu-view-verticalScroll').removeClass('slideInLeft').addClass('slideOutLeft');
            function doTask() {
                document.getElementById("shadow").style.display = "none";
                document.getElementById("menu-view-verticalScroll").style.display = "none";
                document.getElementById("vertical-scrollBtn").style.display = "block";
                // document.getElementById("mobile-scroll-prevent").style.overflowY = "initial";
            }
            $.wait(10).then(doTask);
        }

    </script>
</head>
<body>
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
    </ul>
    <ul id="list-filter-vert3" class="list-group">
        <div class="text-center" style="padding:10px 0 5px;">
            <span style="font-size:1rem; color:#fff;">투데이윾머</span>
        </div>
        <li class="list-group-item list-menu" data-value="10" onclick="moveByRef(this)">윾게</li>
        <li class="list-group-item list-menu" data-value="11" onclick="moveByRef(this)">스게</li>
        <li class="list-group-item list-menu" data-value="12" onclick="moveByRef(this)">만세a</li>
    </ul>
    <%--<ul id="list-filter-vert4" class="list-group">--%>
    <%--<div class="text-center" style="padding:10px 0 5px;">--%>
    <%--<span style="font-size:1rem; color:#fff;">임시게시판</span>--%>
    <%--</div>--%>
    <%--<c:forEach begin="13" end="19" var="i">--%>
    <%--<li class="list-group-item list-menu" data-value="${i}" onclick="moveByRef(this)">임시${i}</li>--%>
    <%--</c:forEach>--%>
    <%--</ul>--%>
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
<div id="pc-whole-wrapper" style="padding-top:50px;">
    <div id="main-banner" class="text-center" style="height:100px; margin-bottom:30px;">
        <span id="main-banner__first" style="font-weight:300; display:block">실크독 심플보드</span>
        <span id="main-banner__last" style="font-weight:300; line-height:0px;">Silkdog Simpleboard</span>
        <div id="main-banner-nav" class="text-left">
            <a class="main-banner-nav__button" href="/board" title="심플보드 메인화면"><i class="fas fa-paw" style="color:deepskyblue;"></i></a>
            <a id="navbar-gohome" class="main-banner-nav__button" href="/" title="실크독 사이트로 돌아가기"><i class="fas fa-arrow-alt-circle-left"></i></a> <!--Cafe HIKOCO-->
        </div>
    </div>
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
                        <img id="login-module-avatar" src="../../../resources/imgs/margarette.png" width="100%" height="" class="mx-auto d-block">
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
        <%@include file="./readArticle.jsp"%>

    </div><!-- End of view-wrapper-->
    <div class="bottom-wrapper" style="margin-top:200px; height:200px;">
        <div class="bottom-footer text-center" style="background:#111; height:100%; width:100%; padding-top:50px;">
            <img src="../../../resources/imgs/silkdog.png" width="170px" style="display:inline-block;">
            <span style="font-size:1.0rem; color:#fff; display:block;">SILKDOG 2016 - 2018</span>
        </div>
    </div>
</div>
</body>
<script>
    /*
    $(function(){
        var jqxhr = $.getJSON('../../../resources/json/board_category.json', function() {
            console.log( "success" );
        }).done(function() {
            console.log( "second success" );
        }).fail(function() {
            console.log( "error" );
        }).always(function() {
            console.log( "complete" );
        });

        // Perform other work here ...
        console.log(jqxhr.responseText);
        // Set another completion function for the request above
    });
    // var data = $.getJSON('../../../resources/json/board_category.json');
    // var aka = array[category()-1].aka;
    // console.log(array[1].aka);
    // console.log(aka);
    */
</script>
<script>
    var width = $(window).width();
    var height = $(window).height();
    $(window).on('resize', function(){
        if($(this).width() != width){
            // width = $(this).width();
            // console.log(width);
            var localTmpWidth = $('#login-module-avatar').width();
            $('#login-module-avatar').attr('height', localTmpWidth + "px");
        }
    });
    $(window).on('resize load', function(){
        $('#pc-whole-wrapper').css('height', (height * 0.8) );
    });
</script>
</html>
