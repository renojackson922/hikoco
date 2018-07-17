<%@ page import="org.silkdog.maven.hikoco.item.vo.ItemVO" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    ItemVO itemVO = (ItemVO) request.getAttribute("itemVO");

%>
<html ng-cloak ng-app="app">
<head>
    <title>HIKOCO :: ITEM :: <%=itemVO.getItem_title()%>
    </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HIKOCO :: MAIN</title>
    <link rel="stylesheet" href="../../resources/script/global.css">
    <link rel="stylesheet" href="../../resources/script/item_detail.css">
    <%@ include file="./essential/base.jsp" %>

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

            $scope.$watch('test1 * 1000000', function (value) {
                $scope.test2 = value;
                $scope.test3 = value * 0.005 // 0.5% 적립
            });
        });
    </script>
    <style>
        #advertisement > a > span {
            font-size: 2.5em;
            color: #5d5d5d;
        }

        #advertisement > a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body ng-controller="ctrl">

<%--<div id="advertisement"  style="position:fixed; right:0;">--%>
<%--<a href="#" ng-model="clicked"><span>&times;</span></a>--%>
<%--<img ng-hide="clicked" src="../../resources/imgs/palit.jpg">--%>
<%--</div>--%>
<div id="hide">

</div>
<button onclick="topFunction()" id="myBtn" class="animated fadeIn" title="Go to top">Top</button>
<%@include file="layout/hikoco_navbar.jsp" %>
<div id="show" style="padding-top:60px; padding-bottom:170px;">
    <!-- 분류 -->
    <div class="container" style="margin-top:17px; margin-bottom:17px; padding:17px; border:1px solid #ddd;">
        <span style="font-size:12px"><i class="fas fa-home"></i>&nbsp;&nbsp;홈 > 그래픽카드 > 엔비디아 > PALIT</span>
    </div>
    <!-- 상품 상세내용 시작 -->
    <div class="container" style="margin-top:17px; margin-bottom:17px; padding:0px; border:1px solid #ddd;">
        <!-- 상단 -->
        <div class="item-detail-top css-table">
            <!-- 상품의 정보, Top -->
            <div class="css-table-row">
                <!-- 제목, 가격 등... -->
                <div class="css-table-cell">
                    <img src="<%=itemVO.getItem_pic()%>" width="300px" height="300px" style="border:1px solid #ddd;">
                    <div class="" style="display: block;">
                        <button class="btn btn-sm btn-outline-secondary" style="width:100%; margin-top:5px;">자세히 보기
                        </button>
                        <button class="btn btn-sm btn-outline-secondary" style="width:100%; margin-top:5px;">상품신고
                        </button>
                    </div>
                </div>
                <!-- 상품의 정보 -->
                <div class="css-table-cell" style="margin-left:20px;">
                    <span class="item-detail-span item-title"><strong><%=itemVO.getItem_title()%></strong></span>
                    <span class="item-detail-span item-subtitle" style="color:#5d5d5d;"><%=itemVO.getItem_manu()%>&nbsp;&nbsp;|&nbsp;&nbsp;<%=itemVO.getItem_vendor()%></span>
                    <span class="item-detail-span item-subtitle"><%=itemVO.getItem_summary()%></span>
                    <div class="item-detail-span">
                        <span class="span-loginInfo"
                              style="font-size:10px; padding:0px 5px 0px 5px; background: #2897d3; color:#fff; border-radius:0px; display: inline-block;">사은품</span>
                        <span class="item-optional">&nbsp;구매영수증 인증 시 메로나 아이스크림 증정 (05.01~05.31)</span>
                    </div>
                    <div class="item-detail-span">
                        <span class="span-loginInfo"
                              style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>
                        <span class="item-optional">&nbsp;후기 작성 후 별도의 신청 시 스타벅스 캔커피 증정 (05.01~05.31)</span>
                    </div>
                    <div class="item-detail-span">
                        <span class="span-loginInfo"
                              style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>
                        <span class="item-optional">&nbsp;후기 작성 후 별도의 신청을 하신 6분께 LED 삼각대 증정 (05.01~05.31)</span>
                    </div>
                    <hr>
                    <div class="item-detail-span">
                        <%
                            String leadingZeroFormation = String.format("%06d", itemVO.getItem_id());
                        %>
                        <span class="item-optional strong">제품번호:&nbsp;</span>
                        <span class="item-optional"><%=leadingZeroFormation%></span>
                    </div>
                    <div class="item-detail-span">
                        <span class="item-optional strong">적립금:&nbsp;</span>
                        <span class="item-optional">{{test3}}원</span>
                    </div>
                    <div class="item-detail-span">
                        <span class="item-optional strong">배송정보:&nbsp;</span>
                        <span class="item-optional">2018년 5월 24일 배송예정</span>
                    </div>
                    <div class="item-detail-span">
                        <span class="item-optional strong">카드혜택:&nbsp;</span>
                        <span class="item-optional">최대 6개월 무이자&nbsp;</span>
                        <span id="card" class="unselectable"
                              style="height:1.0em; font-size:0.5em; padding:5px 5px 5px 5px; border:1px solid #5d5d5d;">카드사별</span>
                    </div>
                    <!-- 옵션 -->

                    <!-- 가격 -->

                </div>
            </div>
        </div>

        <!-- 하단 -->
        <!-- 상품의 디테일, Bottom -->
        <div class="item-detail-bottom" style="display:block;">
            <!-- 네이게이터 -->
            <div class="item-detail-bottom__navigator">
                <table class="table text-center">
                    <tbody>
                    <tr>
                        <div class="navigator-td-parent" style="display:block">
                            <td class="navigator-td-parent-item"><a href="#"
                                                                    class="list-group-item list-group-item-action item-focus"
                                                                    onclick="window.location.hash='item-describe'">상세정보</a>
                            </td>
                            <td class="navigator-td-parent-item"><a href="#"
                                                                    class="list-group-item list-group-item-action item-focus"
                                                                    onclick="window.location.hash='item-specinfo'">상품정보제공고시</a>
                            </td>
                            <td class="navigator-td-parent-item"><a href="#"
                                                                    class="list-group-item list-group-item-action item-focus"
                                                                    onclick="window.location.hash='item-comment'">이용후기&nbsp;(0)</a>
                            </td>
                            <td class="navigator-td-parent-item"><a href="#"
                                                                    class="list-group-item list-group-item-action item-focus"
                                                                    onclick="window.location.hash='item-review'">뉴스/리뷰&nbsp;(0)</a>
                            </td>
                            <td class="navigator-td-parent-item"><a href="#"
                                                                    class="list-group-item list-group-item-action item-focus"
                                                                    onclick="window.location.hash='item-qna'">상품Q&A</a>
                            </td>
                            <td class="navigator-td-parent-item last-row"><a href="#"
                                                                             class="list-group-item list-group-item-action item-focus"
                                                                             onclick="window.location.hash='item-refund'">배송/교환/환불</a>
                            </td>
                        </div>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!-- 상품 상세설명 -->
            <div class="item-detail-bottom__detail">
                <!-- Title -->
                <div class="__detail-title">
                    <h5>상품 상세설명</h5>
                </div>
                <div id="item-describe">
                    <img class="img-center" src="<%=itemVO.getItem_detail()%>">
                    <% if (!(itemVO.getItem_detail2().isEmpty())) { %>
                    <img class="img-center" src="<%=itemVO.getItem_detail2()%>">
                    <% } else {
                    }%>
                    <% if (!(itemVO.getItem_detail3().isEmpty())) { %>
                    <img class="img-center" src="<%=itemVO.getItem_detail3()%>">
                    <% } else {
                    }%>
                </div>
                <!--  상품정보제공고시 -->
                <div class="__detail-title">
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
                <div class="__detail-title">
                    <h5>이용후기</h5>
                </div>
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
                                        <!-- 주의 -->
                                        <% for (int k = 0; k < 5; k++) { %>
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
                        <div class="satisfaction-comment"
                             style="border-bottom:2px solid #5d5d5d; padding-bottom:5px; margin-bottom:5px;">
                            &nbsp;<span><strong>전체(29)</strong>&nbsp;&nbsp;|&nbsp;&nbsp;일반(20)&nbsp;&nbsp;|&nbsp;&nbsp;프리미엄(9)</span>
                        </div>
                        <% for (int i = 0; i < 5; i++) {%>
                        <div class="satisfaction-comment-item"
                             style="min-height:90px; border-bottom:1px solid #ddd; padding-left:7px;">
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
                <div class="__detail-title">
                    <h5>뉴스 / 리뷰</h5>
                </div>
                <div id="item-review" class="container text-center" style="height:300px; padding-top:90px;"> <!-- 주의 -->
                    <h1><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;등록된 리뷰가 없습니다</h1>
                    <button class="btn btn-outline-secondary">리뷰 등록하기</button>
                </div>
                <!-- 질문 / 답변 -->
                <div class="__detail-title">
                    <h5>질문 / 답변</h5>
                </div>
                <div id="item-qna" class="container text-center" style="height:300px; padding-top:90px;"> <!-- 주의 -->
                    <h1><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;등록된 Q&A가 없습니다</h1>
                    <button class="btn btn-outline-secondary">질문하기</button>
                </div>
                <!-- 배송 / 환불 / 교환 -->
                <div class="__detail-title">
                    <h5>배송 / 환불 / 교환규정</h5>
                </div>
                <div id="item-refund" class="container" style="height:300px;">

                </div>
            </div>
        </div>
    </div>
    <%@include file="layout/hikoco_footer.jsp" %>
</div>
</body>
<script>
    $(document).ready(function () {
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
        });
    });

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function () {
        scrollFunction()
    };

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

    document.addEventListener("DOMContentLoaded", function (event) {
        // document.getElementById('hikoco-nav').style.height = 66;
        document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0.8)';
    });
</script>
</html>
