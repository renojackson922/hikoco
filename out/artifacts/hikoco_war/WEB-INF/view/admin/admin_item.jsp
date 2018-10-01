<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<html>
<head>
    <title>HIKOCO :: DASHBOARD - ITEM</title>
    <%@include file="../essential/base.jsp"%>
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

        thead{
            background: #000;
        }
        thead > tr > th {
            text-align: center;
            color:#fff;
            font-weight:400;
        }
        tbody > tr > td{
            text-align: center;
        }
        td > a{
            color: #212529;
        }
        td > a:hover{
            text-decoration: none;
            color: #ddd;
        }
    </style>
</head>
<body>
<%@include file="./layout/admin_navbar.jsp"%>
<div style="margin:0 auto; width:100%; display:inline-block">
    <%@include file="./layout/admin_left.jsp"%>
    <div class="col-md-10" style="width:100%; margin:0; padding:10px 20px 10px 20px; float:left; overflow-x:hidden;">
        <span style="font-size:2.5em; font-weight:200;">Item Management</span>
        <hr style="margin-top:0;"/>
        <div class="text-right" style="margin-bottom:10px; padding-right:10px;">
            <span style="font-size:12px;">페이지 수 :&nbsp;</span>
            <input type="text" id="pageNum" size="1" maxlength="3" value="10" style="font-size:12px;">
        </div>
        <table class="table table-bordered" width="100%">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">카테고리</th>
                    <th scope="col" colspan="2">이름</th>
                    <th scope="col">제조사</th>
                    <th scope="col">유통사</th>
                    <th scope="col">가격</th>
                    <th scope="col">등록일</th>
                    <th scope="col">수정</th>
                    <th scope="col">식제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="i" items="${fullItemList}">
                <tr>
                    <th class="text-center" scope="row">${i.item_id}</th>
                    <td>&nbsp;</td>
                    <td colspan="2"><a href="javascript:void(0)" onclick="viewItem(${i.item_id})">${i.item_title}</a></td>
                    <td>${i.item_manu}</td>
                    <td>${i.item_vendor}</td>
                    <td><fmt:formatNumber value="${i.item_price}" type="currency" currencySymbol=""/>원</td>
                    <td><fmt:formatDate value="${i.item_upload_date}" pattern="yy-dd-mm"/> </td>
                    <td><a href="javascript:void(0)" onclick="editPopup(${i.item_id})"><i class="fas fa-wrench"></i></a></td>
                    <td><a href="javascript:void(0)" onclick=""><i class="fas fa-trash-alt"></i></a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <div>
            <a class="btn btn-sm btn-warning" href="#">물품 등록하기</a>
            <%--<a class="btn btn-sm btn-warning" href="#">물품 등록하기</a>--%>
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
<%--<%@include file="./layout/admin_footer.jsp"%>--%>
</body>
<script>
    function editPopup(param){
        // var url = "/memberedit?id=" + param;
        var url = "/admin/auth?item_id=" + param;
        var pop = window.open(url, "pop","width=570, height=420, scrollbars=yes, resizable=yes");
    }

    function viewItem(param){
        var url = "/item/" + param + '?check=popup';
        var width = window.screen.availWidth * 0.8;
        var height = window.screen.availHeight * 0.8;
        var pop = window.open(url, "pop", 'width='+ width + ', height='+ height + ', scrollbars=yes, resizable=yes');
    }
</script>
</html>
