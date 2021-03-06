<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html ng-cloak ng-app="app">
<head>
    <title>HIKOCO :: ITEM</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../../resources/script/global.css">
    <%@ include file="../essential/base.jsp" %>

    <style>
        .list-group-item:first-child {
            border-top-left-radius: 0px;
            border-top-right-radius: 0px;
        }

        .list-group-item:last-child {
            border-bottom-left-radius: 0px;
            border-bottom-right-radius: 0px;
        }

        .list-group > a {
            font-size: 12px;
        }

        .category-td-parent-item {
            padding: 0px !important;
            width: 144px;
            border-right: 0px;
        }

        .category-td-parent-item > a {
            font-size: 12px;
            margin: 0px;
            padding: 5px;
            border-top: 0px;
            border-right: 0px;
        }

        .category-td-child-item {
            padding: 0px !important;
            width: 144px;
            border-top: 0px !important;
            border-right: 0px;
        }

        .category-td-child-item > a {
            font-size: 12px;
            margin: 0px;
            padding: 5px;
            border-top: 0px !important;
            border-right: 0px;
        }

        .last-row {
            border-right: 1px solid #ddd !important;
        }

        /* modal-lg inline size */
        .modal-lg {
            max-width: 1000px;
        }

        .modal-span {
            display: block;
        }

        .modal-body {
            height: 1000px;
            overflow-y: scroll;
        }

        #myBtn {
            display: none; /* Hidden by default */
            position: fixed; /* Fixed/sticky position */
            bottom: 20px; /* Place the button at the bottom of the page */
            right: 30px; /* Place the button 30px from the right */
            z-index: 99; /* Make sure it does not overlap */
            border: none; /* Remove borders */
            outline: none; /* Remove outline */
            background-color: red; /* Set a background color */
            color: white; /* Text color */
            cursor: pointer; /* Add a mouse pointer on hover */
            padding: 15px; /* Some padding */
            border-radius: 10px; /* Rounded corners */
            font-size: 18px; /* Increase font size */
        }

        #myBtn:hover {
            background-color: #555; /* Add a dark-grey background on hover */
        }
    </style>
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

<!-- JSTL 태그 사용시 인용부호 특수문자 사용법에 유의할 것.  -->
<c:set var="isSearch" scope="session" value="<%=request.getParameter(\"mode\")%>" />
<c:if test="${isSearch eq 'search'}">
    <c:set var="searchString" scope="session" value="<%=request.getParameter(\"search_string\")%>" />
</c:if>

<body ng-controller="ctrl">
<%--<%@ include file="layout/hikoco_login_popup.jsp" %>--%>
<%@ include file="layout/hikoco_navbar.jsp" %>

