<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="java.util.*, org.silkdog.maven.hikoco.category.dao.*, org.silkdog.maven.hikoco.category.dto.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    int count = (int) request.getAttribute("count");
    List<CategoryDTO> clist = (List<CategoryDTO>) request.getAttribute("clist");

    int cat_height;
    // rowNum 도 추가할 것
    float countDIV = (float) count / 6;

    System.out.println("count를 나눈 값: " + countDIV);
    if (countDIV > (int) Math.ceil(count / 6)) {
        cat_height = (int) Math.ceil(count / 6) + 1;
    } else {
        cat_height = (int) Math.ceil(count / 6);
    }
    System.out.println("count를 반올림한 값 :" + cat_height);

    HashMap map = new HashMap<Integer, String>();
    for (CategoryDTO cdto : clist) {
        map.put(cdto.getHic_id(), cdto.getHic_val());
    }

    Set<Map.Entry<Integer, String>> set = map.entrySet();
    Iterator<Map.Entry<Integer, String>> it = set.iterator();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HIKOCO :: ADMIN</title>
    <!-- Vue.js Development -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- Bootstrap 4.1.1 & jQuery-Slim -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <!-- 주의! animated 를 위해서 slim 이 아닌 uncompressed를 사용했음. 문제를 해결하면 slim 으로 바꿀 것 -->
    <script src="http://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"
            integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T"
            crossorigin="anonymous"></script>
    <!-- Load Montstreet Fonts -->
    <link rel="stylesheet" href="/public/css/fonts.css">
    <!-- Font-Awesome -->
    <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js"
            integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl"
            crossorigin="anonymous"></script>
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
    <style>
        .pubg-left {

        }

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

