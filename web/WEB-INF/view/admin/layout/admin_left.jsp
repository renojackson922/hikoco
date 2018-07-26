<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" %>
<%
    String currentIP = request.getRemoteAddr();
%>
<style>
    .span-loginInfo{
        display: block;
        font-size: 0.8em;
        font-weight:400;
    }
    .list-group-item:first-child{
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }
    .list-group-item:last-child{
        border-bottom-left-radius: 0;
        border-bottom-right-radius: 0;
    }
</style>
<div class="col-md-2" style="float:left; padding:0;">
    <div class="text-center" style="height:200px; width:inherit;">
        <img src="/resources/imgs/margarette.png" width="100%" height="100%">
    </div>
    <div style="padding:5px; border-right:1px solid #ddd;">
        <%--<p class="span-loginInfo">${member.nickname}(${member.realname})님의 등급은&nbsp;${member.tier}입니다.</p>--%>
        <%--<span class="span-loginInfo" style="font-size:10px; padding:0px 5px 0px 5px; background: #2897d3; color:#fff;--%>
        <%--border-radius:4px; display: inline-block;">관리자</span>--%>
        <span class="span-loginInfo"><strong>${currentUser.nickname}(${currentUser.realname})</strong></span>
        <span class="span-loginInfo">${currentUser.tier}</span>
        <span class="span-loginInfo">현재 접속한 IP주소: <%=currentIP%></span>
        <div class="text-center" style="padding:5px 0 5px 0;">
            <button class="btn btn-sm btn-warning" onclick="">정보수정</button>
            <button class="btn btn-sm btn-warning" onclick="window.location.href='/logout'">로그아웃</button>
        </div>
    </div>
    <div class="list-group">
        <a href="/admin" class="list-group-item list-group-item-action">대시보드</a>
        <a href="/admin/admin_member" class="list-group-item list-group-item-action">회원 관리</a>
        <a href="/admin/admin_tx" class="list-group-item list-group-item-action">거래 관리</a>
        <a href="/admin/admin_market" class="list-group-item list-group-item-action">글 관리</a>
    </div>
    <div style="border-right:1px solid #ddd;">

    </div>
</div>