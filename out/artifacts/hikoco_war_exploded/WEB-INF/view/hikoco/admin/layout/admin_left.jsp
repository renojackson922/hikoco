<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%
    String currentIP = request.getRemoteAddr();
%>
<style>
    .list-group > a {
        font-size: 12px;
    }
    .span-loginInfo{
        display: block;
        font-size: 0.8em;
        font-weight:300;
        color:#fff;
    }
    .list-group-item:first-child{
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }
    .list-group-item:last-child{
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
    }
    .btn-fontsize{
        font-size:0.8em;
    }
    .flex-test{
        display: flex;
        flex-flow: column;
        height: 200px;
        /*overflow-y: hidden;*/
        flex: 1 1 auto;
    }
</style>
<div class="col-md-2" style="float:left; height:100%; margin:0; padding:0; max-width:235px !important;">
    <div class="text-center" style="height:200px; width:inherit; padding:10px; background: #212529;">
        <img src="/resources/imgs/margarette.png" width="100%" height="100%">
    </div>
    <div style="padding:5px 10px 5px 10px;  background: #212529;">
        <%--<p class="span-loginInfo">${member.nickname}(${member.realname})님의 등급은&nbsp;${member.tier}입니다.</p>--%>
        <%--<span class="span-loginInfo" style="font-size:10px; padding:0px 5px 0px 5px; background: #2897d3; color:#fff;--%>
        <%--border-radius:4px; display: inline-block;">관리자</span>--%>
        <span class="span-loginInfo"><strong>${currentUser.nickname}(${currentUser.realname})</strong></span>
        <span class="span-loginInfo">${currentUser.tier}</span>
        <span class="span-loginInfo">현재 접속한 IP주소: <%=currentIP%></span>
        <div class="text-center" style="padding:10px 0 10px 0;">
            <button class="btn btn-sm btn-warning btn-fontsize" onclick="">정보수정</button>
            <button class="btn btn-sm btn-warning btn-fontsize" onclick="window.location.href='/logout'">로그아웃</button>
        </div>
    </div>
    <div class="list-group">
        <a href="/shop/admin" class="list-group-item list-group-item-action">대시보드</a>
        <a href="/shop/admin/admin_member" class="list-group-item list-group-item-action">회원 관리</a>
        <a href="/shop/admin/admin_item" class="list-group-item list-group-item-action">물품 관리</a>
        <a href="/shop/admin/admin_tx" class="list-group-item list-group-item-action">거래 관리</a>
        <a href="/shop/admin/admin_market" class="list-group-item list-group-item-action">글 관리</a>
    </div>
    <div class="flex-test" style="border-right:1px solid #ddd;">
    </div>
</div>