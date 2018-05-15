<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <script>
        (function($) {
            $(function() {
                var jcarousel = $('.jcarousel');

                jcarousel
                    .on('jcarousel:reload jcarousel:create', function () {
                        var carousel = $(this),
                            width = carousel.innerWidth();

                        if (width >= 600) {
                            width = width / 3;
                        } else if (width >= 350) {
                            width = width / 2;
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
    </style>
    <style>
        .jcarousel-wrapper {
            margin: 20px auto;
            position: relative;
            border: 10px solid #fff;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border-radius: 5px;
            -webkit-box-shadow: 0 0 2px #999;
            -moz-box-shadow: 0 0 2px #999;
            box-shadow: 0 0 2px #999;
        }

        /** Carousel **/

        .jcarousel {
            position: relative;
            overflow: hidden;
            width: 50%;
        }

        .jcarousel ul {
            width: 10000em;
            position: relative;
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .jcarousel li {
            width: 200px;
            float: left;
            border: 1px solid #fff;
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .jcarousel img {
            display: block;
            max-width: 100%;
            height: auto !important;
        }

        /** Carousel Controls **/

        .jcarousel-control-prev,
        .jcarousel-control-next {
            position: absolute;
            top: 50%;
            margin-top: -15px;
            width: 30px;
            height: 30px;
            text-align: center;
            background: #4E443C;
            color: #fff;
            text-decoration: none;
            text-shadow: 0 0 1px #000;
            font: 24px/27px Arial, sans-serif;
            -webkit-border-radius: 30px;
            -moz-border-radius: 30px;
            border-radius: 30px;
            -webkit-box-shadow: 0 0 4px #F0EFE7;
            -moz-box-shadow: 0 0 4px #F0EFE7;
            box-shadow: 0 0 4px #F0EFE7;
        }

        .jcarousel-control-prev {
            left: 15px;
        }

        .jcarousel-control-next {
            right: 15px;
        }

        /** Carousel Pagination **/

        .jcarousel-pagination {
            position: absolute;
            bottom: -40px;
            left: 50%;
            -webkit-transform: translate(-50%, 0);
            -ms-transform: translate(-50%, 0);
            transform: translate(-50%, 0);
            margin: 0;
        }

        .jcarousel-pagination a {
            text-decoration: none;
            display: inline-block;

            font-size: 11px;
            height: 10px;
            width: 10px;
            line-height: 10px;

            background: #fff;
            color: #4E443C;
            border-radius: 10px;
            text-indent: -9999px;

            margin-right: 7px;


            -webkit-box-shadow: 0 0 2px #4E443C;
            -moz-box-shadow: 0 0 2px #4E443C;
            box-shadow: 0 0 2px #4E443C;
        }

        .jcarousel-pagination a.active {
            background: #4E443C;
            color: #fff;
            opacity: 1;

            -webkit-box-shadow: 0 0 2px #F0EFE7;
            -moz-box-shadow: 0 0 2px #F0EFE7;
            box-shadow: 0 0 2px #F0EFE7;
        }
    </style>
    <section id="hikoco-sec1" style="z-index:2;">
        <div class="hikoco-sec1-div">
            <div class="text-left" style="padding-top:30px; padding-left:400px;">
                <%--<img class="animated fadeInUp" src="../../resources/imgs/rx580_grande.png" style="right:1000px; top:100px;">--%>
                <div class="bg"></div>
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
    <section id="hikoco_sec2" style="z-index:1;">
        <div style="height:50px; background-color:#ddd; line-height:50px; padding-left:20px; ">
            <span style="font-size:24px;">Bestseller</span>
        </div>
        <div style="height:400px;">
            <div class="wrapper">
                <%--<h1>Responsive Carousel</h1>--%>
                <%--<p>This example shows how to implement a responsive carousel. Resize the browser window to see the effect.</p>--%>
                <div class="jcarousel-wrapper">
                    <div class="jcarousel">
                        <ul>
                            <li><img src="../../resources/imgs/img1.jpg" alt="Image 1"></li>
                            <li><img src="../../resources/imgs/img2.jpg" alt="Image 2"></li>
                            <li><img src="../../resources/imgs/img3.jpg" alt="Image 3"></li>
                            <li><img src="../../resources/imgs/img4.jpg" alt="Image 4"></li>
                            <li><img src="../../resources/imgs/img5.jpg" alt="Image 5"></li>
                            <li><img src="../../resources/imgs/img6.jpg" alt="Image 6"></li>
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

    </section>
</body>

</html>
