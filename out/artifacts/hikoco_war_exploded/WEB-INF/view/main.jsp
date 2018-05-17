<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HIKOCO :: MAIN</title>
    <!-- Vue.js Development -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- Bootstrap 4.1.1 & jQuery-Slim -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <!-- 주의! animated 를 위해서 slim 이 아닌 uncompressed를 사용했음. 문제를 해결하면 slim 으로 바꿀 것 -->
    <script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    <!-- Load Montstreet Fonts -->
    <link rel="stylesheet" href="/public/css/fonts.css">
    <!-- Font-Awesome -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
    <!-- Underscore.js -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore.js"></script>
    <!-- Animate.css -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"
          integrity="sha384-OHBBOqpYHNsIqQy8hL1U+8OXf9hH6QRxi0+EODezv82DfnZoV7qoHAZDwMwEJvSw"
          crossorigin="anonymous">
    <script src="/public/js/headroom.min.js"></script>
    <!-- Summernote -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
    <!-- jCarousel -->
    <script src="../../resources/js/jquery.jcarousel.min.js"></script>
    <link rel="stylesheet" href="../../resources/script/jcarousel.css">
    <script>
        (function($) {
            $(function() {
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
                    .on('jcarouselpagination:active', 'a', function() {
                        $(this).addClass('active');
                    })
                    .on('jcarouselpagination:inactive', 'a', function() {
                        $(this).removeClass('active');
                    })
                    .on('click', function(e) {
                        e.preventDefault();
                    })
                    .jcarouselPagination({
                        perPage: 1,
                        item: function(page) {
                            return '<a href="#' + page + '">' + page + '</a>';
                        }
                    });

                /* =================================================================================== */



            });
        })(jQuery);
    </script>
