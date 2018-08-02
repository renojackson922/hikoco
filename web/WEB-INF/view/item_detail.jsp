<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="org.silkdog.maven.hikoco.item.vo.ItemVO" %>
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
<div id="hide"></div>
<button onclick="topFunction()" id="myBtn" class="animated fadeIn" title="Go to top">Top</button>
<c:choose>
<c:when test="${check eq null}">
<%@ include file="layout/hikoco_navbar.jsp" %>
<div id="show" style="padding-top:60px; padding-bottom:170px;">
    </c:when>
    <c:otherwise>
    <div id="show" style="">
        </c:otherwise>
        </c:choose>
        <!-- 분류 -->
        <div class="container" style="margin-top:17px; margin-bottom:17px; padding:17px; border:1px solid #ddd; background:#f7f7f7;">
            <span style="font-size:12px"><i class="fas fa-home"></i>&nbsp;&nbsp;홈 > 그래픽카드 > 엔비디아 > PALIT</span>
        </div>
        <!-- 상품 상세내용 시작 -->
        <div class="container" style="margin-top:17px; margin-bottom:17px; padding:0px; border:1px solid #ddd;">
            <!-- 상단 -->
            <div class="item-detail-top">
                <!-- 상품의 정보, Top -->
                <div class="" style="width:100% !important; display:inline-block">
                    <!-- 제목, 가격 등... -->
                    <div class="col-md-4" style="float:left; margin:0 auto; padding:0 20px 0 0; max-width:320px;">
                        <img src="<%=itemVO.getItem_pic()%>" width="100%" style="border:1px solid #ddd;">
                        <div style="display: block;">
                            <button class="btn btn-sm btn-outline-secondary" style="width:100%; margin-top:5px;">자세히 보기
                            </button>
                            <button class="btn btn-sm btn-outline-secondary" style="width:100%; margin-top:5px;">상품신고
                            </button>
                        </div>
                    </div>
                    <!-- 상품의 정보 -->
                    <div class="col-md-8" style="float:left">
                        <div>
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
                            <hr/>
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
                            <hr/>
                        </div>
                        <div>
                            <!-- 옵션 -->
                            <div class="col-md-6" style="float:left; padding:0;">
                                <div class="item-detail-span" style="display:inline;">
                                    <span class="item-optional strong">남은 수량:&nbsp;</span>
                                    <span class="item-optional">${itemVO.item_amount}개</span>
                                </div>
                                <div class="item-detail-span">
                                    <span class="item-optional strong" style="vertical-align: middle;">주문 수량:&nbsp;</span>
                                    <input type="number" id="item_amount" name="item_amount" min="1" max="10"
                                           value="1" style="width:3em; height:1.5em; font-size:0.8em;">
                                    <script>
                                        $(function(){
                                            var totalPrice = 0;
                                            totalPrice = ${itemVO.item_price};

                                            $('#item_amount').each(function(){
                                                var elem = $(this);
                                                elem.bind('propertychange change', function(event){  // input
                                                    if(elem.val() == null){
                                                        alert('주문 수량을 입력해주세요.');
                                                        document.getElementById('item_amount').value = 1;
                                                    }
                                                    if(elem.val() <= 0){
                                                        alert('1개 미만으로 주문할 수 없습니다.');
                                                        document.getElementById('item_amount').value = 1;
                                                    }
                                                    if(elem.val() > 10){
                                                        alert('10개 이상 주문할 수 없습니다.');
                                                        document.getElementById('item_amount').value = 10;
                                                    }
                                                    document.getElementById('totalPriceSpan').value = totalPrice * elem.val();
                                                });
                                            });
                                        });
                                    </script>

                                    <%--<span style="width:27px; float:left;" class="optiondt2 Sblack11">--%>
                                        <%--<input type="text" name="last_439394" id="last_439394" value="1" onblur="Add_Total_Price('439394');"--%>
                                               <%--style="width:25px; height:19px; text-align:right; border-width:1px;--%>
                                               <%--border-style:solid; border-color:#c5c5c5 #e9e9e9 #e9e9e9 #c5c5c5;">--%>
                                    <%--</span>--%>
                                    <%--<span style="width:21px; margin:0 0 0 4px; float:left;" class="optiondt3">--%>
                                        <%--<div style="width:21px; float:left;"><a href="javascript:ea_up2('global_form','','last_439394','0');Add_Total_Price('439394');">--%>
                                            <%--<img src="http://image5.compuzone.co.kr/img/images/product_detail/amount_plus.gif" width="21" height="11"></a></div>--%>
                                        <%--<div style="width:21px; float:left;"><a href="javascript:ea_down2('global_form','','last_439394');Add_Total_Price('439394');">--%>
                                            <%--<img src="http://image5.compuzone.co.kr/img/images/product_detail/amount_minus.gif" width="21" height="10"></a></div>--%>
                                    <%--</span>--%>
                                </div>
                                <div class="item-detail-span">
                                    <!-- 이부분 Angular watch 로 바꾸기 -->
                                    <!-- 이부분 Angular watch 로 바꾸기 -->
                                    <!-- 이부분 Angular watch 로 바꾸기 -->
                                    <!-- 이부분 Angular watch 로 바꾸기 -->
                                    <!-- 이부분 Angular watch 로 바꾸기 -->
                                    <!-- 이부분 Angular watch 로 바꾸기 -->
                                    <span class="item-optional strong" style="line-height:3em;">총 합계금액:&nbsp;</span>
                                    <input type="text" id="totalPriceSpan" value="${itemVO.item_price}">
                                    <%--<span class="item-optional" style="font-size:1.5em;">&nbsp;<fmt:formatNumber value="${itemVO.item_price}" type="currency" currencySymbol=""/>--%>
                                        <%--<span style="font-size:0.6em; line-height:2em;">원</span>--%>
                                    <%--</span>--%>
                                </div>
                                <%--<div class="item-detail-span">--%>
                                <%--</div>--%>
                            </div>
                            <!-- 가격 -->
                            <div class="col-md-6 text-right" style="float:left; right:0; bottom:0;">
                                <button type="button" class="btn btn-primary">바로구매</button>
                                <button type="button" class="btn btn-danger">장바구니</button>
                            </div>
                        </div>
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
                                <td class="navigator-td-parent-item"><a href="javascript:void(0)"
                                                                        class="list-group-item list-group-item-action item-focus"
                                                                        onclick="window.location.hash='item-describe'">상세정보</a>
                                </td>
                                <td class="navigator-td-parent-item"><a href="javascript:void(0)"
                                                                        class="list-group-item list-group-item-action item-focus"
                                                                        onclick="window.location.hash='item-specinfo'">상품정보제공고시</a>
                                </td>
                                <td class="navigator-td-parent-item"><a href="javascript:void(0)"
                                                                        class="list-group-item list-group-item-action item-focus"
                                                                        onclick="window.location.hash='item-comment'">이용후기&nbsp;(0)</a>
                                </td>
                                <td class="navigator-td-parent-item"><a href="javascript:void(0)"
                                                                        class="list-group-item list-group-item-action item-focus"
                                                                        onclick="window.location.hash='item-review'">뉴스/리뷰&nbsp;(0)</a>
                                </td>
                                <td class="navigator-td-parent-item"><a href="javascript:void(0)"
                                                                        class="list-group-item list-group-item-action item-focus"
                                                                        onclick="window.location.hash='item-qna'">상품Q&A</a>
                                </td>
                                <td class="navigator-td-parent-item last-row"><a href="javascript:void(0)"
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
                    <style>
                        .item-specinfo-tbody > tr > th{
                            background: #f7f7f7;
                            color:#5d5d5d !important;
                        }
                    </style>
                    <!--  상품정보제공고시 -->
                    <div class="__detail-title">
                        <h5>상품정보 제공고시</h5>
                    </div>
                    <div id="item-specinfo" class="container" style="height:300px;">
                        <table class="table table-sm table-bordered">
                            <tbody class="item-specinfo-tbody">
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

                        <div id="satisfaction-comment__null" class="container text-center" style="height:300px; padding-top:90px;"> <!-- 주의 -->
                            <h1><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;등록된 한줄평이 없습니다</h1>
                            <button class="btn btn-outline-secondary">한줄평 등록하기</button>
                        </div>

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
                        <style>
                            .item-refund-span{
                                display: block;
                            }
                            .__left__padding{
                                padding-left:15px;
                            }
                            .item-refund-th{
                                background: #f7f7f7;
                                width:13.3% !important;
                            }
                            .item-refund-table > tbody > td{
                                width:86.6% !important;
                            }
                        </style>
                    </div>
                    <div id="item-refund" class="container" style="width:90%; height:550px;">
                        <table class="table table-bordered item-refund-table">
                            <tbody>
                            <tr>
                                <th class="item-refund-th">
                                    <div class="text-center" style="top:0; padding: 70px 0;">
                                        <span style="font-size:1.2em; color:#5d5d5d;">교환/반품 신청기준</span>
                                    </div>
                                </th>
                                <td>
                                    <div style="padding:10px 20px 10px 20px;">
                                        <ul>
                                            <li>제품 수령 후 7일 이내에 교환/반품을 신청하실 수 있습니다.</li>
                                            <li>제품포장상태(박스, 내용물등)이 완벽해야 하며 제품 발송시 동봉해드린 영수증이 있으셔야 합니다.</li>
                                            <li>교환 및 반품에 소요되는 운송비는 고객분께서 부담하셔야 됩니다. (색상 교환, 사이즈 교환, 모델 변경 등 포함)</li>
                                        </ul>
                                        <span class="item-refund-span" style="color:red;">※ 하지만 다음의 각 내용에 해당하는 경우에는 교환/반품 신청이 받아들여지지 않을 수 있습니다.</span>
                                        <br/>
                                        <span class="item-refund-span __left__padding">1) 소비자의 책임 있는 사유로 상품 등이 멸실/훼손된 경우 (상품 확인을 위한 포장 훼손 제외)</span>
                                        <span class="item-refund-span __left__padding">2) 소비자의 사용/소비에 의해 상품 등의 가치가 현저히 감소한 경우</span>
                                        <span class="item-refund-span __left__padding">3) 시간의 경과에 의해 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우</span>
                                        <span class="item-refund-span __left__padding">4) 복제가 가능한 상품 등의 포장을 훼손한 경우</span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="item-refund-th">
                                    <div class="text-center" style="top:0; padding: 40px 0;">
                                        <span style="font-size:1.2em; color:#5d5d5d;">A/S 운송비</span>
                                    </div>
                                </th>
                                <td>
                                    <div style="padding:10px 20px 10px 20px;">
                                        <ul>
                                            <li>제품 수령 후 7일 이내 제품불량 발생시 교환이나 환불에 필요한 운송비를 전액(왕복) 히코코에서 부담</li>
                                            <li>제품 수령 후 7일 이상 30일 이내에 제품불량 발생시 교환에 필요한 운송비는 반액(편도) 히코코에서 부담</li>
                                            <li>소비자 변심에 의해 반품하는 경우 운송비는 전액 고객이 부담해야 합니다.</li>
                                        </ul>
                                        <span class="item-refund-span" style="color:red;">
                                                ※ 위에 언급된 운송비는 대한통운을 이용하는 경우에만 해당합니다. (다른 운송방법을 이용하는 경우 운송비는 소비자가 부담해야 합니다.)
                                            </span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="item-refund-th">
                                    <div class="text-center" style="top:0; padding: 30px 0;">
                                        <span style="font-size:1.2em; color:#5d5d5d;">상품 하자문의 및<br/>기타 기준 사항</span>
                                    </div>
                                </th>
                                <td>
                                    <div style="padding:30px 20px 10px 20px;">
                                        <ul>
                                            <li>사용 중 발생한 하자의 환불/교환 등은 '공정거래위원회 소비자분쟁해결기준'에 준하여 처리됩니다.</li>
                                            <li>미성년자가 법정대리인의 동의 없이 구매계약을 체결한 경우, 미성년자와 법정대리인은 구매계약을 취소할 수 있습니다.</li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th class="item-refund-th">
                                    <div class="text-center" style="top:0; padding: 40px 0;">
                                        <span style="font-size:1.2em; color:#5d5d5d;">주의사항</span>
                                    </div>
                                </th>
                                <td>
                                    <div style="padding:20px 20px 10px 20px;">
                                        <ul>
                                            <li>품질 경영 및 공산품안전관리법에 의거하여 안전검사대상공산품이나 어린이 보호포장대상 공산품을 구매하실 경우에는 안전검사를 받은 제품이거나 어린이 보호포장 적용제품인지를 확인하시기 바랍니다.</li>
                                            <li>전기용품안전관리법 및 전기통신기본법, 전파법에 의거하여 인증 대상 상품을 구매하실 경우, 안전인증 또는 형식승인, 전자파적합등록 제품인지 여부를 확인하시기 바랍니다.</li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%--<%@include file="layout/hikoco_footer.jsp" %>--%>
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
