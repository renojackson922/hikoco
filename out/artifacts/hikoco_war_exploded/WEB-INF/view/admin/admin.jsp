<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HIKOCO :: DASHBOARD</title>
    <!-- Bootstrap 4.1.1 & jQuery-Slim -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
          integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
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
        .list-group > a {
            font-size: 12px;
        }
        thead > tr > th, thead > tr > td{
            font-size:0.8em;
        }
        tbody > tr > th, tbody > tr > td{
            font-size:0.75em;
        }
        .small-title{
            padding-left:3px;
            font-size:0.9em;
            font-weight: 500;
        }
        .admin-module{
            width:100% !important;
            display: inline-block;
            margin-bottom:10px;
            padding:0px 10px 0px 0px;
        }
        /* 아이템 이름이 너무 길때 ... 로 축약하는 방법. 중요 */
        td{
            max-width: 100px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        th{
            padding-left:10px !important;
        }
        /*div[id^="recent-"]{*/
            /*border:1px solid #5d5d5d;*/
        /*}*/
        thead{
            background: #ddd;
        }
        .admin-a{
            color: #000;
        }
        .admin-a:hover{
            color: #5d5d5d;
            text-decoration: none;
        }
    </style>
</head>
<body>
<%@include file="layout/admin_navbar.jsp"%>
<div style="margin:0 auto; display:inline-block">
    <%@ include file="layout/admin_left.jsp" %>
    <div class="col-md-10" style="float:left; overflow-x:hidden; padding:10px 20px 10px 20px;">
        <span style="font-size:2.5em; font-weight:200;">Dashboard</span>
        <hr style="margin-top:0;"/>
        <!-- 첫번째 줄 -->
        <div class="admin-module">
            <div id="recent-member" class="col-md-6" style="float:left;">
                <%-- 그냥 컨트롤러에서 갯수를 받아오는게 훨씬 빠를 듯... --%>
                <c:set var="veryLastCnt" value="0}"/>
                <c:forEach items="${recentMemberList}" varStatus="status" var="memberList">
                    <c:set var="veryLastCnt" value="${status.index}"/>
                </c:forEach>
                <span class="small-title" style="">최근 가입한 회원</span>
                <a class="admin-a" href="/admin/admin_member" style="float:right;"><span style="font-size:0.8em;">&#43;&nbsp;more</span></a>
                <hr style="margin-top:0; display:block;"/>
                <div style="padding:0 5px;">
                    <c:choose>
                        <c:when test="${veryLastCnt eq 0}">
                            <div class="text-center" style="height:164px; margin-bottom:16px; padding:50px 0;">
                                <span style="font-size:1.5em; font-weight:400; display:block;">회원이 없습니다!</span>
                                <span style="font-size:0.8em; font-weight:400; color:#5d5d5d; line-height:0px;">현재 관리자는 조회대상에서 제외되었습니다.</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">닉네임</th>
                                    <th scope="col">가입일자</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="i" begin="0" end="4">
                                    <c:choose>
                                        <c:when test="${i > veryLastCnt}">
                                            <tr style="background: #eee;">
                                                <th scope="row">&nbsp;</th>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <th scope="row">${recentMemberList.get(i).id}</th>
                                                <td>${recentMemberList.get(i).realname}</td>
                                                <td>${recentMemberList.get(i).nickname}</td>
                                                <td>${recentMemberList.get(i).regdate}</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
            <div id="recent-item" class="col-md-6" style="float:left;">
                <span class="small-title">최근 등록된 물품</span>
                <a class="admin-a" href="#" style="float:right;"><span style="font-size:0.8em;">&#43;&nbsp;more</span></a>
                <hr style="margin-top:0;"/>
                <div style="padding:0 5px;">
                    <table class="table table-sm">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">물품명</th>
                            <th scope="col">가격</th>
                            <th scope="col">등록시간</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%--      현재시각 구분을 위한 변수 지정     --%>
                        <c:set var = "now" value = "<%=new java.util.Date()%>" />
                        <fmt:formatDate var="currentYear" value="${now}" pattern="yyyy"/>
                        <%--------------------------------------%>
                        <c:forEach var="i" items="${recentItemList}">
                            <fmt:formatNumber var="itemPrice" value="${i.item_price}" type="currency" currencySymbol=""/>
                            <fmt:formatDate var="itemYear" value="${i.item_upload_date}" pattern="yyyy"/>
                            <c:choose>
                                <%-- 스타일만 변경하는 방법이 있음. 확인할 것. --%>
                                <c:when test="${itemPrice eq '0'}">
                                    <tr style="background: lightsalmon;">
                                        <th scope="row">${i.item_id}</th>
                                        <td>${i.item_title}</td>
                                        <td>${itemPrice}원</td>
                                        <c:choose>
                                            <c:when test="${itemYear eq currentYear}">
                                                <td><fmt:formatDate value="${i.item_upload_date}" pattern="MM월 dd일 HH시 mm분 ss초"/> </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><fmt:formatDate value="${i.item_upload_date}" pattern="yy년 MM월 dd일 HH시 mm분 ss초"/> </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <th scope="row">${i.item_id}</th>
                                        <td>${i.item_title}</td>
                                        <td>${itemPrice}원</td>
                                        <c:choose>
                                            <c:when test="${itemYear eq currentYear}">
                                                <td><fmt:formatDate value="${i.item_upload_date}" pattern="MM월 dd일 HH시 mm분 ss초"/> </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><fmt:formatDate value="${i.item_upload_date}" pattern="yy년 MM월 dd일 HH시 mm분 ss초"/> </td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!-- 두번째 줄 -->
        <div class="admin-module">
            <div id="recent-event" class="col-md-6" style="float:left;">
                <%-- 그냥 컨트롤러에서 갯수를 받아오는게 훨씬 빠를 듯... --%>
                <c:set var="veryLastCnt2" value="0}"/>
                <c:forEach items="${recentMemberList}" varStatus="status2" var="memberList">
                    <c:set var="veryLastCnt2" value="${status2.index}"/>
                </c:forEach>
                <span class="small-title">진행 중인 이벤트</span>
                <a class="admin-a" href="#" style="float:right;"><span style="font-size:0.8em;">&#43;&nbsp;more</span></a>
                <hr style="margin-top:0; display:block;"/>
                <div style="padding:0 5px;">
                    <c:choose>
                        <c:when test="${veryLastCnt2 ne 0}">
                            <div class="text-center" style="height:164px; margin-bottom:16px; padding:50px 0;">
                                <span style="font-size:1.5em; font-weight:400; display:block;">진행중인 이벤트가 없습니다!</span>
                                <button class="btn btn-sm btn-warning btn-fontsize" style="margin-top:10px;">이벤트 등록하기</button>
                                <%--<span style="font-size:0.8em; font-weight:400; color:#5d5d5d; line-height:0px;">관리자는 조회대상에서 제외되었습니다.</span>--%>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">닉네임</th>
                                    <th scope="col">가입일자</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="i" begin="0" end="4">
                                    <c:choose>
                                        <c:when test="${i > veryLastCnt2}">
                                            <tr style="background: #eee;">
                                                <th scope="row">&nbsp;</th>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <th scope="row">${recentMemberList.get(i).id}</th>
                                                <td>${recentMemberList.get(i).realname}</td>
                                                <td>${recentMemberList.get(i).nickname}</td>
                                                <td>${recentMemberList.get(i).regdate}</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
            <div id="recent-qna" class="col-md-6" style="float:left;">
                <%-- 그냥 컨트롤러에서 갯수를 받아오는게 훨씬 빠를 듯... --%>
                <c:set var="veryLastCnt3" value="0}"/>
                <c:forEach items="${recentMemberList}" varStatus="status3" var="memberList">
                    <c:set var="veryLastCnt3" value="${status3.index}"/>
                </c:forEach>
                <span class="small-title">문의사항</span>
                <a class="admin-a" href="#" style="float:right;"><span style="font-size:0.8em;">&#43;&nbsp;more</span></a>
                <hr style="margin-top:0;"/>
                <div style="padding:0 5px;">
                    <c:choose>
                        <c:when test="${veryLastCnt3 ne 0}">
                            <div class="text-center" style="height:164px; margin-bottom:16px; padding:50px 0;">
                                <span style="font-size:1.5em; font-weight:400; display:block;">등록된 Q&A가 없습니다!</span>
                                <button class="btn btn-sm btn-warning btn-fontsize" style="margin-top:10px;">Q&A 상세검색</button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">닉네임</th>
                                    <th scope="col">가입일자</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="i" begin="0" end="4">
                                    <c:choose>
                                        <c:when test="${i > veryLastCnt}">
                                            <tr style="background: #eee;">
                                                <th scope="row">&nbsp;</th>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <th scope="row">${recentMemberList.get(i).id}</th>
                                                <td>${recentMemberList.get(i).realname}</td>
                                                <td>${recentMemberList.get(i).nickname}</td>
                                                <td>${recentMemberList.get(i).regdate}</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
        <!-- 세번째 줄 -->
        <div class="admin-module">
            <div id="recent-board" class="col-md-6" style="float:left;">
                <%-- 그냥 컨트롤러에서 갯수를 받아오는게 훨씬 빠를 듯... --%>
                <c:set var="veryLastCnt2" value="0}"/>
                <c:forEach items="${recentMemberList}" varStatus="status2" var="memberList">
                    <c:set var="veryLastCnt2" value="${status2.index}"/>
                </c:forEach>
                <span class="small-title">최근 등록된 게시글</span>
                <a class="admin-a" href="#" style="float:right;"><span style="font-size:0.8em;">&#43;&nbsp;more</span></a>
                <hr style="margin-top:0; display:block;"/>
                <div style="padding:0 5px;">
                    <c:choose>
                        <c:when test="${veryLastCnt2 ne 0}">
                            <div class="text-center" style="height:164px; margin-bottom:16px; padding:50px 0;">
                                <span style="font-size:1.5em; font-weight:400; display:block;">게시글이 없습니다!</span>
                                <span style="font-size:0.8em; font-weight:400; color:#5d5d5d; line-height:0px;">관리자는 조회대상에서 제외되었습니다.</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">닉네임</th>
                                    <th scope="col">가입일자</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="i" begin="0" end="4">
                                    <c:choose>
                                        <c:when test="${i > veryLastCnt2}">
                                            <tr style="background: #eee;">
                                                <th scope="row">&nbsp;</th>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <th scope="row">${recentMemberList.get(i).id}</th>
                                                <td>${recentMemberList.get(i).realname}</td>
                                                <td>${recentMemberList.get(i).nickname}</td>
                                                <td>${recentMemberList.get(i).regdate}</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
            <div id="recent-report" class="col-md-6" style="float:left;">
                <%-- 그냥 컨트롤러에서 갯수를 받아오는게 훨씬 빠를 듯... --%>
                <c:set var="veryLastCnt3" value="0}"/>
                <c:forEach items="${recentMemberList}" varStatus="status3" var="memberList">
                    <c:set var="veryLastCnt3" value="${status3.index}"/>
                </c:forEach>
                <span class="small-title">신고내역</span>
                <a class="admin-a" href="#" style="float:right;"><span style="font-size:0.8em;">&#43;&nbsp;more</span></a>
                <hr style="margin-top:0;"/>
                <div style="padding:0 5px;">
                    <c:choose>
                        <c:when test="${veryLastCnt3 ne 0}">
                            <div class="text-center" style="height:164px; margin-bottom:16px; padding:50px 0;">
                                <span style="font-size:1.5em; font-weight:400; display:block;">신고된 회원/물품/게시글이 없습니다!</span>
                                <span style="font-size:0.8em; font-weight:400; color:#5d5d5d; line-height:0px;">관리자는 조회대상에서 제외되었습니다.</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-sm">
                                <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">이름</th>
                                    <th scope="col">닉네임</th>
                                    <th scope="col">가입일자</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="i" begin="0" end="4">
                                    <c:choose>
                                        <c:when test="${i > veryLastCnt}">
                                            <tr style="background: #eee;">
                                                <th scope="row">&nbsp;</th>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <th scope="row">${recentMemberList.get(i).id}</th>
                                                <td>${recentMemberList.get(i).realname}</td>
                                                <td>${recentMemberList.get(i).nickname}</td>
                                                <td>${recentMemberList.get(i).regdate}</td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="./layout/admin_footer.jsp" %>
</body>
</html>
