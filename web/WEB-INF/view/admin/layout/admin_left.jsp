    <%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
        <style>
        .span-loginInfo{
        display: block;
        font-size: 12px;
        /*margin:2px 0px 2px 0px;*/
        }
        </style>
        <div class="pubg-left col-md-2" style="float:left;">
        <div class="text-center" style="border:1px solid #ddd; height:150px; margin-bottom:10px; padding:15px 5px 5px
        5px;">
        <%--<span><strong>로그인 정보</strong></span>--%>
        <img src="/resources/imgs/margarette.png" width="50px">
        <span class="span-loginInfo">${member.nickname}</span>
        <span class="span-loginInfo">${member.tier}</span>
        <span class="span-loginInfo" style="font-size:10px; padding:0px 5px 0px 5px; background: #2897d3; color:#fff;
        border-radius:4px; display: inline-block;">관리자</span>
        </div>
        <div class="list-group">
        <a href="admin_member.do" class="list-group-item list-group-item-action">회원 관리</a>
        <a href="admin_tx.do" class="list-group-item list-group-item-action">거래 관리</a>
        <a href="admin_market.do" class="list-group-item list-group-item-action">글 관리</a>
        </div>
        </div>