</head>
<body>
<div class="container" style="border:1px solid #ddd; margin-top:20px; padding:15px 15px 0px 0px; height:1000px;">
    <%@ include file="../layout/hikoco_admin_left.jsp" %>
    <div class="pubg-right col-md-10 text-center" style="float:left; overflow-x:hidden; border:1px solid #ddd;">
        <span style="font-size:44px;"><strong>MarketList</strong></span>
        <p>판매 중인 품목을 관리합니다.</p>
        <!-- 카테고리 -->
        <table class="table">
            <tbody>
            <c:set var="cat_height" value="<%=cat_height%>" scope="page"/>
            <%--<c:set var="e" value="<%=new AbstractMap.SimpleEntry<Integer, String>%>"/>--%>
            <!-- 제일 첫번째와 마지막을 제외하고는 오른쪽 border 삭제해야함 -->
            <%
                // 첫번째 여섯개의 카테고리는 parent css를 적용해야함
                Map.Entry<Integer, String> e;
                while (it.hasNext()) {
            %>
            <c:forEach var="i" begin="1" end="${cat_height}" step="1">
                <c:choose>
                    <c:when test="${i == 1}">
                        <tr>
                            <div class="category-td-parent" style="display:block">
                                <c:forEach var="j" begin="1" end="5" step="1">
                                    <% if (it.hasNext()) {
                                        e = it.next(); %>
                                    <td class="category-td-parent-item"><a href="#"
                                                                           class="list-group-item list-group-item-action"><%=e.getValue()%>
                                        (###)</a></td>
                                    <% } else { %>
                                    <td class="category-td-parent-item"><a href="#"
                                                                           class="list-group-item list-group-item-action">&nbsp;</a>
                                    </td>
                                    <% } %>
                                </c:forEach>
                                <% if (it.hasNext()) {
                                    e = it.next(); %>
                                <td class="category-td-parent-item last-row"><a href="#"
                                                                                class="list-group-item list-group-item-action"><%=e.getValue()%>
                                    (###)</a></td>
                                <% } else { %>
                                <td class="category-td-parent-item last-row"><a href="#"
                                                                                class="list-group-item list-group-item-action">&nbsp;</a>
                                </td>
                                <% } %>
                            </div>
                        </tr>
                    </c:when>
                    <c:when test="${i >= 2}">
                        <tr>
                            <div class="category-td-child" style="display:block">
                                <c:forEach var="j" begin="1" end="5" step="1">
                                    <% if (it.hasNext()) {
                                        e = it.next(); %>
                                    <td class="category-td-child-item"><a href="#"
                                                                          class="list-group-item list-group-item-action"><%=e.getValue()%>
                                        (###)</a></td>
                                    <% } else { %>
                                    <td class="category-td-child-item"><a href="#"
                                                                          class="list-group-item list-group-item-action">&nbsp;</a>
                                    </td>
                                    <% } %>
                                </c:forEach>
                                <% if (it.hasNext()) {
                                    e = it.next(); %>
                                <td class="category-td-child-item last-row"><a href="#"
                                                                               class="list-group-item list-group-item-action"><%=e.getValue()%>
                                    (###)</a></td>
                                <% } else { %>
                                <td class="category-td-child-item last-row"><a href="#"
                                                                               class="list-group-item list-group-item-action">&nbsp;</a>
                                </td>
                                <% } %>
                            </div>
                        </tr>
                    </c:when>
                </c:choose>
            </c:forEach>
            <% } %>
            </tbody>
        </table>
        <!-- 아이템 검색 -->
        <div class="text-right" style="margin-bottom:10px; padding-right:10px;">
            <span style="font-size:12px;">페이지 수 :&nbsp;</span>
            <input type="text" id="pageNum" size="1" maxlength="3" value="10" style="font-size:12px;">
        </div>
        <div>
            <div class="list-group" style="margin-bottom:15px;">

                <!-- a tag starts -->
                <a href="#" class="list-group-item list-group-item-action" data-toggle="modal"
                   data-target="#exampleModal" data-backdrop="static" data-keyboard="false"
                   style="background:rgba(168,217,234,0.3)">
                    <div class="text-left">
                        <div style="margin-bottom:5px; border:1px dashed #5d5d5d; display:inline-block; padding:0px 10px 2px 10px;background: #fff">
                            <span style="font-size:14px;"><i
                                    class="fas fa-thumbs-up"></i>&nbsp;<strong>Signature Item</strong></span>
                        </div>
                        <br> <!-- newline -->
                        <div style="float:left; margin-right:5px;">
                            <input type="checkbox">
                        </div>
                        <div class="item-wrapper" style="height:70px ;">
                            <!-- 사진 -->
                            <div class="" style="float:left;">
                                <img src="/resources/imgs/margarette.png" width="100px " style="border:1px solid #ddd;">
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

                <!-- a tag starts -->
                <a href="#" class="list-group-item list-group-item-action" style="">
                    <div class="text-left">
                        <div style="float:left; margin-right:5px;">
                            <input type="checkbox">
                        </div>
                        <div class="item-wrapper" style="height:70px ;">
                            <!-- 사진 -->
                            <div class="" style="float:left;">
                                <img src="/resources/imgs/margarette.png" width="100px " style="border:1px solid #ddd;">
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

                <!-- a tag starts -->
                <a href="#" class="list-group-item list-group-item-action" style="">
                    <div class="text-left">
                        <div style="float:left; margin-right:5px;">
                            <input type="checkbox">
                        </div>
                        <div class="item-wrapper" style="height:70px ;">
                            <!-- 사진 -->
                            <div class="" style="float:left;">
                                <img src="/resources/imgs/margarette.png" width="100px " style="border:1px solid #ddd;">
                            </div>
                            <!-- 내용 -->
                            <div class="col-md-10" style="float:left; padding-left:0px;">
                                <div class="col-md-6" style="display:block; float:left;">
                                    <span><strong>GIGABYTE] Radeon™ RX 580 AORUS D5 8GB </strong></span>
                                </div>
                                <br> <!-- new line -->
                                <div class="col-md-12" style="display:block; float:left;">
                                    <span>라데온 RX 580 / GDDR5 8GB / 1365MHz / 최대 1380MHz / 8000MHz / 256-bit / 히트파이프 + 팬 / PCI-Express x16(3.0)</span>
                                </div>
                                <br> <!-- new line -->
                                <div class="col-md-12" style="display:block;">
                                    <span class="span-loginInfo"
                                          style="font-size:10px; padding:0px 5px 0px 5px; background: #2897d3; color:#fff; border-radius:0px; display: inline-block;">사은품</span>
                                    <span style="font-size:11px; vertical-align: middle !important;">&nbsp;구매영수증 인증 시 메로나 아이스크림 증정 (05.01~05.31)</span>
                                </div>
                                <%--<div class="col-md-12" style="display:block;">--%>
                                <%--<span class="span-loginInfo" style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>--%>
                                <%--<span style="font-size:11px; vertical-align: middle !important;">&nbsp;후기 작성 후 별도의 신청 시 스타벅스 캔커피 증정 (05.01~05.31)</span>--%>
                                <%--</div>--%>
                                <%--<div class="col-md-12" style="display:block; ">--%>
                                <%--<span class="span-loginInfo" style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>--%>
                                <%--<span style="font-size:11px; vertical-align: middle !important;">&nbsp;후기 작성 후 별도의 신청을 하신 6분께 LED 삼각대 증정 (05.01~05.31)</span>--%>
                                <%--</div>--%>
                            </div>
                        </div>
                        <br>
                        <%--<hr style="margin:5px 0px 5px 0px;">--%>
                        <%--<!-- 상태 -->--%>
                        <%--<div class="col-md-3" style="float:left; padding:0px;"><span>해당 상품을 구매한 이력이 있습니다.</span></div>--%>
                    </div>
                </a>
                <!-- a tag ends -->

                <!-- a tag starts -->
                <a href="#" class="list-group-item list-group-item-action" style="">
                    <div class="text-left">
                        <div style="float:left; margin-right:5px;">
                            <input type="checkbox">
                        </div>
                        <div class="item-wrapper" style="height:70px ;">
                            <!-- 사진 -->
                            <div class="" style="float:left;">
                                <img src="/resources/imgs/margarette.png" width="100px " style="border:1px solid #ddd;">
                            </div>
                            <!-- 내용 -->
                            <div class="col-md-10" style="float:left; padding-left:0px;">
                                <div class="col-md-6" style="display:block; float:left;">
                                    <span><strong>[ASUS] ROG Gaming GL702ZC-BA108T </strong></span>
                                </div>
                                <br> <!-- new line -->
                                <div class="col-md-12" style="display:block; float:left;">
                                    <span>ASUS / AMD 라이젠7 1700 (3.0G) / 16GB RAM / 256GB SSD + 1TB HDD / ODD 미포함 / OS 탑재 / 17.3형 (43.9cm) / 1920x1080 (FHD) / AMD Radeon RX580 / 3.1~4Kg / Windows 10 / HDMI / Mini Display Port / USB3.0 / USB3.1 / USB Type-C / LAN</span>
                                </div>
                                <br> <!-- new line -->
                                <div class="col-md-12" style="display:block;">
                                    <span class="span-loginInfo"
                                          style="font-size:10px; padding:0px 5px 0px 5px; background: mediumaquamarine; color:#fff; border-radius:0px; display: inline-block;">무료배송</span>
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>
                </a>
                <!-- a tag ends -->

                <!-- a tag starts -->
                <a href="#" class="list-group-item list-group-item-action" style="">
                    <div class="text-left">
                        <div style="float:left; margin-right:5px;">
                            <input type="checkbox">
                        </div>
                        <div class="item-wrapper" style="height:70px;">
                            <!-- 사진 -->
                            <div class="" style="float:left;">
                                <img src="/resources/imgs/margarette.png" width="100px " style="border:1px solid #ddd;">
                            </div>
                            <!-- 내용 -->
                            <div class="col-md-10" style="float:left; padding-left:0px;">
                                <div class="col-md-6" style="display:block; float:left;">
                                    <span><strong>[DELL] Inspiron 5675 D923I5675102KR </strong></span>
                                </div>
                                <br> <!-- new line -->
                                <div class="col-md-12" style="display:block; float:left;">
                                    <span>DELL컴퓨터 / AMD 라이젠 R5-1400 (3.4G) / 8GB / 256GB SSD + 1TB HDD / DVD / Radeon RX 580 / Windows 10 / 64비트 / HDMI / USB2.0 / USB3.0 / USB3.1 / PS2 / LAN</span>
                                </div>
                                <br> <!-- new line -->
                                <div class="col-md-12" style="display:block;">
                                    <span class="span-loginInfo"
                                          style="font-size:10px; padding:0px 5px 0px 5px; background: mediumaquamarine; color:#fff; border-radius:0px; display: inline-block;">무료배송</span>
                                </div>
                            </div>
                        </div>
                        <br>
                    </div>
                </a>
                <!-- a tag ends -->


            </div>
            <div style="margin-bottom:15px;">
                <span style="display:block; font-size:12px; text-align:center;"><strong>[1]</strong></span>
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
    <%--TEST : ${admin2}--%>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     aria-hidden="true">
    <button onclick="topFunction()" id="myBtn" title="Go to top">Top</button>
    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
            <%--<div style="position:absolute; right:25px; bottom:100px; z-index:1;">--%>
            <%--<button id="myBtn" type="button" class="btn btn-info" onclick="topFunction()">TOP</button>--%>
            <%--</div>--%>

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">상세정보 보기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <!-- Temporary Style Lines -->
                <style>
                    .modal-body-wrapper {
                        margin-bottom: 15px;
                    }

                    .css-table {
                        display: table;
                    }

                    .css-table-row {
                        dispaly: table-row;
                    }

                    .css-table-cell {
                        display: table-cell;
                    }

                    .img-center {
                        display: block;
                        margin-left: auto;
                        margin-right: auto;
                        width: 100%;
                    }

                    .modal-option-item span {

                    }

                    .item-focus:focus {
                        background: #5d5d5d;
                        color: #fff;
                    }
                </style>

                <div class="modal-body-wrapper css-table">
                    <!-- 상품의 정보, Top -->
                    <div class="css-table-row">
                        <!-- 제목, 가격 등... -->
                        <div class="css-table-cell" style="float:left;">
                            <img src="/resources/imgs/margarette.png">
                            <div class="" style="display: block;">
                                <button class="btn btn-sm btn-outline-secondary" style="width:100%; margin-top:5px;">자세히
                                    보기
                                </button>
                                <button class="btn btn-sm btn-outline-secondary" style="width:100%; margin-top:5px;">자세히
                                    보기
                                </button>
                            </div>
                        </div>
                        <!-- 상품의 정보 -->
                        <div class="css-table-cell" style="float:left; margin-left:20px;">
                            <span class="modal-span"><strong>[PALIT] GeForce GTX1060 Dual D5 6GB</strong></span>
                            <span class="modal-span" style="font-size:12px; color:#5d5d5d;">NVIDIA Corporation&nbsp;&nbsp;|&nbsp;&nbsp;STCOM Inc.</span>
                            <span class="modal-span" style="font-size:12px;">지포스 GTX1060 / GDDR5 6GB / 1506MHz / 최대 1708MHz / 8000MHz / 192-bit / 히트파이프+팬 / PCI-Express x16(3.0)</span>
                            <div class="modal-span">
                                <span class="span-loginInfo"
                                      style="font-size:10px; padding:0px 5px 0px 5px; background: #2897d3; color:#fff; border-radius:0px; display: inline-block;">사은품</span>
                                <span style="font-size:11px; vertical-align: middle !important;">&nbsp;구매영수증 인증 시 메로나 아이스크림 증정 (05.01~05.31)</span>
                            </div>
                            <div class="modal-span">
                                <span class="span-loginInfo"
                                      style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>
                                <span style="font-size:11px; vertical-align: middle !important;">&nbsp;후기 작성 후 별도의 신청 시 스타벅스 캔커피 증정 (05.01~05.31)</span>
                            </div>
                            <div class="modal-span">
                                <span class="span-loginInfo"
                                      style="font-size:10px; padding:0px 5px 0px 5px; background: gold; color:#fff; border-radius:0px; display: inline-block; width:40px; text-align: center;">후기</span>
                                <span style="font-size:11px; vertical-align: middle !important;">&nbsp;후기 작성 후 별도의 신청을 하신 6분께 LED 삼각대 증정 (05.01~05.31)</span>
                            </div>
                            <!-- 옵션 -->
                            <div class="modal-option" style="margin-top:15px;">
                                <table class="table table-bordered">
                                    <tbody>
                                    <tr>
                                        <div class="modal-option-item"
                                             style="border:1px solid #ddd; min-width:150px; height:80px; padding:0px 5px 5px 5px; display:inline-block; margin-right:10px;">
                                            <span style="font-size:12px;">Mint</span>
                                        </div>
                                        <div class="modal-option-item"
                                             style="border:1px solid #ddd; min-width:150px; height:80px; padding:0px 5px 5px 5px; display:inline-block; margin-right:10px;">
                                            <span style="font-size:12px;">Mint + M.2 SSD 512GB</span>
                                        </div>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- 가격 -->
                            <div class="modal-price text-right text-bottom">
                                <div style="display:inline-block; border:1px solid coral; border-radius:4px; vertical-align:bottom; padding:5px 10px 5px 10px;">
                                    <span style="font-size:18px; color:coral"><strong>&#8361;&nbsp;1,000,000</strong></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <!-- 상품의 디테일, Bottom -->
                <div class="modal-body-wrapper" style="display:block;">
                    <!-- Title -->
                    <div style="margin-bottom:15px;">
                        <%--<h5>상품 상세설명</h5>--%>
                    </div>
                    <!-- button goes here -->
                    <div>
                        <table class="table text-center">
                            <tbody>
                            <tr>
                                <div class="category-td-parent" style="display:block">
                                    <td class="category-td-parent-item"><a href="#"
                                                                           class="list-group-item list-group-item-action item-focus"
                                                                           onclick="window.location.hash='item-describe'">상세정보</a>
                                    </td>
                                    <td class="category-td-parent-item"><a href="#"
                                                                           class="list-group-item list-group-item-action item-focus"
                                                                           onclick="window.location.hash='item-specinfo'">상품정보제공고시</a>
                                    </td>
                                    <td class="category-td-parent-item"><a href="#"
                                                                           class="list-group-item list-group-item-action item-focus"
                                                                           onclick="window.location.hash='item-comment'">이용후기&nbsp;(0)</a>
                                    </td>
                                    <td class="category-td-parent-item"><a href="#"
                                                                           class="list-group-item list-group-item-action item-focus"
                                                                           onclick="window.location.hash='item-review'">뉴스/리뷰&nbsp;(0)</a>
                                    </td>
                                    <td class="category-td-parent-item"><a href="#"
                                                                           class="list-group-item list-group-item-action item-focus"
                                                                           onclick="window.location.hash='item-qna'">상품Q&A</a>
                                    </td>
                                    <td class="category-td-parent-item last-row"><a href="#"
                                                                                    class="list-group-item list-group-item-action item-focus"
                                                                                    onclick="window.location.hash='item-refund'">배송/교환/환불</a>
                                    </td>
                                </div>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- Detail goes here -->
                    <div>
                        <div id="item-describe">
                            <img class="img-center" src="/resources/imgs/222.jpg">
                        </div>
                        <div id="item-specinfo" style="height:300px;">
                            <p>
                                ASSASSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSASS</p>
                        </div>
                        <div id="item-comment" style="height:300px;">
                            <p>
                                ASSASSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSASS</p>
                        </div>
                        <div id="item-review" style="height:300px;">
                            <p>
                                ASSASSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSASS</p>
                        </div>
                        <div id="item-qna" style="height:300px;">
                            <p>
                                ASSASSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSASS</p>
                        </div>
                        <div id="item-refund" style="height:300px;">
                            <p>
                                ASSASSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSSASSASSASSASSASSASSASSASSASS</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>


</body>
<script>
    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function () {
        scrollFunction()
    };

    function scrollFunction() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            document.getElementById("myBtn").style.display = "block";
        } else {
            //document.getElementById("myBtn").style.display = "none";
            document.getElementById("myBtn").style.display = "block";
        }
    }

    // When the user clicks on the button, scroll to the top of the document
    function topFunction() {
        document.body.scrollTop = 0; // For Safari
        document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
    }
</script>
</html>

<!--
박제용

-->
