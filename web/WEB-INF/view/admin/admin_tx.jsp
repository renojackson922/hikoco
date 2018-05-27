<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="org.silkdog.maven.hikoco.transaction.dto.TransactionDTO" %>

<%
    TransactionDTO tdto = (TransactionDTO)request.getAttribute("tdto");
    String isDiscountParse;
    if(Integer.parseInt(tdto.getIs_discount()) == 1){
        isDiscountParse = "TRUE";
    }else{
        isDiscountParse = "FALSE";
    }
    String itemcostOriginalStr = String.format("%,d", tdto.getItemcost_original());
    String itemcostActualStr = String.format("%,d", tdto.getItemcost_actual());
    //System.out.println(itemcostOriginalStr);

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HIKOCO :: ADMIN</title>
    <!-- Vue.js Development -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <!-- Bootstrap 4.1.1 & jQuery-Slim -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
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
    <style>
        .pubg-left{

        }
        .list-group-item:first-child{
            border-top-left-radius:0px;
            border-top-right-radius:0px;
        }
        .list-group-item:last-child{
            border-bottom-left-radius:0px;
            border-bottom-right-radius:0px;
        }
        .list-group > a{
            font-size:12px;
        }
        .col-md-2, .col-md-3, .col-md-6, .col-md-10,.col-md-12{
            /*padding:0px;*/
        }
    </style>
