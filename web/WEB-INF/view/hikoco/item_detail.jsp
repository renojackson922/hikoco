<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="org.silkdog.maven.hikoco.item.vo.ItemVO" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    ItemVO itemVO = (ItemVO) request.getAttribute("itemVO");
%>
<html>
<head>
    <title>HIKOCO :: ITEM :: <%=itemVO.getItem_title()%>
    </title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HIKOCO :: MAIN</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="../../../resources/script/global.css">
    <link rel="stylesheet" href="../../../resources/script/item_detail.css">
    <%@ include file="../essential/base.jsp" %>
    <style>
        #advertisement > a > span {
            font-size: 2.5em;
            color: #5d5d5d;
        }

        #advertisement > a:hover {
            text-decoration: none;
        }
    </style>
    <script type="text/javascript">

        // Load the Visualization API and the corechart package.
        google.charts.load('current', {'packages':['corechart', 'bar']});

        // Set a callback to run when the Google Visualization API is loaded.
        google.charts.setOnLoadCallback(drawChart);

        // Callback that creates and populates a data table,
        // instantiates the pie chart, passes in the data and
        // draws it.
        function drawChart() {

            // Create the data table.
            // var data = new google.visualization.DataTable();
            // data.addColumn('string', 'Topping');
            // data.addColumn('number', 'Slices');
            // data.addRows([
            //     ['Mushrooms', 3],
            //     ['Onions', 1],
            //     ['Olives', 1],
            //     ['Zucchini', 1],
            //     ['Pepperoni', 2]
            // ]);
            var data = google.visualization.arrayToDataTable([
                ['Element', 'Density', { role: 'style' }],
                ['Copper', 8.94, '#b87333'],            // RGB value
                ['Silver', 10.49, 'silver'],            // English color name
                ['Gold', 19.30, 'gold'],
                ['Platinum', 21.45, 'color: #e5e4e2' ], // CSS-style declaration
                ['Adamantium', 21.45, 'color: crimson' ], // CSS-style declaration
            ]);

            //Set chart options
            var options = {'title':'How Much Pizza I Ate Last Night',
                'width':400,
                'height':300};

            // Instantiate and draw our chart, passing in some options.
            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>
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
                            <script type="text/javascript">
                                if(!Object.prototype.watch){
                                    Object.defineProperty(Object.prototype, 'watch', {
                                        enumerable: false,
                                        configurable: true,
                                        writable: false,
                                        value: function(prop, handler){
                                            let oldval = this[prop],
                                                newval = oldval,
                                                getter = function(){
                                                    return newval;
                                                },
                                                setter = function(val){
                                                    oldval = newval;
                                                    return newval = handler.call(this, prop, oldval, val);
                                                };
                                            if(delete this[prop]){ // can't watch constants
                                                Object.defineProperty(this, prop, {
                                                    get: getter,
                                                    set: setter,
                                                    enumerable: true,
                                                    configurable: true
                                                });
                                            }
                                        }
                                    });
                                }
                                if(!Object.prototype.unwatch){
                                    Object.defineProperty(Object.prototype, 'unwatch', {
                                        enumerable: false,
                                        configurable: true,
                                        writable: false,
                                        value: function(prop){
                                            let val = this[prop];
                                            delete this[prop]; // remove accessors
                                            this[prop] = val;
                                        }
                                    });
                                }
                            </script>
                            <div class="item-detail-span">
                                <%
                                    String leadingZeroFormation = String.format("%06d", itemVO.getItem_id());
                                %>
                                <span class="item-optional strong">제품번호:&nbsp;</span>
                                <span class="item-optional"><%=leadingZeroFormation%></span>
                            </div>
                            <div class="item-detail-span">
                                <span class="item-optional strong" style="vertical-align: middle">적립금:&nbsp;</span>
                                <fmt:formatNumber var="savingSpan" value="${itemVO.item_price * 0.05}" currencySymbol="" type="currency"/>
                                <input type="text" id="totalSavingSpan" value="${savingSpan}원" style="font-size:0.8em; height:1.5em;
                                    min-width:4em; max-width:5em; text-align:left; border:none;" disabled><span style="font-size:0.8em;"></span></div>
                            <div class="item-detail-span">
                                <span class="item-optional strong">배송정보:&nbsp;</span>
                                <c:set var="now" value="<%=new java.util.Date()%>"/>
                                <fmt:formatDate var="currentDate" value="${now}" pattern="yyyy년 MM월 dd일"/>
                                <fmt:formatDate var="currentTime" value="${now}" pattern="HH"/> <%-- hh: 12hrs, HH: 24hrs --%>
                                <c:choose>
                                    <c:when test="${currentTime le 17}">
                                        <span class="item-optional">${currentDate} 배송예정</span>&nbsp;&nbsp;
                                        <span class="item-optional" style="color: #777777;">(17시 이전에 입금 시 당일 배송)</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="tomorrow" value="<%=new Date(new Date().getTime() + 60*60*24*1000)%>"/>
                                        <fmt:formatDate var="nextDate" value="${tomorrow}" pattern="yyyy년 MM월 dd일"/>
                                        <span class="item-optional">${nextDate} 배송 예정</span>&nbsp;&nbsp;
                                        <span class="item-optional" style="color: #777777;">(17시 이후에 입금 시 당일 배송)</span>
                                    </c:otherwise>
                                </c:choose>
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
                            <form id="form1" name="form1" action="/shop/addToCart" method="POST">
                                <div class="col-md-6" style="float:left; padding:0;">
                                    <div class="item-detail-span" style="display:inline;">
                                        <span class="item-optional strong">남은 수량:&nbsp;</span>
                                        <span class="item-optional">${itemVO.item_amount}개</span>
                                    </div>
                                    <div class="item-detail-span">
                                        <span class="item-optional strong" style="vertical-align: middle;">주문 수량:&nbsp;</span>
                                        <input type="hidden" name="item_id" value="${itemVO.item_id}"/>
                                        <input type="number" id="item_amount" name="item_amount" min="1" max="10"
                                               value="1" style="text-align:center; width:3em; height:1.5em; font-size:0.8em;">
                                        <script type="text/javascript">
                                            $(function(){
                                                let totalPrice = 0;
                                                totalPrice = ${itemVO.item_price};

                                                $('#item_amount').each(function(){
                                                    var elem = $(this);
                                                    elem.bind('propertychange change', function(event){  // input
                                                        /** 수량칸이 비었을 경우 */
                                                        if(elem.val() == null){
                                                            alert('주문 수량을 입력해주세요.');
                                                            document.getElementById('item_amount').value = 1;
                                                        }
                                                        /** 수량이 0 이하일 경우 */
                                                        if(elem.val() <= 0){
                                                            alert('1개 미만으로 주문할 수 없습니다.');
                                                            document.getElementById('item_amount').value = 1;
                                                        }
                                                        /** 수량이 10을 초과할 경우 */
                                                        if(elem.val() > 10){
                                                            alert('10개 이상 주문할 수 없습니다.');
                                                            document.getElementById('item_amount').value = 10;
                                                        }
                                                        /** Lambda */
                                                        const numberWithCommas = (x) => {
                                                            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                                        }
                                                        document.getElementById('totalPriceSpan').value = numberWithCommas(totalPrice * elem.val()) + '원';
                                                        document.getElementById('totalSavingSpan').value = numberWithCommas(totalPrice * elem.val() * 0.05) + '원';
                                                    });
                                                });
                                            });
                                        </script>
                                    </div>
                                    <div class="item-detail-span">
                                        <!-- 이부분 Angular watch 로 바꾸기 -->
                                        <!-- 이부분 Angular watch 로 바꾸기 -->
                                        <!-- 이부분 Angular watch 로 바꾸기 -->
                                        <!-- 이부분 Angular watch 로 바꾸기 -->
                                        <!-- 이부분 Angular watch 로 바꾸기 -->
                                        <!-- 이부분 Angular watch 로 바꾸기 -->
                                        <span class="item-optional strong" style="vertical-align: middle;">총 합계금액:&nbsp;</span>
                                        <fmt:formatNumber var="totalSpan" value="${itemVO.item_price}" type="currency" currencySymbol=""/>
                                        <input type="text" id="totalPriceSpan" value="${totalSpan}원" style="font-size:0.8em; height:1.5em;
                                    min-width:4em; max-width:8em; text-align:left; border:none;" disabled><span style="font-size:0.8em;">&nbsp;</span>
                                        <%--<span class="item-optional" style="font-size:1.5em;">&nbsp;<fmt:formatNumber value="${itemVO.item_price}" type="currency" currencySymbol=""/>--%>
                                        <%--<span style="font-size:0.6em; line-height:2em;">원</span>--%>
                                        <%--</span>--%>
                                    </div>
                                    <%--<div class="item-detail-span">--%>
                                    <%--</div>--%>
                                </div>
                                <!-- 가격 -->
                                <style>
                                    /*.btn-skyblue{*/
                                    /*color: #fff;*/
                                    /*background-color: #007bff;*/
                                    /*border-color: #007bff;*/
                                    /*}*/
                                    /*.btn-skyblue:hover{*/
                                    /*color: #fff;*/
                                    /*background-color: #007bff;*/
                                    /*border-color: #007bff;*/
                                    /*}*/
                                    /*.btn-primary {*/
                                    /*color: #fff;*/
                                    /*background-color: #007bff;*/
                                    /*border-color: #007bff*/
                                    /*}*/

                                    /*.btn-primary:hover {*/
                                    /*color: #fff;*/
                                    /*background-color: #0069d9;*/
                                    /*border-color: #0062cc*/
                                    /*}*/

                                    /*.btn-primary.focus,.btn-primary:focus {*/
                                    /*box-shadow: 0 0 0 .2rem rgba(0,123,255,.5)*/
                                    /*}*/

                                    /*.btn-primary.disabled,.btn-primary:disabled {*/
                                    /*color: #fff;*/
                                    /*background-color: #007bff;*/
                                    /*border-color: #007bff*/
                                    /*}*/

                                    /*.btn-primary:not(:disabled):not(.disabled).active,.btn-primary:not(:disabled):not(.disabled):active,.show>.btn-primary.dropdown-toggle {*/
                                    /*color: #fff;*/
                                    /*background-color: #0062cc;*/
                                    /*border-color: #005cbf*/
                                    /*}*/

                                    /*.btn-primary:not(:disabled):not(.disabled).active:focus,.btn-primary:not(:disabled):not(.disabled):active:focus,.show>.btn-primary.dropdown-toggle:focus {*/
                                    /*box-shadow: 0 0 0 .2rem rgba(0,123,255,.5)*/
                                    /*}*/

                                </style>
                                <div class="col-md-6 text-right" style="float:left; right:0; bottom:0; padding-top:50px;">
                                    <c:choose>
                                        <c:when test="${isItemExists ne 0}">
                                        <span style="font-size:0.8em; color:crimson; vertical-align:bottom; display:block;">
                                            장바구니에 해당 상품이 담겨있습니다.
                                        </span>
                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                    <a class="btn btn-info" href="javascript:void(0)" onclick="confirmation()" style="font-size:0.9em; padding:12px 25px;">바로구매</a>
                                    <%-- 관리자 팝업모드에서는 비활성화로 바꾸기; disabled prop 추가--%>
                                    <button type="submit" class="btn btn-danger" style="font-size:0.9em; padding:12px 25px;">장바구니</button>
                                </div>
                                <script type="text/javascript">
                                    let confirmation = function() {
                                        let amount = $(document.getElementById('item_amount')).val();
                                        let price = ${itemVO.item_price};
                                        let total = amount * price;
                                        if (confirm('주문 전에 확인해주세요.\n수량: ' + amount + '개\n가격: ' + total +'원')) {
                                            alert('hell yeah!');
                                        }else{
                                            return false;
                                        }
                                    }

                                    /** ENTER 키 방지 */
                                    $(document).ready(function() {
                                        $(window).keydown(function(event){
                                            if(event.keyCode == 13) {
                                                event.preventDefault();
                                                return false;
                                            }
                                        });
                                    });
                                </script>
                            </form>
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
                                                                        onclick="window.location.hash='item-comment-hash'">이용후기&nbsp;(${reviewListByItemId.size()})</a>
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
                    <div id="item-comment-hash" class="__detail-title">
                        <h5>이용후기</h5>
                    </div>

                    <!-- 코멘트 -->
                    <%--<c:out value="${reviewListByItemId}"/>--%>
                    <c:choose>
                        <c:when test="${reviewListByItemId eq '[]'}">
                            <div id="satisfaction-comment__null" class="container text-center" style="height:300px; padding-top:90px;"> <!-- 주의 -->
                                <h1><i class="fas fa-exclamation-circle"></i>&nbsp;&nbsp;등록된 한줄평이 없습니다</h1>
                                <button class="btn btn-outline-secondary" onclick="writeOnelinePopup('${itemVO.item_id}')">한줄평 등록하기</button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div id="item-comment" class="container" style="width:80%; min-height:300px; margin-bottom:27px;">
                                <!-- Wrapper -->
                                <div class="item-comment-wrapper" style="display:block; width:100%; padding-bottom:180px;">
                                    <!-- 별 -->
                                    <div class="item-comment__star">
                                        <div class="title">
                                            <h5>전체 만족도</h5>
                                        </div>
                                        <div class="starry-wrapper">
                                                <%-- 컨트롤러에서 처리하는 방법도 고려하기 --%>
                                            <c:set var="satisfy" value="0"/>
                                            <c:set var="cnt" value="0" scope="page"/>
                                            <c:forEach var="i" items="${reviewListByItemId}">
                                                <c:set var="satisfy" value="${satisfy + i.score}"/>
                                                <c:set var="cnt" value="${cnt + 1}"/>
                                            </c:forEach>
                                            <c:set var="satisfy" value="${satisfy / cnt}"/>
                                            <fmt:formatNumber var="satisfyConversion" value="${satisfy}" pattern=".0" type="number"/>
                                            <div class="starry">

                                                <c:set var="satisfyNatural" value="${satisfy - (satisfy%1)}"/>
                                                <c:set var="satisfySod" value="${satisfy % 1}"/>
                                                <fmt:parseNumber var="satisfyNaturalConv" integerOnly="true" value="${satisfyNatural}"/>

                                                <c:choose>
                                                    <%-- 점수가 0일 경우 --%>
                                                    <c:when test="${satisfyNaturalConv eq 0}">
                                                        <%--<c:out value="정수가 0이에요"></c:out>--%>
                                                        <c:forEach begin="1" end="5">
                                                            <span><i class="far fa-star"></i></span>
                                                        </c:forEach>
                                                    </c:when>

                                                    <%-- 만점일 경우 --%>
                                                    <c:when test="${satisfyNaturalConv eq 5}">
                                                        <%--<c:out value="만점이에요."></c:out>--%>
                                                        <c:forEach begin="1" end="5">
                                                            <span><i class="fas fa-star"></i></span>
                                                        </c:forEach>
                                                    </c:when>

                                                    <%-- 딱 떨어질 경우 --%>
                                                    <c:when test="${(satisfy % 1) eq 0}">
                                                        <%--<c:out value="딱 떨어져요."></c:out>--%>
                                                        <%-- 점수 --%>
                                                        <c:forEach begin="1" end="${satisfyNaturalConv}">
                                                            <span><i class="fas fa-star"></i></span>
                                                        </c:forEach>
                                                        <%-- 나머지 빈칸 --%>
                                                        <c:forEach begin="1" end="${5 - (satisfyNaturalConv)}">
                                                            <span><i class="far fa-star"></i></span>
                                                        </c:forEach>
                                                    </c:when>

                                                    <%-- 어정쩡한 점수일 경우 --%>
                                                    <c:otherwise>
                                                        <%--<c:out value="어정쩡해요."></c:out>--%>
                                                        <%-- 정수 부분 --%>
                                                        <c:forEach begin="1" end="${satisfyNaturalConv}">
                                                            <span><i class="fas fa-star"></i></span>
                                                        </c:forEach>
                                                        <%-- 소수점 부분; 무조건 하나 있으니 조건문 필요없음. --%>
                                                            <span><i class="fas fa-star-half-alt"></i></span>
                                                        <%-- 나머지 부분 --%>
                                                        <c:forEach begin="1" end="${5 - (satisfyNatural + 1)}">
                                                            <span><i class="far fa-star"></i></span>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>

                                            </div>
                                            <div class="starry__score">
                                                <span style="font-size:1.8em;">${satisfyConversion} / 5</span>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 이용후기 수 -->
                                    <div class="item-comment__total">
                                        <div class="title">
                                            <h5>전체 이용후기 수</h5>
                                            <div class="bubble">
                                                <span style="font-size:2.6em;"><i class="far fa-comment-dots"></i></span><br>
                                                <span class="bubble__amount" style="font-size:1.8em; line-height:45px;">${reviewListByItemId.size()}개</span>
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
                                                    <%--<div id="chart_div"></div>--%>
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
                                <div class="satisfaction-comment-wrapper" style="display:block;">
                                    <div class="satisfaction-comment"
                                         style="border-bottom:2px solid #5d5d5d; padding-bottom:5px; margin-bottom:5px;">
                                        &nbsp;<span><strong>전체(${cnt})</strong>&nbsp;&nbsp;|&nbsp;&nbsp;일반(${cnt})&nbsp;&nbsp;|&nbsp;&nbsp;프리미엄(0)</span>
                                        <c:choose>
                                            <c:when test="${isReviewExists eq 0}">
                                                <button class="btn btn-sm btn-danger"
                                                        onclick="writeOnelinePopup('${itemVO.item_id}')"
                                                        style="float:right; border-radius:0px; font-size:0.8em; padding:3px 9px;">한줄평 작성하기</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-sm btn-danger"
                                                        onclick="writeOnelinePopup('${itemVO.item_id}')"
                                                        style="float:right; border-radius:0px; font-size:0.8em; padding:3px 9px;" disabled>한줄평 작성하기</button>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <c:forEach var="i" items="${reviewListByItemId}">
                                        <%--<% for (int i = 0; i < 5; i++) {%>--%>
                                        <div class="satisfaction-comment-item"
                                             style="min-height:90px; border-bottom:1px solid #ddd; padding-left:7px;">
                                            <div class="satisfaction-comment-item__profile">
                                                <%-- 닉네임 --%>
                                                <%--<c:out value="${fn:length(i.nickname)}"/>--%>
                                                <span>${i.nickname}</span>
                                                <span style="vertical-align: text-bottom;">|</span>
                                                <c:forEach var="j" begin="1" end="${i.score}">
                                                    <span class="starry__personal"><i class="fas fa-star"></i></span>
                                                </c:forEach>
                                                <c:forEach var="k" begin="1" end="${5 - i.score}">
                                                    <span class="starry__personal"><i class="far fa-star"></i></span>
                                                </c:forEach>
                                                <span style="font-weight:700;">${i.score}</span>
                                                <c:choose>
                                                    <c:when test="${i.memId}">
                                                        <span>&nbsp;삭제</span>
                                                    </c:when>
                                                    <c:otherwise>

                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="satisfaction-comment-item__title">
                                                <span>${i.title}</span>
                                            </div>
                                            <div class="satisfaction-comment-item__detail">
                                                <p style="font-size:0.8em;">${i.detail}</p>
                                            </div>
                                        </div>
                                        <%--<% } %>--%>
                                    </c:forEach>
                                    <br> <!-- 주의 -->
                                    <div class="text-center">
                                        <span style="font-size:0.8em; font-weight:700;">1</span>
                                            <%--<span style="font-size:0.8em; font-weight:700;">1  2  3  4  5  6  7</span>--%>
                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

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
<script type="text/javascript">
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

    function writeOnelinePopup(param){
        let url = "/shop/item/itemOneline?itemId=" + param;
        let width = window.screen.availWidth * 0.5;
        let height = window.screen.availHeight * 0.5;
        let pop = window.open(url, "pop", 'width='+ width + ', height='+ height + ', scrollbars=yes, resizable=yes');
    }

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
        window.location.hash = '';
    }

    document.addEventListener("DOMContentLoaded", function (event) {
        // document.getElementById('hikoco-nav').style.height = 66;
        document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0.8)';
    });
</script>
</html>
