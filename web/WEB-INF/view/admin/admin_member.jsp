<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*,
                 org.silkdog.maven.hikoco.member.dao.*,
                 org.silkdog.maven.hikoco.member.vo.*" %>

<!DOCTYPE html>
<html ng-cloak ng-app="app">
<head>
    <meta charset="UTF-8">
    <title>HIKOCO :: ADMIN</title>
    <!-- Vue.js Development // Angular.js instead -->
    <%--<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
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
        .pubg-left {

        }

        .pubg-right {
            padding-bottom: 15px;
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

        th, td {
            font-size: 12px;
        }

        thead {
            background-color: #ddd;
        }

        input, label {
            font-size: 12px;
        }

    </style>
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

        });
    </script>
</head>
<body ng-controller="ctrl">
<div class="container" style="border:1px solid #ddd; margin-top:20px; padding:15px 15px 0px 0px; height:700px;">
    <%@ include file="./layout/admin_left.jsp" %>
    <div class="pubg-right col-md-10 text-center" style="float:left; overflow-x:hidden; border:1px solid #ddd;">
        <span style="font-size:44px;"><strong>MemberList</strong></span>
        <p>회원을 관리하는 페이지 입니다.</p>
        <div class="text-right" style="margin-bottom:10px; padding-right:10px;">
            <span style="font-size:12px;">페이지 수 :&nbsp;</span>
            <input type="text" id="pageNum" size="1" maxlength="3" value="10" style="font-size:12px;">
        </div>
        <div>
            <table class="table table-bordered" style="margin-bottom:5px;">
                <thead>
                <tr>
                    <th scope="col"><input id="selectall" type="checkbox"></th>
                    <th scope="col">#</th>
                    <th scope="col">아이디(이메일)</th>
                    <th scope="col">이름</th>
                    <th scope="col">닉네임</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">등급</th>
                    <th scope="col">가입일</th>
                    <th scope="col">수정</th>
                    <th scope="col">삭제</th>
                </tr>
                </thead>
                <tbody>
                <style>
                    .td-disabled, .th-disabled{
                        color:#ddd;
                    }
                </style>
                <c:forEach var="i" items="${memberList}" >
                    <c:choose>
                        <c:when test="${i.get('userid') eq currentUser.userid}">
                            <%--<tr>--%>
                                <%--<td><input type="checkbox" disabled></td>--%>
                                <%--<th class="th-disabled" scope="row">${i.get("id")}--%>
                                <%--</th>--%>
                                <%--<td class="td-disabled">${i.get("userid")}--%>
                                <%--</td>--%>
                                <%--<td class="td-disabled">${i.get("realname")}--%>
                                <%--</td>--%>
                                <%--<td class="td-disabled">${i.get("nickname")}--%>
                                <%--</td>--%>
                                <%--<td class="td-disabled">${i.get("phone")}--%>
                                <%--</td>--%>
                                <%--<td class="td-disabled">${i.get("tier")}--%>
                                <%--</td>--%>
                                <%--<td class="td-disabled">${i.get("regdate")}--%>
                                <%--</td>--%>
                                <%--<td class="td-disabled"><i class="fas fa-wrench"></i></td>--%>
                                <%--<td class="td-disabled"><i class="fas fa-trash-alt"></i></td>--%>
                            <%--</tr>--%>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td><input type="checkbox"></td>
                                <th scope="row">${i.get("id")}
                                </th>
                                <td>${i.get("userid")}
                                </td>
                                <td>${i.get("realname")}
                                </td>
                                <td>${i.get("nickname")}
                                </td>
                                <td>${i.get("phone")}
                                </td>
                                <td>${i.get("tier")}
                                </td>
                                <td>${i.get("regdate")}
                                </td>
                                <td><a href="#" onclick="editPopup(${i.get("id")})"><i class="fas fa-wrench"></i></a></td>
                                <td><a href="#" onclick=""><i class="fas fa-trash-alt"></i></a></td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                </tbody>
            </table>
            <div class="text-left" style="padding-left:10px;"> <!-- 일괄삭제 -->
                <a href="#" onclick="deleteSelected()"><span
                        style="font-size:12px; text-align:left;">선택한 항목을 일괄 삭제</span></a>
            </div>
        </div>
        <div>
            <span style="display:block; font-size:12px; text-align:center; margin-bottom:15px;"><strong>[1]</strong></span>
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

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">정보 수정</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="formfix" action="admin_member.do" method="post">
                <div class="modal-body" style="width:500px; height:500px;">
                    <!-- form -->
                    <div class="form-group">
                        <label for="id">아이디</label>
                        <input type="text" class="form-control" id="id" name="id" value="admin@admin.io" readonly>
                    </div>
                    <div class="form-group">
                        <label for="pw">비밀번호</label>
                        <input type="password" class="form-control" id="pw" name="pw" value="!@$cjaalfalf9" readonly>
                    </div>
                    <div class="form-group">
                        <label for="name">이름</label>
                        <input type="text" class="form-control" id="name" name="name" value="전은표" readonly>
                    </div>
                    <div class="form-group">
                        <label for="tel">전화번호</label>
                        <input type="text" class="form-control" id="tel" name="tel" value="+821077311268">
                    </div>
                    <div class="form-group">
                        <label for="tier">등급</label>
                        <select class="custom-select" id="tier" style="display:block;">
                            <option selected>선택하세요</option>
                            <option value="1">브론즈</option>
                            <option value="2">실버</option>
                            <option value="3">골드</option>
                            <option value="4">플래티넘</option>
                            <option value="5">다이아몬드</option>
                        </select>
                    </div>
                    <!-- /form -->
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="font-size:12px;">취소
                    </button>
                    <button type="submit" class="btn btn-primary" style="font-size:12px;">저장 및 적용</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
<script>
    function editPopup(param){
        // var url = "/memberedit?id=" + param;
        var url = "/admin/auth?id=" + param;
        var pop = window.open(url, "pop","width=570, height=420, scrollbars=yes, resizable=yes");

    }

    // function open_pop(arg1, arg2){
    //     var frmPop= document.frmPopup;
    //     var url = 'popup.php';
    //     window.open('','popupView','옵션');
    //
    //     frmPop.action = url;
    //     frmPop.target = 'popupView'; //window,open()의 두번째 인수와 같아야 하며 필수다.
    //     frmPop.arg1.value = arg1;
    //     frmPop.arg2.value = arg2;
    //     frmPop.submit();
    //
    // }


    // check-all script
    $('#selectall').change(function () {
        if ($(this).prop('checked')) {
            $('input').prop('checked', true);
        } else {
            $('input').prop('checked', false);
        }
    });
    $('#selectall').trigger('change');

    // Fix Event
    function doFix(num) {

    }

    // Delete Message Event
    function doDelete(num) {
        alert('Are you really gonna delete this item?')
        alert(num)
    }

    // deleteSelected Event
    function deleteSelected() {
        alert('Are you sure to delete all selected items?')
        alert('fuck it')
    }

    // // Modal pop-up Event
    // $('#myModal').on('shown.bs.modal', function () {
    //     $('#myInput').trigger('focus')
    // })

    // PageNum number only
    $(document).ready(function () {
        $("#pageNum").keydown(function (e) {
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
</script>
</html>