</head>
<body>
<div class="container" style="border:1px solid #ddd; margin-top:20px; padding:15px 15px 0px 0px; height:900px;">
    <%@ include file="../layout/hikoco_admin_left.jsp" %>
    <div class="pubg-right col-md-10 text-center" style="float:left; overflow-x:hidden; border:1px solid #ddd;">
        <span style="font-size:44px;"><strong>Transaction</strong></span>
        <p>판매자와 구매자 간의 거래내역을 조회합니다.</p>
        <div class="text-right" style="margin-bottom:10px; padding-right:10px;">
            <span style="font-size:12px;">페이지 수 :&nbsp;</span>
            <input type="text" id="pageNum" size="1" maxlength="3" value="10" style="font-size:12px;">
        </div>
        <div>
            <div class="list-group" style="margin-bottom:15px;">

                <a href="#" class="list-group-item list-group-item-action">
                    <div class="text-left">
                        <span><strong>TX No.03</strong></span><br>
                        <hr style="margin:5px 0px 5px 0px;">
                        <div class="col-md-3" style="display:block; float:left;">
                            <span>판매자: <strong>Hewlett-Packard Company</strong></span>
                        </div>
                        <div class="col-md-3" style="float:left;">
                            <span>구매자: <strong>윤종호 (Seoulsoldier)</strong></span>
                        </div><br>
                        <div class="col-md-3" style="display:block; float:left;">
                            <span>구매일자: <strong>2018-05-01 13:04:26</strong></span>
                        </div>
                        <div class="col-md-3" style="float:left;">
                            <span>품목번호: <strong>442250</strong></span>
                        </div><br>
                        <div class="col-md-12" style="display:block; float:left;"><span>구매품목: <strong>[HP] ProBook 450 G5 2XG23PA [기본제품] </strong></span></div><br>
                        <div class="col-md-3" style="float:left;"><span>등록가격: <strong>1,037,000원</strong></span></div>
                        <div class="col-md-3" style="float:left;"><span>구매가격: <strong>936,940원</strong></span></div>
                        <div class="col-md-3" style="float:left;"><span>할인적용: <strong>TRUE</strong></span></div><br>
                        <hr style="margin:5px 0px 5px 0px;">
                        <div class="col-md-3" style="float:left;"><span>상태: <strong>배송 중</strong></span></div>
                    </div>
                </a>
                <a href="#" class="list-group-item list-group-item-action">
                    <div class="text-left">
                        <span><strong>TX No.02</strong></span><br>
                        <hr style="margin:5px 0px 5px 0px;">
                        <div class="col-md-3" style="display:block; float:left;">
                            <span>판매자: <strong>GIGABYTE</strong></span>
                        </div>
                        <div class="col-md-3" style="float:left;">
                            <span>구매자: <strong>윤종호 (Seoulsoldier)</strong></span>
                        </div><br>
                        <div class="col-md-3" style="display:block; float:left;">
                            <span>구매일자: <strong>2018-05-01 13:04:26</strong></span>
                        </div>
                        <div class="col-md-3" style="float:left;">
                            <span>품목번호: <strong>442250</strong></span>
                        </div><br>
                        <div class="col-md-12" style="display:block; float:left;"><span>구매품목: <strong>[GIGABYTE] GeForce GTX1080 Ti AORUS Xtreme D5X 11GB 워터블럭  </strong></span></div><br>
                        <div class="col-md-3" style="float:left;"><span>등록가격: <strong>1,405,000원 </strong></span></div>
                        <div class="col-md-3" style="float:left;"><span>구매가격: <strong>1,405,000원 </strong></span></div>
                        <div class="col-md-3" style="float:left;"><span>할인적용: <strong>FALSE</strong></span></div><br>
                        <hr style="margin:5px 0px 5px 0px;">
                        <div class="col-md-3" style="float:left;"><span>상태: <strong>배송 중</strong></span></div>
                    </div>
                </a>
                <a href="#" class="list-group-item list-group-item-action" style="background-color:#ddd;">
                    <div class="text-left">
                        <span><strong>TX No.01</strong></span><br>
                        <hr style="margin:5px 0px 5px 0px;">
                        <div class="item-wrapper" style="height:70px ;">
                            <!-- 사진 -->
                            <div class="" style="float:left;">
                                <img src="/resources/imgs/margarette.png" width="90px" style="border:1px solid #ddd;">
                            </div>
                            <!-- 내용 -->
                            <div class="col-md-10" style="float:left; padding-left:0px;">
                                <div class="col-md-6" style="display:block; float:left;">
                                    <span>판매자: <strong>Hewlett-Packard Company Korea</strong></span>
                                </div>
                                <div class="col-md-6" style="float:left;">
                                    <span>구매자: <strong>윤종호 (Seoulsoldier)</strong></span>
                                </div><br> <!-- new line -->
                                <div class="col-md-6" style="display:block; float:left;">
                                    <span>구매일자: <strong>2018-05-01 13:04:26</strong></span>
                                </div>
                                <div class="col-md-6" style="float:left;">
                                    <span>품목번호: <strong>442250</strong></span>
                                </div><br> <!-- new line -->
                                <div class="col-md-12" style="display:block; float:left;"><span>구매품목: <strong>[HP] ProBook 450 G5 2XG23PA [기본제품] </strong></span></div><br>
                                <div class="col-md-3" style="float:left;"><span>등록가격: <strong>1,037,000원</strong></span></div>
                                <div class="col-md-3" style="float:left;"><span>구매가격: <strong>936,940원</strong></span></div>
                                <div class="col-md-3" style="float:left;"><span>할인적용: <strong>TRUE</strong></span></div><br>  <!-- new line -->
                                <div class="col-md-3">기타: <strong>N/A</strong></div>
                            </div>
                        </div><br>
                        <hr style="margin:5px 0px 5px 0px;">
                        <!-- 상태 -->
                        <div class="col-md-3" style="float:left; padding:0px;"><span>상태: <strong>거래완료</strong></span></div>
                    </div>
                </a>

                <!-- FOR -->
                <% %>
                <a href="#" class="list-group-item list-group-item-action" style="background-color:#ddd;">
                    <div class="text-left">
                        <span><strong>TX No.<%=tdto.getNo()%></strong></span><br>
                        <hr style="margin:5px 0px 5px 0px;">
                        <div class="item-wrapper" style="height:70px ;">
                            <!-- 사진 -->
                            <div class="" style="float:left;">
                                <img src="/resources/imgs/margarette.png" width="90px" style="border:1px solid #ddd;">
                            </div>
                            <!-- 내용 -->
                            <div class="col-md-10" style="float:left; padding-left:0px;">
                                <div class="col-md-6" style="display:block; float:left;">
                                    <span>판매자: <strong><%=tdto.getSeller()%></strong></span>
                                </div>
                                <div class="col-md-6" style="float:left;">
                                    <span>구매자: <strong><%=tdto.getPurchaser_rn()%> (<%=tdto.getPurchaser_id()%>)</strong></span>
                                </div><br> <!-- new line -->
                                <div class="col-md-6" style="display:block; float:left;">
                                    <span>구매일자: <strong><%=tdto.getPurdate()%></strong></span>
                                </div>
                                <div class="col-md-6" style="float:left;">
                                    <span>품목번호: <strong><%=tdto.getItemno()%></strong></span>
                                </div><br> <!-- new line -->
                                <div class="col-md-12" style="display:block; float:left;"><span>구매품목: <strong><%=tdto.getItemname()%> </strong></span></div><br>
                                <div class="col-md-3" style="float:left;"><span>등록가격: <strong><%=itemcostOriginalStr%>원</strong></span></div>
                                <div class="col-md-3" style="float:left;"><span>구매가격: <strong><%=itemcostActualStr%>원</strong></span></div>
                                <div class="col-md-3" style="float:left;"><span>할인적용: <strong><%=isDiscountParse%></strong></span></div><br>  <!-- new line -->
                                <div class="col-md-3">기타: <strong><%=tdto.getExtrainfo()%></strong></div>
                            </div>
                        </div><br>
                        <hr style="margin:5px 0px 5px 0px;">
                        <!-- 상태 -->
                        <div class="col-md-3" style="float:left; padding:0px;"><span>상태: <strong><%=tdto.getShip_status()%></strong></span></div>
                    </div>
                </a>
                <% %>
            </div>
            <div style="margin-bottom:15px;">
                <span style="display:block; font-size:12px; text-align:center;"><strong>[1]</strong></span>
            </div>

            <div class="input-group mb-3" style="margin:0 auto; width:200px">
                <input type="text" class="form-control" placeholder="검색어" aria-label="Recipient's username" aria-describedby="basic-addon2" style="font-size:12px; height:30px;">
                <div class="input-group-append">
                    <button class="btn btn-sm btn-outline-secondary" type="button">검색</button>
                </div>
            </div>

        </div>
    </div>
<%--TEST : ${admin2}--%>

</div>
</body>
</html>