<div id="show" style="padding:60px 0; padding-bottom:170px; text-align: center;">
    <c:choose>
        <c:when test="${isSearch eq 'search'}">
            <div class="container text-center" style="margin-top:20px; height:150px; line-height: 150px; background: #ddd;">
                <span style="font-size:1em;">${searchString} (으)로 검색하신 결과입니다.</span>
            </div>
        </c:when>
        <c:otherwise/>
    </c:choose>

    <div class="text-center" style="display:inline-block; padding:20px; margin:0 auto;">
        <div class="container text-center" style="float:left; overflow-x:hidden; border:1px solid #ddd; padding:20px;">
            <div>

                <!-- 카테고리 -->
                <%--<table class="table">--%>
                <%--<tbody>--%>
                <%--<c:set var="cat_height" value="<%=cat_height%>" scope="page"/>--%>
                <%--&lt;%&ndash;<c:set var="e" value="<%=new AbstractMap.SimpleEntry<Integer, String>%>"/>&ndash;%&gt;--%>
                <%--<!-- 제일 첫번째와 마지막을 제외하고는 오른쪽 border 삭제해야함 -->--%>
                <%--<%--%>
                <%--// 첫번째 여섯개의 카테고리는 parent css를 적용해야함--%>
                <%--Map.Entry<Integer, String> e;--%>
                <%--while(it.hasNext()){--%>
                <%--%>--%>
                <%--<c:forEach var="i" begin="1" end="${cat_height}" step="1">--%>
                <%--<c:choose>--%>
                <%--<c:when test="${i == 1}">--%>
                <%--<tr>--%>
                <%--<div class="category-td-parent" style="display:block">--%>
                <%--<c:forEach var="j" begin="1" end="5" step="1">--%>
                <%--<% if(it.hasNext()){ e = it.next(); %>--%>
                <%--<td class="category-td-parent-item"><a href="#" class="list-group-item list-group-item-action" style="background-color: #eee;"><%=e.getValue()%> (###)</a></td>--%>
                <%--<% }else{ %>--%>
                <%--<td class="category-td-parent-item"><a href="#" class="list-group-item list-group-item-action">&nbsp;</a></td>--%>
                <%--<% } %>--%>
                <%--</c:forEach>--%>
                <%--<% if(it.hasNext()){ e = it.next(); %>--%>
                <%--<td class="category-td-parent-item last-row"><a href="#" class="list-group-item list-group-item-action" style="background-color: #eee;"><%=e.getValue()%> (###)</a></td>--%>
                <%--<% }else{ %>--%>
                <%--<td class="category-td-parent-item last-row"><a href="#" class="list-group-item list-group-item-action">&nbsp;</a></td>--%>
                <%--<% } %>--%>
                <%--</div>--%>
                <%--</tr>--%>
                <%--</c:when>--%>
                <%--<c:when test="${i >= 2}">--%>
                <%--<tr>--%>
                <%--<div class="category-td-child" style="display:block">--%>
                <%--<c:forEach var="j" begin="1" end="5" step="1">--%>
                <%--<% if(it.hasNext()){ e = it.next(); %>--%>
                <%--<td class="category-td-child-item"><a href="#" class="list-group-item list-group-item-action" style="background-color: #eee;"><%=e.getValue()%> (###)</a></td>--%>
                <%--<% }else{ %>--%>
                <%--<td class="category-td-child-item"><a href="#" class="list-group-item list-group-item-action">&nbsp;</a></td>--%>
                <%--<% } %>--%>
                <%--</c:forEach>--%>
                <%--<% if(it.hasNext()){ e = it.next(); %>--%>
                <%--<td class="category-td-child-item last-row"><a href="#" class="list-group-item list-group-item-action" style="background-color: #eee;"><%=e.getValue()%> (###)</a></td>--%>
                <%--<% }else{ %>--%>
                <%--<td class="category-td-child-item last-row"><a href="#" class="list-group-item list-group-item-action">&nbsp;</a></td>--%>
                <%--<% } %>--%>
                <%--</div>--%>
                <%--</tr>--%>
                <%--</c:when>--%>
                <%--</c:choose>--%>
                <%--</c:forEach>--%>
                <%--<% } %>--%>
                <%--</tbody>--%>
                <%--</table>--%>
                <!-- 아이템 검색 -->
            </div>
            <div class="text-right" style="margin-bottom:10px; padding-right:10px;">
                <span><strong>${listcount}</strong></span>
                <span style="font-size:12px;">페이지 수 :&nbsp;</span>
                <input type="text" id="pageNum" size="1" maxlength="3" value="10" style="font-size:12px;">
            </div>
            <div>
                <div class="list-group" style="margin-bottom:15px;">
                    <!-- a tag starts -->
                    <a href="#" class="list-group-item list-group-item-action" style="background:rgba(168,217,234,0.3)">
                        <div class="text-left">
                            <div style="margin-bottom:5px; border:1px dashed #5d5d5d; display:inline-block; padding:0px 10px 2px 10px;background: #fff">
                                <span style="font-size:14px;"><i class="fas fa-thumbs-up"></i>&nbsp;<strong>Signature Item</strong></span>
                            </div>
                            <br> <!-- newline -->
                            <div style="float:left; margin-right:5px;">
                                <input type="checkbox">
                            </div>
                            <div class="item-wrapper" style="height:70px ;">
                                <!-- 사진 -->
                                <div class="" style="float:left;">
                                    <img src="/resources/imgs/margarette.png" width="100px "
                                         style="border:1px solid #ddd;">
                                </div>
                                <!-- 내용 -->
                                <div class="col-md-10" style="float:left; padding-left:0px;">
                                    <div class="col-md-6" style="display:block; float:left;">
                                        <span><strong>[PALIT] GeForce GTX1060 Dual D5 6GB </strong></span>
                                    </div>
                                    <br> <!-- new line -->
                                    <div class="col-md-12" style="display:block; float:left;">
                                        <span>지포스 GTX1060 / GDDR5 6GB / 1506MHz / 최대 1708MHz / 8000MHz / 192-bit / 히트파이프+팬 / PCI-Express x16(3.0)</span>
                                    </div>
                                    <br> <!-- new line -->
                                    <div class="col-md-12" style="display:block;">
                                        <span class="span-loginInfo"
                                              style="font-size:10px; padding:0px 5px 0px 5px; background: #2897d3; color:#fff; border-radius:0px; display: inline-block;">사은품</span>
                                        <span style="font-size:11px; vertical-align: middle !important;">&nbsp;구매영수증 인증 시 메로나 아이스크림 증정 (05.01~05.31)</span>
                                    </div>
                                    <div class="col-md-12" style="display:block;">
                                        <span class="span-loginInfo"
                                              style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>
                                        <span style="font-size:11px; vertical-align: middle !important;">&nbsp;후기 작성 후 별도의 신청 시 스타벅스 캔커피 증정 (05.01~05.31)</span>
                                    </div>
                                    <div class="col-md-12" style="display:block; ">
                                        <span class="span-loginInfo"
                                              style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>
                                        <span style="font-size:11px; vertical-align: middle !important;">&nbsp;후기 작성 후 별도의 신청을 하신 6분께 LED 삼각대 증정 (05.01~05.31)</span>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <%--<hr style="margin:5px 0px 5px 0px;">--%>
                            <%--<!-- 상태 -->--%>
                            <%--<div class="col-md-3" style="float:left; padding:0px;"><span>해당 상품을 구매한 이력이 있습니다.</span></div>--%>
                        </div>
                    </a>
                    <!-- a tag ends -->
                    <c:forEach var="i" items="${cnt}">
                        <!-- a tag starts -->
                        <a href="/shop/item/${i.item_id}" class="list-group-item list-group-item-action"
                           style="">
                            <div class="text-left">
                                <div style="float:left; margin-right:5px;">
                                    <input type="checkbox">
                                </div>
                                <div class="item-wrapper" style="height:70px ;">
                                    <!-- 사진 -->
                                    <div class="" style="float:left;">
                                        <img src="${i.item_pic}" width="100px " style="border:1px solid #ddd;">
                                    </div>
                                    <!-- 내용 -->
                                    <div class="col-md-10" style="float:left; padding-left:0px;">
                                        <div class="col-md-6" style="display:block; float:left;">
                                            <span><strong>${i.item_title}</strong></span>
                                        </div>
                                        <br> <!-- new line -->
                                        <div class="col-md-12" style="display:block; float:left;">
                                            <span>${i.item_summary}</span>
                                        </div>
                                        <br> <!-- new line -->
                                        <div class="col-md-12" style="display:block;">
                                            <span class="span-loginInfo"
                                                  style="font-size:10px; padding:0px 5px 0px 5px; background: #2897d3; color:#fff; border-radius:0px; display: inline-block;">사은품</span>
                                            <span style="font-size:11px; vertical-align: middle !important;">&nbsp;구매영수증 인증 시 메로나 아이스크림 증정 (05.01~05.31)</span>
                                        </div>
                                        <div class="col-md-12" style="display:block;">
                                            <span class="span-loginInfo"
                                                  style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>
                                            <span style="font-size:11px; vertical-align: middle !important;">&nbsp;후기 작성 후 별도의 신청 시 스타벅스 캔커피 증정 (05.01~05.31)</span>
                                        </div>
                                        <div class="col-md-12" style="display:block; ">
                                            <span class="span-loginInfo"
                                                  style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>
                                            <span style="font-size:11px; vertical-align: middle !important;">&nbsp;후기 작성 후 별도의 신청을 하신 6분께 LED 삼각대 증정 (05.01~05.31)</span>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                    <%--<hr style="margin:5px 0px 5px 0px;">--%>
                                    <%--<!-- 상태 -->--%>
                                    <%--<div class="col-md-3" style="float:left; padding:0px;"><span>해당 상품을 구매한 이력이 있습니다.</span></div>--%>
                            </div>
                        </a>
                        <!-- a tag ends -->
                    </c:forEach>
                </div>

                <style>
                    .page-link{
                        color:#000;
                    }
                </style>

                <div style="display:inline-block; margin:0 auto;">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${isSearch eq 'search'}">
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="/shop/item?mode=${isSearch}&search_string=${searchString}&page=1">1</a></li>
                                    <li class="page-item"><a class="page-link" href="/shop/item?mode=${isSearch}&search_string=${searchString}&page=2">2</a></li>
                                    <li class="page-item"><a class="page-link" href="/shop/item?mode=${isSearch}&search_string=${searchString}&page=3">3</a></li>
                                    <li class="page-item"><a class="page-link" href="/shop/item?mode=${isSearch}&search_string=${searchString}&page=4">4</a></li>
                                    <li class="page-item"><a class="page-link" href="/shop/item?mode=${isSearch}&search_string=${searchString}&page=5">5</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                    </li>
                                    <li class="page-item"><a class="page-link" href="/shop/item?mode=${isSearch}&page=1">1</a></li>
                                    <li class="page-item"><a class="page-link" href="/shop/item?mode=${isSearch}&page=2">2</a></li>
                                    <li class="page-item"><a class="page-link" href="/shop/item?mode=${isSearch}&page=3">3</a></li>
                                    <li class="page-item"><a class="page-link" href="/shop/item?mode=${isSearch}&page=4">4</a></li>
                                    <li class="page-item"><a class="page-link" href="/shop/item?mode=${isSearch}&page=5">5</a></li>
                                    <li class="page-item">
                                        <a class="page-link" href="#" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </c:otherwise>
                            </c:choose>

                        </ul>
                    </nav>

                </div>

                <div class="input-group mb-3" style="margin:0 auto; width:200px">
                    <input type="text" class="form-control" placeholder="검색어" aria-label="Recipient's username"
                           aria-describedby="basic-addon2" style="font-size:12px; height:30px;">
                    <div class="input-group-append">
                        <button class="btn btn-sm btn-outline-secondary" type="button">검색</button>
                    </div>
                </div>

            </div>

        </div>
    </div>

</div>
<%@ include file="layout/hikoco_footer.jsp" %>
</body>
<script>
    document.addEventListener("DOMContentLoaded", function (event) {
        // document.getElementById('hikoco-nav').style.height = 66;
        document.getElementById('hikoco-nav').style.background = 'rgba(0,0,0,0.8)';
    });
</script>
</html>