</head>
<body>
    <!-- navbar -->
    <!--        -->
    <%@ include file="layout/hikoco_navbar.jsp" %>
    <style>
        .hikoco-sec1-div{
            height: 400px;
            /*background-color: #fff;*/
            background: url("../../resources/imgs/bg1.jpg");
            background-size: cover;
        }
        .hikoco-sec1-span{
            color:#fff;
        }
        .bg{
            background:url("../../resources/imgs/rx580_grande.png");
        }
        .jcarousel-control-next, .jcarousel-control-prev{
            text-decoration: none !important;
        }
        .jcarousel-control-next:hover, .jcarousel-control-prev:hover{
            color:#fff;
        }


    </style>
    <section id="hikoco-sec1" style="z-index:2;">
        <div class="hikoco-sec1-div">
            <div class="text-left" style="padding-top:30px; padding-left:400px;">
                <%--<img class="animated fadeInUp" src="../../resources/imgs/rx580_grande.png" style="right:1000px; top:100px;">--%>
                <%--<div class="bg"></div>--%>
                    <%--<img class="animated fadeInUp" src="../../resources/imgs/radeon-rx580-logo-960x540.png" width="480px">--%>
                <div class="animated fadeInUp" style="position:absolute; width:300px; height:90px; right:150px; top:180px; background-color: rgba(0,0,0,0.5); padding:15px; ">
                    <span class="hikoco-sec1-span" style="font-size:20px; display:block; line-height: 30px;"><i>최상의 게이밍 성능</i></span>
                    <div class="text-right">
                        <span class="hikoco-sec1-span" style="font-size:16px; display:block; line-height: 30px;"><i>- Charles Hoskinson</i></span>
                    </div>
                </div>
                <div class="animated fadeInUp" style="position:absolute; width:300px; height:150px; right:150px; top:280px; background-color:#000; padding:20px;">
                    <span class="hikoco-sec1-span" style="font-size:16px; line-height: 20px;">AMD</span>
                    <span class="hikoco-sec1-span" style="font-size:30px; display:block; line-height: 30px;"><strong>Radeon&#174; RX580</strong></span>
                    <span class="hikoco-sec1-span" style="font-size:18px; display:block; line-height: 40px;">&#8361;&nbsp;300,000 부터</span>
                    <div class="text-right">
                        <a href="#"><span style="font-size:12px; line-height:40px;">지금 구매하기</span></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="hikoco_sec2">
        <div style="height:50px; background-color:#ddd; line-height:50px; padding-left:20px; ">
            <span style="font-size:24px; letter-spacing:2px;">Bestseller</span>
        </div>
        <div style="height:400px;">
            <div class="wrapper">
                <%--<h1>Responsive Carousel</h1>--%>
                <%--<p>This example shows how to implement a responsive carousel. Resize the browser window to see the effect.</p>--%>
                <div class="jcarousel-wrapper">
                    <div class="jcarousel">
                        <ul>
                            <%
                                Map.Entry<String, Integer> e;
                                Map.Entry<Integer, String> e2;
                                Map.Entry<Integer, String> e3;
                                while(it.hasNext() && it2.hasNext() && it3.hasNext()){
                            %>
                            <c:forEach var="i" begin="1" end="6" step="1">
                                <%
                                    e = it.next();
                                    e2 = it2.next();
                                    e3 = it3.next();
                                %>
                                <li>
                                    <div class="text-center">
                                        <img src="<%=e.getKey()%>" alt="Image ${i}">
                                        <span style="font-size:8px;">제품 ${i}</span><br>
                                        <span><strong><%=e2.getValue()%></strong></span>
                                        <p><%=e3.getValue()%></p>
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
    <section id="hikoco_sec3">
        <style>
            table{
                width: 100%;
                /*width: -webkit-fill-available;*/
                width: -moz-available;
            }
            figure{
                text-align:center;
                margin-bottom:0px;
            }
            hr{
                margin:5px 0px 5px 0px;
            }
            .col-md-10{
                padding:0px;
            }
            .list-group-item{
                border-radius:0px !important;
                padding:0px;
                margin-bottom:15px !important;
            }
            td{
                padding-right:15px !important;
            }
            .unselectable {
                -moz-user-select: -moz-none;
                -khtml-user-select: none;
                -webkit-user-select: none;
                -o-user-select: none;
                user-select: none;
            }
        </style>
        <div style="height:50px; background-color:#ddd; line-height:50px; padding-left:20px; ">
            <span style="font-size:24px;">Hot-Selling</span>
        </div>
        <div class="sec3-wrapper" style="display:inline-block;">
            <div class="col-md-2" style="float:left; padding-top:15px;">

            </div>

            <div class="col-md-10" style="float:left; padding-top:15px;">
                <table>
                    <thead>
                        <tr>
                            <%--<ul class="list-group">--%>
                                <% for(int i = 0; i < 5; i++){%>
                                <td>
                                    <li class="list-group-item list-group-item-action unselectable">
                                        <figure>
                                            <div style="padding:20px 30px 5px 30px;">
                                                <img src="../../resources/imgs/neogul.jpg" width="220px" height="220px" style="margin-bottom:10px;">
                                                <figcaption>
                                                    <p style="margin-bottom:0px; font-weight:700;">현존 최고의 성능 워크스테이션</p>
                                                    <p style="font-size:12px; color:#5d5d5d; text-align:left; font-weight:400;">인텔 Xeon E5-2687Wv4 (3.0G) / DDR4 4GB / HDD 미포함 / VGA 미포함 / ODD미포함 / 3.5인치 내부 4Bay / 5.25인치 3Bay / 시리얼포트 / 1000W 파워 / 지원 / 32GB 이상</p>
                                                </figcaption>
                                            </div>
                                            <div style="padding:15px 30px 15px 30px; border-top:1px solid #ddd;">
                                                <figcaption>
                                                    <div class="text-left" style="float:left;">
                                                        <span style="font-size:14px;"><strong>9,400,270원</strong></span>
                                                    </div>
                                                    <div class="text-right">
                                                        <span style="font-size:12px; border:1px solid coral; background: coral; color:#fff; padding:5px; border-radius:4px;">특가</span>
                                                    </div>
                                                </figcaption>
                                            </div>
                                        </figure>
                                    </li>
                                </td>
                                <% } %>
                            <%--</ul>--%>
                        </tr>
                        <tr>
                            <%--<ul class="list-group">--%>
                            <% for(int i = 0; i < 5; i++){%>
                            <td>
                                <li class="list-group-item list-group-item-action unselectable">
                                    <figure>
                                        <div style="padding:20px 30px 5px 30px;">
                                            <img src="../../resources/imgs/neogul.jpg" width="220px" height="220px" style="margin-bottom:10px;">
                                            <figcaption>
                                                <p style="margin-bottom:0px; font-weight:700;">현존 최고의 성능 워크스테이션</p>
                                                <p style="font-size:12px; color:#5d5d5d; text-align:left; font-weight:400;">인텔 Xeon E5-2687Wv4 (3.0G) / DDR4 4GB / HDD 미포함 / VGA 미포함 / ODD미포함 / 3.5인치 내부 4Bay / 5.25인치 3Bay / 시리얼포트 / 1000W 파워 / 지원 / 32GB 이상</p>
                                            </figcaption>
                                        </div>
                                        <div style="padding:15px 30px 15px 30px; border-top:1px solid #ddd;">
                                            <figcaption>
                                                <div class="text-left" style="float:left;">
                                                    <span style="font-size:14px;"><strong>9,400,270원</strong></span>
                                                </div>
                                                <div class="text-right">
                                                    <span style="font-size:12px; border:1px solid coral; background: coral; color:#fff; padding:5px; border-radius:4px;">특가</span>
                                                </div>
                                            </figcaption>
                                        </div>
                                    </figure>
                                </li>
                            </td>
                            <% } %>
                            <%--</ul>--%>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
    </section>
    <section id="hikoco_sec4">
        <div style="height:50px; background-color:#ddd; line-height:50px; padding-left:20px; ">
            <span style="font-size:24px;">Hot-Selling</span>
        </div>
    </section>
</body>

</html>
