<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html ng-cloak ng-app="app">
<head>
    <title>HIKOCO :: My Cart</title>
    <%@include file="../essential/base.jsp"%>
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
</head>
<body ng-controller="ctrl">
<style>
    /*span {*/
    /*display: block;*/
    /*}*/

    /*.list-group-item {*/
    /*padding: 5px;*/
    /*}*/
</style>
<style>
    table {
        font-size: 0.8em;
    }

    th, td {
        vertical-align: middle !important;
    }

    thead {
        text-align: center;
    }

    tbody {
        text-align: center;
    }
    .table-magnify{
        color:#5d5d5d;
    }
    .table-magnify:hover{
        text-decoration: none;
        color:#ddd;
    }


</style>
<%@include file="./layout/hikoco_navbar.jsp" %>
<div id="show">
    <div style="width:80%; margin:0 auto; padding:120px 0 60px 0;">
        <div style="height:100px;">
            <span style="font-size:3.0em; font-weight:300;">장바구니</span>
            <span style="font-size:0.8em; font-weight:400; color:#5d5d5d;">&nbsp;&nbsp;&nbsp;장바구니에 담은 품목들을 표시합니다.</span>
            <hr style="margin-top:0; border:none; height:2px; background-color: #5d5d5d; "/>
        </div>
        <c:choose>
            <c:when test="${myCartList eq null}">
                <div class="text-center" style="height:500px;">
                    <h1 style="line-height: 500px;">장바구니가 비어있습니다.</h1>
                </div>
                <hr style="margin-top:0; border:none; height:2px; background-color: #5d5d5d; "/>
            </c:when>
            <c:otherwise>
                <!-- 장바구니 목록 시작 -->
                <div>
                    <table class="table bordered">
                        <thead>
                        <th scope="col"><input type="checkbox"></th>
                        <td scope="col" style="">상품명/옵션</td>
                        <td scope="col">제품가격</td>
                        <td scope="col">수량</td>
                        <td scope="col">주문금액</td>
                        </thead>
                        <tbody style="vertical-align: middle;">
                        <c:set var="cartTotalPrice" value="0"/>
                        <c:forEach var="i" items="${myCartList}">
                            <tr>
                                <th scope="row"><input type="checkbox"></th>
                                <td class="text-left" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"> <!-- overflow: hidden; text-overflow: ellipsis; white-space: nowrap; -->
                                    <img src="../../../resources/imgs/items/palit.jpg" width="70px"
                                         style="border:1px solid #ddd; margin-right:25px;">
                                        ${i.item_title}&nbsp;&nbsp;<a class="table-magnify" href="/item/${i.item_id}"><i class="fas fa-search"></i></a>
                                </td>
                                <td><fmt:formatNumber value="${i.item_price}" type="currency" currencySymbol=""/>원</td>
                                <td class="text-center"><input type="text" value="${i.cart_count}"
                                                               style="text-align: center; width:30px; margin-bottom:5px;"><br>
                                    <button type="button" class="btn btn-warning btn-sm"
                                            style="font-size:0.6em; padding:3px 7px 3px 7px; border-radius:0px;">변경
                                    </button>
                                    <button type="button" class="btn btn-danger btn-sm"
                                            style="font-size:0.6em; padding:3px 7px 3px 7px; border-radius:0px;">삭제
                                    </button>
                                </td>
                                <c:set var="itemTotalPrice" value="${i.item_price * i.cart_count}"/>
                                <c:set var="cartTotalPrice" value="${cartTotalPrice + itemTotalPrice}"/>
                                <td><fmt:formatNumber value="${itemTotalPrice}" type="currency" currencySymbol=""/>원</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!-- 장바구니 목록 끝 -->
                    <style>
                        .table-td__left{
                            text-align:left;
                        }
                        .table-td__right{
                            text-align:right;
                        }
                    </style>
                    <hr style="margin-top:0; border:none; height:2px; background-color: #5d5d5d; "/>


                    <div style="padding:0px 5px 10px 5px;">
                        <span style="font-size:0.8em;">선택한 항목을...&nbsp;</span>
                        <a href="javascript:void(0)" class="btn btn-sm btn-secondary" style="font-size:0.6em; border-radius:0px;">삭제</a>
                        <a href="javascript:void(0)" class="btn btn-sm btn-secondary" style="font-size:0.6em; border-radius:0px;">찜하기</a>
                    </div>

                    <!-- 결제 버튼 모듈 -->
                    <div style="border:2px solid #5d5d5d; width:100%; height:190px; padding:10px;">
                        <!-- 카드로 결제시 모듈 -->
                        <div class="col-md-6" style="float:left;">
                            <div class="col-md-6" style="float:left; padding-top:5px;">
                                <span>카드로 결제시</span>
                            </div>
                            <div class="col-md-6" style="float:left">
                                <table class="table" style="float:right; width:250px;">
                                    <tbody>
                                    <tr>
                                        <td class="table-td__left">총 상품금액</td>
                                        <td class="table-td__right">
                                            <span><fmt:formatNumber value="${cartTotalPrice}" type="currency" currencySymbol=""/></span>
                                            <span style="font-size:0.9em; color:#5d5d5d; padding-left:2px;">원</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table-td__left">총 적립액</td>
                                        <c:set var="saving" value="${cartTotalPrice * 0.005}"/>
                                        <td class="table-td__right">
                                            <span style="color:cornflowerblue"><fmt:formatNumber value="${saving}" type="currency" currencySymbol=""/></span>
                                            <span style="font-size:0.9em; color:#5d5d5d; padding-left:2px;">원</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table-td__left">배송비</td>
                                        <td class="table-td__right">
                                            <span><fmt:formatNumber value="3000" type="currency" currencySymbol=""/></span>
                                            <span style="font-size:0.9em; color:#5d5d5d; padding-left:2px;">원</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table-td__left">총 결제금액</td>
                                        <td class="table-td__right">
                                            <span style="font-size:1.5em; color:crimson;"><fmt:formatNumber value="${cartTotalPrice}" type="currency" currencySymbol=""/></span>
                                            <span style="font-size:1.0em;">원</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- 현금으로 결제시 모듈 -->
                        <div class="col-md-6" style="float:left;">
                            <div class="col-md-6" style="float:left; padding-top:5px;">
                                <span>현금으로 결제시</span><br/>
                                <span style="font-size:0.7em; color: #aaaaaa;">적립금 2배 적립의 혜택이 있습니다.</span>
                            </div>
                            <div class="col-md-6" style="float:left">
                                <table class="table" style="float:right; width:250px;">
                                    <tbody>
                                    <tr>
                                        <td class="table-td__left">총 상품금액</td>
                                        <td class="table-td__right">
                                            <span><fmt:formatNumber value="${cartTotalPrice}" type="currency" currencySymbol=""/></span>
                                            <span style="font-size:0.9em; color:#5d5d5d; padding-left:2px;">원</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table-td__left">총 적립액</td>
                                        <c:set var="saving" value="${cartTotalPrice * 0.010}"/>
                                        <td class="table-td__right">
                                            <span style="color:cornflowerblue"><fmt:formatNumber value="${saving}" type="currency" currencySymbol=""/></span>
                                            <span style="font-size:0.9em; color:#5d5d5d; padding-left:2px;">원</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table-td__left">배송비</td>
                                        <td class="table-td__right">
                                            <span><fmt:formatNumber value="3000" type="currency" currencySymbol=""/></span>
                                            <span style="font-size:0.9em; color:#5d5d5d; padding-left:2px;">원</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="table-td__left">총 결제금액</td>
                                        <td class="table-td__right">
                                            <span style="font-size:1.5em; color:crimson;"><fmt:formatNumber value="${cartTotalPrice}" type="currency" currencySymbol=""/></span>
                                            <span style="font-size:1.0em;">원</span>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- 결제 모듈 끝 -->

                    <!-- 선택/주문하기 -->
                    <div class="text-right" style="width:100%; height:auto; padding:0px 5px 10px 5px;">
                        <a href="javascript:void(0)" class="btn btn-primary" style="padding:15px 20px; border-radius:0px; ">선택 주문하기</a>
                        <a href="javascript:void(0)" class="btn btn-danger" style="padding:15px 20px; border-radius:0px; ">전체 주문하기</a>
                    </div>
                    <!-- 선택/주문하기 끝 -->
                </div>
            </c:otherwise>
        </c:choose>
        <style>
            .cart-info > span{
                display:block;
            }
        </style>
        <div style="border:1px solid #ddd; padding:2px; height:200px; margin:0 auto;">
            <div style="border:1px solid #ddd; padding:2px; height:100%;">
                <!-- 임시방편 padding; 수정 필요 -->
                <div class="col-md-3 cart-info" style="float:left; width:100%; height:100%; padding-top:60px; padding-left:60px;">
                    <div style="float:left;"><span style="font-size:4.0em;"><i class="fas fa-info-circle"></i></span></div>
                    <div style="float:left; padding-left:10px; padding-top:10px;"><span style="font-size:0.8em;">이용안내<br> 꼭 확인하세요.</span></div>
                </div>
                <div class="col-md-9 cart-info" style="float:left; padding-top:50px;">
                    <span><strong>장바구니 이용안내</strong></span>
                    <span style="font-size:0.8em;"><strong>-</strong>&nbsp;장바구니에 담긴 제품은 회원의 경우 15일, 비회원의 경우 2일 보관됩니다. 단, 행사제품은 1일간 보관됩니다.</span>
                    <span style="font-size:0.8em;"><strong>-</strong>&nbsp;회원 등급과 결제 금액에 따라 무료배송 혜택이 적용됩니다.</span>
                    <span style="font-size:0.8em;"><strong>-</strong>&nbsp;일반/오피스 사무용품에 한하여 3만원 이상 구매 시 1박스가 무료배송됩니다.</span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end--show -->
<%@ include file="./layout/hikoco_footer.jsp"%>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        // document.getElementById('hikoco-nav').style.height = 66;
        document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0.8)';
    });

    // function scrollFunction() {
    //     if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
    //         // document.getElementById('hikoco-nav').style.height = 66;
    //         // document.getElementById('hikoco-nav').classList.add('animated');
    //         // document.getElementById('hikoco-nav').classList.add('fadeIn');
    //         document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0.8)';
    //     } else {
    //         // document.getElementById('hikoco-nav').style.height = 66;
    //         // document.getElementById('hikoco-nav').classList.add('animated');
    //         // document.getElementById('hikoco-nav').classList.add('fadeOut');
    //         document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0)';
    //     }
    // }
</script>
</html>
